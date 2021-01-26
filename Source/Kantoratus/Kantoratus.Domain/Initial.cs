using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class Initial
    {
        public char Letter { get; set; }
        public IEnumerable<Composer> Composers { get; set; }
    }
}
