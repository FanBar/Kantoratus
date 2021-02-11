using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class PiecesController : BaseController
    {
        public PiecesController(Context context) : base(context)
        {
        }

        public IActionResult Index()
        {
            return View(Persistence.GetPieces(null));
        }
    }
}
