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

        public DbSet<SheetMusic> SheetMusics { get; set; }

        public DbSet<Chapter> Chapters { get; set; }

        public DbSet<SubChapter> SubChapters { get; set; }

        override protected void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("KFOLD_website");
            base.OnModelCreating(modelBuilder);
        }
    }
}