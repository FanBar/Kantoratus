using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.Persistence.Entities
{
    [Index(nameof(Composer), nameof(Title), IsUnique = true, Name = "UX_Pieces_ComposerTitle")]
    public class Piece : Entity
    {
        [Required]
        public string Composer { get; set; }

        [Required]
        public string Title { get; set; }
    }
}
