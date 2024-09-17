using DataDLL.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataDLL.Interfaces
{
    public interface IArticuloRepository
    {
        List<Articulo> GetAll();
        bool Save(Articulo oArticulo);
        bool Delete(int id);
    }
}
