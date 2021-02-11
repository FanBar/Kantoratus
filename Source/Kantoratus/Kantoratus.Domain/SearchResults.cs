using System.Collections.Generic;
using System.Linq;

namespace Kantoratus.Domain
{
    public class SearchResults
    {
        public string Query { get; set; }

        public List<PlayList> PlayLists { get; set; }
        public List<Initial> Pieces { get; set; }
        public List<Initial> Composers { get; set; }
        public List<Initial> Members { get; set; }
        public List<Event> Events { get; set; }

        public bool NoResult => 
            !string.IsNullOrEmpty(Query) && !PlayLists.Any() && !Pieces.Any() && !Composers.Any() && !Members.Any() && !Events.Any();
    }
}
