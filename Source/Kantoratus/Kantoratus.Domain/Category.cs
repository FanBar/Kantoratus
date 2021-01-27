using System.Collections.Generic;

namespace Kantoratus.Domain
{
    public class Category
    {
        public string Name { get; set; }

        public IEnumerable<string> Items { get; set; }
    }
}
