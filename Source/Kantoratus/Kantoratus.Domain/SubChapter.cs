using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class SubChapter
    {
        public string Name { get; set; }
        public IEnumerable<SheetMusic> SheetMusics { get; set; }
    }
}