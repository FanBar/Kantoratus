using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.Persistence.Entities
{
    [Index(nameof(Name), Name = "UX_Composer_Name", IsUnique = true)]
    public class Composer : Entity
    {
        [Required]
        public string Name { get; set; }
    }
}
