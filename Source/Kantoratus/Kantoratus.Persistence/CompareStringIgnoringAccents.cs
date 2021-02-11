using System.Collections.Generic;
using System.Globalization;

namespace Kantoratus.Persistence
{
    public class CompareStringIgnoringAccents : IEqualityComparer<string>
    {
        public bool Equals(string x, string y)
        {
            return CultureInfo.CurrentCulture.CompareInfo.Compare(x, y, CompareOptions.IgnoreNonSpace) == 0;

        }

        public int GetHashCode(string obj)
        {
            return CultureInfo.CurrentCulture.CompareInfo.GetHashCode(obj, CompareOptions.IgnoreNonSpace);
        }
    }
}
