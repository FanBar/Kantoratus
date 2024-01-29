using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class HomeController : BaseController
    {
        public HomeController(Context context) : base(context)
        {
        }

        public IActionResult Index()
        {
            return View(Persistence.GetFacts());
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View();
        }
    }
}
