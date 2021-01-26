using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class Composer
    {
        public string Name { get; set; }

        public IEnumerable<string> Pieces { get; set; }
    }
}
