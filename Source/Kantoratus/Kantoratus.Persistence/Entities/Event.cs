using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;

namespace Kantoratus.Persistence.Entities
{
    [Index(nameof(Year), nameof(Order), IsUnique = true, Name = "UX_Event_YearOrder")]
    public class Event : Entity
    {
        [Required]
        public int Year { get; set; }

        [Required]
        public int Order { get; set; }

        public string ImageFolder { get; set; }

        public string Date { get; set; }

        public string Title { get; set; }

        public string Location { get; set; }

        public string Description { get; set; }
        
        public bool IsArticle { get; set; }
    }
}
