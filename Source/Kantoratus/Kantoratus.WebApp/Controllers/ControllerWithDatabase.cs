using System;
using System.Net.Http;
using Kantoratus.Persistence;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.WebApp.Controllers
{
    public class ControllerWithDatabase : Controller
    {
        protected readonly Context Context;

        public ControllerWithDatabase(Context context)
        {
            Context = context;
            Context.Database.Migrate();
        }

        public string Message { get; set; }

        protected override void Dispose(bool disposing)
        {
            Context.Dispose();
            base.Dispose(disposing);
        }
    }
}
