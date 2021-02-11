using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class EventList
    {
        public int? ActiveYear { get; set; }
        
        public List<int> Years { get; set; }
       
        public List<Event> Events { get; set; }
    }
}
