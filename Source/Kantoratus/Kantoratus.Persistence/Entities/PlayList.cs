using System.ComponentModel.DataAnnotations;

namespace Kantoratus.Persistence.Entities
{
    public class PlayList : Entity
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        public string YouTubeId { get; set; }
    }
}
