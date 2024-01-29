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
        
        public DbSet<Composer> Composers { get; set; }
        
        public DbSet<Member> Members { get; set; }
        
        public DbSet<Event> Events { get; set; }

        public DbSet<Facts> Facts { get; set; } 
    }
}
