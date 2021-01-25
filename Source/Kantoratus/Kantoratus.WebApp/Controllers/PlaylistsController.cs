using System.Collections.Generic;
using System.Linq;
using Kantoratus.Domain;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class PlaylistsController : ControllerWithDatabase
    {
        public PlaylistsController(Context context) : base(context)
        {
        }

        public IActionResult Index()
        {
            return View(Context.PlayLists.Select(p => new PlayListViewModel { Description = p.Description, YouTubeId = p.YouTubeId, Name = p.Name }).ToList());
        }
    }
}