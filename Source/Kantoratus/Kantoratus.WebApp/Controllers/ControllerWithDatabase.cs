using System;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.WebApp.Controllers
{
    public class ControllerWithDatabase : Controller, IDisposable
    {
        protected readonly Context Context;

        public ControllerWithDatabase(Context context)
        {
            Context = context;
            context.Database.Migrate();
        }

        protected override void Dispose(bool disposing)
        {
            Context.Dispose();
            base.Dispose(disposing);
        }
    }
}
