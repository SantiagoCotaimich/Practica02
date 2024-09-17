using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataDLL.Domain
{
    public class Articulo
    {
        public int Id_articulo { get; set; }
        public string Nombre { get; set; }
        public decimal Precio_unitario { get; set; }

        public Articulo(int id_articulo, string nombre, decimal precio_unitario)
        {
            Id_articulo = id_articulo;
            Nombre = nombre;
            Precio_unitario = precio_unitario;
        }

        public Articulo(string nombre, decimal precio_unitario)
        {
            Nombre = nombre;
            Precio_unitario = precio_unitario;
        }

        public Articulo()
        {
        }
    }
}

