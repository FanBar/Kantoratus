using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class SheetMusic
    {
        public string Number { get; set; }
        public string Title { get; set; }
        public string Chapter { get; set; }
        public string SubChapter { get; set; }
        public IEnumerable<string> Images { get; set; }
        public string Lyrics { get; set; }
        public string Origin { get; set; }
        public string HimnologicalData1 { get; set; }
        public string HimnologicalData2 { get; set; }
        public string Previous { get; set; }
        public string Next { get; set; }
        public string OriginalTitle { get; set; }
    }
}