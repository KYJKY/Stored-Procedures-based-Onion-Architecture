using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ProcedureModels
{
    public class GetBorrowedBooksInfoForMemberModel
    {
        public IEnumerable<GetBorrowedBooksInfoForMemberResultSet>? ResultSet1 { get; set; }
    }

    public class GetBorrowedBooksInfoForMemberResultSet
    {
        public string MemberName { get; set; } = null!;
        public string BookTitle { get; set; } = null!;
        public string BookAuthor { get; set; } = null!;
        public DateTime LoanDate { get; set; }
        public DateTime DueDate { get; set; }
    }
}
