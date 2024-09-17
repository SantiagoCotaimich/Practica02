using Proyecto_Practica02_.Models;

namespace Proyecto_Practica02_.Services
{
    public interface IAplication
    {
        List<Articulos> GetArticulos();
        bool AgregarArticulo(Articulos articulo);
        bool ActualizarArticulo(int id, Articulos articuloActualizado);
        bool BorrarArticulo(int codigo);
    }

}
