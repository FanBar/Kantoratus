using Kantoratus.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.Persistence
{
    public class Context : DbContext
    {
        public Context(DbContextOptions options) : base(options)
        {
        }

        public DbSet<PlayList> PlayLists { get; set; }

        public DbSet<Piece> Pieces { get; set; }
    }
}
