using System.Globalization;
using Kantoratus.Domain;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Kantoratus.WebApp.Helpers;

namespace Kantoratus.WebApp.Controllers
{
    public class MembersController : BaseController
    {
        public MembersController(Context context) : base(context)
        {
        }
        public IActionResult Index()
        {
            return View(Context.Members
                .Select(c => c.Name.Substring(0, 1))
                .ToList()
                .Distinct(new CompareStringIgnoringAccents())
                .Select(i => new Initial
                {
                    Letter = GetFirstLetter(i),
                    Categories = Context.Members
                        .ToList()
                        .Where(m => string.Compare(
                            m.Name.Substring(0, 1),
                            i,
                            CultureInfo.CurrentCulture,
                            CompareOptions.IgnoreNonSpace) == 0)
                        .Select(m => m.Name)
                        .Select(m => new Category
                        {
                            Name = m
                        })
                        .OrderBy(c => c.Name)
                })
                .OrderBy(i => i.Letter));
        }
    }
}
