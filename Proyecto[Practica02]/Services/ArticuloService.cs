using DataDLL.Data;
using DataDLL.Domain;
using DataDLL.Interfaces;
using Proyecto_Practica02_.Models;
using Proyecto_Practica02_.Services;

public class ArticuloService : IAplication
{
    private readonly IArticuloRepository repositorio;
    public ArticuloService()
    {
        repositorio = new ArticuloRepositorio();
    }

    public bool AgregarArticulo(Articulos art)
    {
        Articulo articulo = Mapper.Set(art);
        return repositorio.Save(articulo);
    }

    public bool BorrarArticulo(int id)
    {
        return repositorio.Delete(id);
    }
    public List<Articulos> GetArticulos()
    {
        var lstarticulos = repositorio.GetAll();
        return Mapper.GetList(lstarticulos);
    }

    public bool ActualizarArticulo(int id, Articulos art)
    {
        var articulo = Mapper.Set(art);
        articulo.Id_articulo = id;
        return repositorio.Save(articulo);
    }
}