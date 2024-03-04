using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ProcedureModels
{
    public class GetTopBorrowerModel
    {
        public string TopBorrower { get; set; } = null!;
        public int TotalBooksBorrowed { get; set; }
    }
}
