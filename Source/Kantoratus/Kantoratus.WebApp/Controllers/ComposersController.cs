using System.Globalization;
using Kantoratus.Domain;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Kantoratus.WebApp.Helpers;

namespace Kantoratus.WebApp.Controllers
{
    public class ComposersController : BaseController
    {
        public ComposersController(Context context) : base(context)
        {
        }
        public IActionResult Index()
        {
            return View(
                Context.Composers
                    .Select(c => c.Name.Substring(0, 1))
                    .ToList()
                    .Distinct(new CompareStringIgnoringAccents())
                    .Select(i => new Initial
                    {
                        Letter = GetFirstLetter(i),
                        Composers = Context.Composers
                            .ToList()
                            .Where(c => string.Compare(
                                c.Name.Substring(0, 1), 
                                i, 
                                CultureInfo.CurrentCulture, 
                                CompareOptions.IgnoreNonSpace) == 0)
                            .Select(c => c.Name)
                            .Select(c => new Composer
                            {
                                Name = c
                            })
                            .OrderBy(c => c.Name)
                    })
                    .OrderBy(i => i.Letter));
        }
    }
}
