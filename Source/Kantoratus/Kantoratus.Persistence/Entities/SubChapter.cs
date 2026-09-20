using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Kantoratus.Persistence.Entities
{
    [Index(nameof(ChapterId), nameof(Name), Name = "UX_SubChapter_ChapterId_Name", IsUnique = true)]
    public class SubChapter : Entity
    {
        [Required]
        public int ChapterId { get; set; }
        public Chapter Chapter { get; set; }

        public List<SheetMusic> SheetMusics { get; set; }

        public string Name { get; internal set; }
    }
}