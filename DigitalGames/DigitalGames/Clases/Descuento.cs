using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalGames
{
    public class Descuento
    {
        public string codDescuento { get; set; }
        public string codJuego { get; set; }
        public int porcentaje { get; set; }
        public DateTime fechaInicio { get; set; }
        public DateTime fechaFin { get; set; }
        public bool estado { get; set; }

        public void GenerarCod()
        {
            int id = 0;
            AccesoDatos ds = new AccesoDatos();
            if (ds.obtenerCantidad("SELECT count(codDescuento) FROM Descuentos", ref id))
            {
                id += 1;
                codDescuento = "DES" + id.ToString();

            }
            else
                codDescuento = "DES1";
        }
    }
}