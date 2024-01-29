using System.ComponentModel.DataAnnotations;

namespace Kantoratus.Persistence.Entities
{
    // TODO Migration
    public class Facts : Entity
    {
        [Required]
        public int MemberCount { get; set; }

        [Required]
        public int PieceCount { get; set; }

        [Required]
        public int VespersCount { get; set; }
    }
}
