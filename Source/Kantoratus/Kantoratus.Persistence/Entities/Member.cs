using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Kantoratus.Persistence.Entities
{
    public class Member : Entity
    {
        [Required]
        public string Name { get; set; }

        [Required, DefaultValue(false)] 
        public bool IsDead { get; set; }
    }
}
