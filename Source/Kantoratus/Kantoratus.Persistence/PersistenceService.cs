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
                            p.Composer.Substring(0, 1),
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
                        .Select(m => m.Name)
                        .Select(m => new Category
                        {
                            Name = m
                        })
                        .OrderBy(c => c.Name)
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
                .OrderBy(e => e.Order)
                .ToList()
                .Select(e => new Event
                {
                    Images = GetImages(e.ImageFolder),
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
                .Replace("/*", "</i>").Replace("*", "<i>");

            return Regex.Replace(text, @"\[([^]]*)\]\(([^\s^\)]*)[\s\)]", @"<a href='$2' target='_blank'>$1</a>");
        }

        private static char GetFirstLetter(string word)
        {
            return Encoding.UTF8.GetString(Encoding.GetEncoding("ISO-8859-8").GetBytes(word)).Single();
        }

        private static IEnumerable<string> GetImages(string imageFolder)
        {
            try
            {
                return Directory
                    .GetFiles($@".\wwwroot\img\Content\{imageFolder}")
                    .Select(f => @$"img\Content\{imageFolder}\{Path.GetFileName(f)}");
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

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
