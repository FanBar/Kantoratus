using System.Collections.Generic;
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
            var years = Persistence.GetYears();

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
                Events = Persistence.GetEvents(null, year)
            });
        }
    }
}
