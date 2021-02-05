using Kantoratus.Domain;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class SearchController : BaseController
    {
        public SearchController(Context context) : base(context)
        {
        }

        public IActionResult Index(string query)
        {
            return View(string.IsNullOrEmpty(query)
                ? new SearchResults { Query = query }
                : new SearchResults
                {
                    Query = query,
                    PlayLists = Persistence.GetPlayLists(query),
                    Pieces = Persistence.GetPieces(query),
                    Composers = Persistence.GetComposers(query),
                    Members = Persistence.GetMembers(query),
                    Events = Persistence.GetEvents(query, null)
                });
        }
    }
}
