using System;
using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class Event
    {
        public IEnumerable<string> Images { get; set; }
        
        public string Date { get; set; }

        public string Title { get; set; }

        public string Location { get; set; }
        
        public string Description { get; set; }
        
        public bool IsArticle { get; set; }
    }
}
