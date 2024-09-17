using DataDLL.Domain;
using Proyecto_Practica02_.Models;

namespace Proyecto_Practica02_.Services
{
    public static class Mapper
    {
        public static Articulo Set(Articulos art)
        {
            var articulo = new Articulo()
            {
                Id_articulo = art.Id_articulo,
                Nombre = art.Nombre,
                Precio_unitario = art.Precio_unitario
            };
            return articulo;
        }
        public static Articulos Get(Articulo articulo)
        {
            if (articulo == null) { return null; }
            var dto = new Articulos()
            {
                Id_articulo = articulo.Id_articulo,
                Nombre = articulo.Nombre,
                Precio_unitario = articulo.Precio_unitario
            };
            return dto;
        }
        public static List<Articulos> GetList(List<Articulo> articulos)
        {
            if (articulos == null || articulos.Count == 0) { return null; }
            List<Articulos> lstdto = new List<Articulos>();
            foreach (Articulo articulo in articulos)
            {
                lstdto.Add(Get(articulo));
            }
            return lstdto;
        }

    }
}
