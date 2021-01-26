using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Kantoratus.Domain;
using Kantoratus.Persistence;
using Kantoratus.Persistence.Entities;
using Kantoratus.WebApp.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace Kantoratus.WebApp.Controllers
{
    public class PiecesController : ControllerWithDatabase
    {
        public PiecesController(Context context) : base(context)
        {
        }

        public IActionResult Index()
        {
            return View(Context.Pieces
                .Select(p => p.Composer.Substring(0, 1))
                .ToList()
                .Distinct(new CompareStringIgnoringAccents())
                .Select(i => new Initial
                {
                    Letter = i.Single(),
                    Composers = Context.Pieces
                        .ToList()
                        .Where(p => string.Compare(p.Composer.Substring(0, 1), i, CultureInfo.CurrentCulture, CompareOptions.IgnoreNonSpace) == 0)
                        .Select(p => p.Composer)
                        .Distinct()
                        .Select(c => new Composer
                        {
                            Name = c,
                            Pieces = Context.Pieces.Where(p => p.Composer == c).Select(p => p.Title)
                        })
                }));
        }
    }
}
