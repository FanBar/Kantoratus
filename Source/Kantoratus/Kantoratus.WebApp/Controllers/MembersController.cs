using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class MembersController : BaseController
    {
        public MembersController(Context context) : base(context)
        {
        }
        public IActionResult Index()
        {
            return View(Persistence.GetMembers(null));
        }
    }
}
