using System.Collections.Generic;
using System.IO;
using System.Linq;
using Kantoratus.Domain;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class EventsController : BaseController
    {
        public EventsController(Context context) : base(context)
        {
        }
        public IActionResult Index(int? year = null)
        {
            var years = Context.Events.Select(e => e.Year).Distinct().OrderBy(e => e);

            if (!years.Any())
            {
                return View(new EventList { Years = new List<int>(), Events = new List<Event>() });
            }

            if (year == null)
            {
                year = years.Min();
            }

            return View(new EventList
            {
                ActiveYear = year.Value,
                Years = years.ToList(),
                Events = Context.Events
                    .Where(e => e.Year == year)
                    .OrderBy(e => e.Order)
                    .ToList()
                    .Select(e => new Event
                    {
                        Images = GetImages(e.ImageFolder),
                        Date = e.Date,
                        Title = e.Title,
                        Location = e.Location,
                        Description = e.Description?.Replace("¶", "<p>").Replace("§", "</p>"),
                        IsArticle = e.IsArticle
                    })
                    .ToList()
            });
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
    }
}
