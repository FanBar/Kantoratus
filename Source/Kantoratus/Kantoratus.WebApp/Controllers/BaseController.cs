using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class BaseController : Controller
    {
        protected readonly PersistenceService Persistence;

        public BaseController(Context context)
        {
            Persistence = new PersistenceService(context);
        }

        protected override void Dispose(bool disposing)
        {
            Persistence.Dispose();
            base.Dispose(disposing);
        }
    }
}
