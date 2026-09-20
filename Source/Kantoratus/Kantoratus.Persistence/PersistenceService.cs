using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Kantoratus.Domain;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.Persistence
{
    public class PersistenceService : IDisposable
    {
        private readonly Context _context;

        public PersistenceService(Context context)
        {
            _context = context;
            _context.Database.Migrate();
        }

        public List<PlayList> GetPlayLists(string query)
        {
            var playlists = _context.PlayLists
                .ToList()
                .Select(p => new PlayList
                {
                    Description = ReplaceTags(p.Description),
                    YouTubeId = p.YouTubeId,
                    Name = p.Name
                });

            if (query != null)
            {
                playlists = playlists.Where(p => p.Name.Contains(query) || p.Description.Contains(query));
            }

            return playlists.ToList();
        }

        public List<Initial> GetPieces(string query)
        {
            var pieces = string.IsNullOrEmpty(query)
                ? _context.Pieces
                : _context.Pieces.Where(p => p.Composer.Contains(query) || p.Title.Contains(query));

            return pieces
                .Select(p => p.Composer.Substring(0, 1))
                .ToList()
                .Distinct(new CompareStringIgnoringAccents())
                .Select(i => new Initial
                {
                    Letter = GetFirstLetter(i),
                    Categories = pieces
                        .ToList()
                        .Where(p => string.Compare(
                            p.Composer.Substring(0, 1).ToUpper(),
                            i,
                            CultureInfo.CurrentCulture,
                            CompareOptions.IgnoreNonSpace) == 0)
                        .Select(p => p.Composer)
                        .Distinct()
                        .Select(c => new Category
                        {
                            Name = c,
                            Items = pieces.Where(p => p.Composer == c).Select(p => p.Title).OrderBy(p => p)
                        })
                        .OrderBy(c => c.Name)
                })
                .OrderBy(i => i.Letter)
                .ToList();
        }

        public List<Initial> GetComposers(string query)
        {
            var composers = string.IsNullOrEmpty(query)
                ? _context.Composers
                : _context.Composers.Where(c => c.Name.Contains(query));

            return composers
                .Select(c => c.Name.Substring(0, 1))
                .ToList()
                .Distinct(new CompareStringIgnoringAccents())
                .Select(i => new Initial
                {
                    Letter = GetFirstLetter(i),
                    Categories = composers
                        .ToList()
                        .Where(c => string.Compare(
                            c.Name.Substring(0, 1),
                            i,
                            CultureInfo.CurrentCulture,
                            CompareOptions.IgnoreNonSpace) == 0)
                        .Select(c => c.Name)
                        .Select(c => new Category
                        {
                            Name = c
                        })
                        .OrderBy(c => c.Name)
                })
                .OrderBy(i => i.Letter)
                .ToList();
        }

        public List<Initial> GetMembers(string query)
        {
            var members = string.IsNullOrEmpty(query)
                ? _context.Members
                : _context.Members.Where(c => c.Name.Contains(query));

            return members
                .Select(c => c.Name.Substring(0, 1))
                .ToList()
                .Distinct(new CompareStringIgnoringAccents())
                .Select(i => new Initial
                {
                    Letter = GetFirstLetter(i),
                    Categories = members
                        .ToList()
                        .Where(m => string.Compare(
                            m.Name.Substring(0, 1),
                            i,
                            CultureInfo.CurrentCulture,
                            CompareOptions.IgnoreNonSpace) == 0)
                        .OrderBy(m => m.Name)
                        .Select(m => new Category
                        {
                            Name = $"{(m.IsDead ? "✝ " : string.Empty)}{m.Name}"
                        })
                })
                .OrderBy(i => i.Letter)
                .ToList();
        }

        public List<Event> GetEvents(string query, int? year)
        {
            var dbEvents = year.HasValue
                ? _context.Events.Where(e => e.Year == year)
                : _context.Events;

            var events = string.IsNullOrEmpty(query)
                ? dbEvents
                : dbEvents.Where(c =>
                    c.Title.Contains(query)
                    || c.Description.Contains(query)
                    || c.Date.Contains(query)
                    || c.Location.Contains(query));

            return events
                .OrderBy(e => e.Year)
                .ThenBy(e => e.Order)
                .ToList()
                .Select(e => new Event
                {
                    Images = GetImages($@"Events\{e.ImageFolder}"),
                    Date = e.Date,
                    Title = e.Title,
                    Location = e.Location,
                    Description = ReplaceTags(e.Description),
                    IsArticle = e.IsArticle
                })
                .ToList();
        }

        private static string ReplaceTags(string text)
        {
            if (string.IsNullOrEmpty(text))
            {
                return null;
            }

            text = text
                .Replace("§", "</p>").Replace("¶", "<p>")
                .Replace("/####", "</h4>").Replace("####", "<h4>")
                .Replace("/**", "</b>").Replace("**", "<b>")
                .Replace("/*", "</i>").Replace("*", "<i>")
                .Replace(@"\", "</br>");

            return Regex.Replace(text, @"\[([^]]*)\]\(([^\s^\)]*)[\s\)]", @"<a href='$2' target='_blank'>$1</a>");
        }

        private static char GetFirstLetter(string word)
        {
            return char.ToUpper(Encoding.UTF8.GetString(Encoding.GetEncoding("ISO-8859-8").GetBytes(word)).Single());
        }

        private static IEnumerable<string> GetImages(string imageFolder)
        {
            try
            {
                return Directory
                    .GetFiles($@".\wwwroot\img\Content\{imageFolder}")
                    .Select(f => @$"\img\Content\{imageFolder}\{Path.GetFileName(f)}");
            }
            catch (System.Exception)
            {
                return new List<string>();
            }
        }

        public IEnumerable<int> GetYears()
        {
            return _context.Events.Select(e => e.Year).Distinct().OrderBy(e => e);
        }

        public Facts GetFacts()
        {
            var dbEntity = _context.Facts.Single();
            return new Facts
            {
                MemberCount = dbEntity.MemberCount,
                PieceCount = dbEntity.PieceCount,
                VespersCount = dbEntity.VespersCount,
                Age = DateTime.Now.Year - 1996
            };
        }

        public SheetMusic GetSheetMusic(string number)
        {
            // Order by numeric part, then suffix
            var sheetMusics = _context.SheetMusics
                .Include(s => s.SubChapter.Chapter)
                .ToList()
                .Select(s => (Entity: s, Key: ParseSheetMusicNumber(s.Number)))
                .OrderBy(x => x.Key.NumberPart).ThenBy(x => x.Key.Suffix)
                .Select(x => x.Entity)
                .ToList();

            var entity = sheetMusics.SingleOrDefault(s => s.Number == number);

            if (entity == null)
            {
                return null;
            }

            var index = sheetMusics.IndexOf(entity);

            return new SheetMusic
            {
                Number = entity.Number,
                Title = entity.Title ?? entity.OriginalTitle,
                Chapter = entity.SubChapter.Chapter.Name,
                SubChapter = entity.SubChapter.Name,
                Images = GetImages($@"SheetMusic\{entity.Number}"),
                Lyrics = ReplaceTags(entity.Lyrics),
                Origin = entity.Origin,
                HimnologicalData1 = entity.HimnologicalData1,
                HimnologicalData2 = entity.HimnologicalData2,
                Previous = index > 0 ? sheetMusics[index - 1].Number : null,
                Next = index < sheetMusics.Count - 1 ? sheetMusics[index + 1].Number : null
            };
        }

        public IEnumerable<Chapter> GetChapters()
        {
            return _context.Chapters.Select(c => new Chapter
            {

                Name = c.Name,
                SubChapters = c.SubChapters.Select(sc => new SubChapter
                {
                    Name = sc.Name,
                    SheetMusics = sc.SheetMusics.Select(sm => new SheetMusic
                    {
                        Number = sm.Number,
                        Title = sm.Title ?? sm.OriginalTitle,
                        OriginalTitle = sm.OriginalTitle == null || sm.OriginalTitle == ""
                            ? sm.Title
                            : sm.Title == null ? sm.OriginalTitle : sm.OriginalTitle + " / " + sm.Title
                    })
                })
            });
        }

        private static (int NumberPart, string Suffix) ParseSheetMusicNumber(string value)
        {
            if (string.IsNullOrEmpty(value))
                return (0, string.Empty);

            int i = 0;
            // Parse leading digits
            while (i < value.Length && char.IsDigit(value[i]))
            {
                i++;
            }

            int numberPart = i > 0 ? int.Parse(value[..i]) : 0;
            string suffix = i < value.Length ? value[i..] : string.Empty;

            return (numberPart, suffix);
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
