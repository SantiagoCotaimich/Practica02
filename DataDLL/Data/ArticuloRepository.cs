using DataDLL.Domain;
using DataDLL.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace DataDLL.Data
{
    public class ArticuloRepositorio : IArticuloRepository
    {
        private readonly DataHelper helper;
        public ArticuloRepositorio()
        {
            helper = DataHelper.GetInstance();
        }
        private List<Articulo> TableToList(DataTable dt)
        {
            if (dt == null || dt.Rows.Count == 0) { return null; }
            List<Articulo> lst = new List<Articulo>();
            foreach (DataRow row in dt.Rows)
            {
                lst.Add(LoadArticulo(row));
            }
            return lst;
        }
        private Articulo LoadArticulo(DataRow row)
        {
            int id = Convert.ToInt32(row["id_articulo"]);
            string nombre = row["nombre"].ToString();
            decimal precio_unitario = Convert.ToDecimal(row["precio_unitario"]);
            return new Articulo(id, nombre, precio_unitario);
        }

        public bool Delete(int id)
        {
            bool result = false;
            List<Parameter> parametros = new List<Parameter>() { new Parameter("@id_articulo", id) };
            result = (1 == helper.ExecuteSPNonQuery("BORRAR_ARTICULOS", parametros));
            return result;
        }


        public List<Articulo> GetAll()
        {
            return TableToList(helper.ExecuteSPQuery("OBTENER_ARTICULOS_TODOS", null));
        }


        public bool Save(Articulo oArticulo)
        {
            List<Parameter> parametros = new List<Parameter>
            {
                new Parameter("@id_articulo", oArticulo.Id_articulo),
                new Parameter("@nombre", oArticulo.Nombre),
                new Parameter("@precio_unitario", oArticulo.Precio_unitario)
            };
            int rows = helper.ExecuteSPNonQuery("GUARDAR_ARTICULOS", parametros);
            return rows == 1;
        }
    }
}
