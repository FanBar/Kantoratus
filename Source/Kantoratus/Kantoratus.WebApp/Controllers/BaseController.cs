using System.Linq;
using System.Text;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.WebApp.Controllers
{
    public class BaseController : Controller
    {
        protected readonly Context Context;

        public BaseController(Context context)
        {
            Context = context;
            Context.Database.Migrate();
        }

        protected static char GetFirstLetter(string word)
        {
            return Encoding.UTF8.GetString(Encoding.GetEncoding("ISO-8859-8").GetBytes(word)).Single();
        }

        protected override void Dispose(bool disposing)
        {
            Context.Dispose();
            base.Dispose(disposing);
        }
    }
}
