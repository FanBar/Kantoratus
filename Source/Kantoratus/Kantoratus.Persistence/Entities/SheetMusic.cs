using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace Kantoratus.Persistence.Entities
{
    [Index(nameof(Number), Name = "UX_SheetMusic_Number", IsUnique = true)]
    public class SheetMusic : Entity
    {
        [Required, StringLength(3)]
        public string Number { get; set; }

        public string Title { get; set; }

        [Required]
        public int SubChapterId { get; set; }
        public SubChapter SubChapter { get; set; }

        public string Lyrics { get; set; }

        public string Origin { get; set; }

        public string HimnologicalData1 { get; set; }

        public string HimnologicalData2 { get; set; }

        public string OriginalTitle { get; set; }

    }
}