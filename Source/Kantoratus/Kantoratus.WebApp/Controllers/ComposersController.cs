using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class ComposersController : BaseController
    {
        public ComposersController(Context context) : base(context)
        {
        }
        public IActionResult Index()
        {
            return View(Persistence.GetComposers(null));
        }
    }
}
