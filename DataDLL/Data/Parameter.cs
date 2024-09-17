using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace DataDLL.Data
{


    public class Parameter
    {
        public string Nombre { get; set; }
        public object Valor { get; set; }
        public Parameter(string nom, object val)
        {
            Nombre = nom;
            Valor = val;
        }

        public static SqlCommand LoadToCMD(List<Parameter> parametros, SqlCommand cmd)
        {
            foreach (Parameter p in parametros)
            {
                cmd.Parameters.AddWithValue(p.Nombre, p.Valor);
            }
            return cmd;
        }
    }
}
