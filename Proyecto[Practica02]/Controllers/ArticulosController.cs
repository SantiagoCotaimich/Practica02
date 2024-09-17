using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Proyecto_Practica02_.Models;
using Proyecto_Practica02_.Services;
using static System.Net.Mime.MediaTypeNames;

namespace Proyecto_Practica02_.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticulosController : Controller
    {
        private readonly IAplication aplication;
        public ArticulosController()
        {
            aplication = new ArticuloService();
        }

        [HttpGet]
        public IActionResult GetArticulos()
        {
            return Ok(aplication.GetArticulos());
        }


        [HttpPost]
        public IActionResult Post(Articulos articulo)
        {
            if (articulo.Id_articulo != 0)
            {
                return BadRequest("El Id del articulo debe quedar en 0");
            }
            try
            {
                if (aplication.AgregarArticulo(articulo))
                {
                    return Ok($"Articulo: [{articulo.Nombre} - ${articulo.Precio_unitario}] almacenado con exito");
                }
                else return StatusCode(500, "Error al almacenar articulo");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error Interno: {ex}");
            }
        }


        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] Articulos articuloActualizado)
        {
            if (articuloActualizado == null)
            {
                return BadRequest("Datos no válidos");
            }

            try
            {
                articuloActualizado.Id_articulo = id;

                if (aplication.ActualizarArticulo(id, articuloActualizado))
                {
                    return Ok($"Articulo con id [{id}] actualizado con éxito");
                }
                else
                {
                    return NotFound($"No existe artículo con el id: [{id}]");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error Interno: {ex.Message}");
            }
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                bool result = aplication.BorrarArticulo(id);
                if (result)
                {
                    return Ok($"Artículo con id [{id}] borrado con éxito.");
                }
                else
                {
                    return NotFound($"No se encontró un artículo con el id: [{id}] para borrar.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error Interno: {ex.Message}");
            }
        }


    }
}
