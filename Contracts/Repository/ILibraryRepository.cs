using Models.Dto.InputDto;
using Models.ProcedureModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contracts.Repository
{
    public interface ILibraryRepository
    {
        Task<IEnumerable<GetBorrowedBooksInfoForMemberModel>> GetBorrowedBooksInfoForMember(ExampleInputDto inputDto);
        Task<GetRecentBooksModel> GetRecentBooks();
        Task<GetTopBorrowerModel> GetTopBorrower();
    }
}
