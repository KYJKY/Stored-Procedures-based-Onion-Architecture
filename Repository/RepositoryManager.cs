using Contracts.Repository;
using Repository.ModelRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class RepositoryManager : IRepositoryManager
    {
        private readonly DapperContext _context;
        private readonly Lazy<ILibraryRepository> _libraryRepository;

        public RepositoryManager(DapperContext dapperContext)
        {
            _context = dapperContext;
            _libraryRepository = new Lazy<ILibraryRepository>(() => new LibraryRepository(_context));
        }

        public ILibraryRepository LibraryRepository => _libraryRepository.Value;
    }
}
