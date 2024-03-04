using Contracts.Repository;
using Dapper;
using Models.Dto.InputDto;
using Models.ProcedureModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Repository.ModelRepository
{
    public class LibraryRepository : ILibraryRepository
    {
        private readonly DapperContext _context;

        public LibraryRepository(DapperContext dapperContext)
        {
            _context = dapperContext;
        }

        public async Task<IEnumerable<GetBorrowedBooksInfoForMemberModel>> GetBorrowedBooksInfoForMember(ExampleInputDto inputDto)
        {
            // 1 Table, Muliple Rows Case
            var procName = "GetBorrowedBooksInfoForMember";

            using (var connection = _context.CreateConnection())
            {
                var procResult = await connection.QueryMultipleAsync(
                                        procName,
                                        inputDto,
                                        commandType: CommandType.StoredProcedure
                );

                var result = await procResult.ReadAsync<GetBorrowedBooksInfoForMemberModel>();

                return result;
            }
        }

        public async Task<GetRecentBooksModel> GetRecentBooks()
        {
            // Muliple Tables, Muliple Rows Case
            var procName = "GetRecentBooks";

            using (var connection = _context.CreateConnection())
            {
                var procResult = await connection.QueryMultipleAsync(
                                        procName,
                                        commandType: CommandType.StoredProcedure
                                    );

                var resultObj = new GetRecentBooksModel
                {
                    ResultSet1 = await procResult.ReadAsync<GetRecentBooksResultSet>(),
                    ResultSet2 = await procResult.ReadAsync<GetRecentBooksResultSet>()
                };


                return resultObj;
            }
        }

        public async Task<GetTopBorrowerModel> GetTopBorrower()
        {
            // Just 1 Row Case
            var procName = "GetTopBorrower";

            using (var connection = _context.CreateConnection())
            {
                var procResult = await connection.QueryFirstOrDefaultAsync<GetTopBorrowerModel>(
                                        procName,
                                        commandType: CommandType.StoredProcedure
                                    );

                return procResult;
            }
        }
    }
}
