using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class PlaylistsController : BaseController
    {
        public PlaylistsController(Context context) : base(context)
        {
        }

        public IActionResult Index()
        {
            return View(Persistence.GetPlayLists(null));
        }
    }
}