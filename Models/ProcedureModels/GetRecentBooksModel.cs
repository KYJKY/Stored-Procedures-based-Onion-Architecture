using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ProcedureModels
{
    public class GetRecentBooksModel
    {
        public IEnumerable<GetRecentBooksResultSet>? ResultSet1 { get; set; }
        public IEnumerable<GetRecentBooksResultSet>? ResultSet2 { get; set; }
    }
    public class GetRecentBooksResultSet
    {
        public int BookID { get; set; }
        public string? Title { get; set; }
        public string? Author { get; set; }
        public DateTime PublishDate { get; set; }
        public int AvailableCopies { get; set; }
    }
    //public class GetRecentBooksResultSet2
    //{
    //
    //}
}
