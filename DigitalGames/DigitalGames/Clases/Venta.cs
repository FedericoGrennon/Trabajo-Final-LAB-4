using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalGames
{
    public class Venta
    {
        public string CodVenta { get; set; }
        public string NombreUsuario { get; set; }
        public DateTime fechaCompra { get; set; }
        public decimal Precio { get; set; }
        public string numeroTarjeta { get; set; }

        public void GenerarCod()
        {
            int id = 0;
            AccesoDatos ds = new AccesoDatos();
            if (ds.obtenerCantidad("SELECT count(codVenta) FROM Ventas", ref id))
            {
                id += 1;
                CodVenta = "VEN" + id.ToString();

            }
            else
                CodVenta = "VEN1";
        }
    }
}