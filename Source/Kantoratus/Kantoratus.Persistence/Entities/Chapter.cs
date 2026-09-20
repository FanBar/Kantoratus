using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace Kantoratus.Persistence.Entities
{
    [Index(nameof(Name), Name = "UX_Chapter_Name", IsUnique = true)]
    public class Chapter : Entity
    {
        public string Name { get; set; }

        public List<SubChapter> SubChapters { get; set; }
    }
}