using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class Chapter
    {
        public string Name { get; set; }
        public IEnumerable<SubChapter> SubChapters { get; set; }
    }
}