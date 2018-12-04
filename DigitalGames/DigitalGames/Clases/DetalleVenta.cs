using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalGames
{
    public class DetalleVenta
    {
        public string CodVenta { get; set; }
        public string CodJuego { get; set; }
        public int cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public int porcentaje { get; set; }
    }
}