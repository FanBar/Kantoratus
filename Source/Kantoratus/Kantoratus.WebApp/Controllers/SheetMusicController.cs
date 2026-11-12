using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class SheetMusicController : BaseController
    {
        public SheetMusicController(Context context) : base(context)
        {
        }

        public IActionResult Index()
        {
            return View(Persistence.GetSheetMusicList());
        }

        [HttpGet("SheetMusic/{number}")]
        public IActionResult Details(string number)
        {
            return View(Persistence.GetSheetMusic(number));
        }
    }
}