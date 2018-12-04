using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalGames
{
    public class Tarjeta
    {
        public string NumeroTarjeta { get; set; }
        public string NombreUsuario { get; set; }
        public DateTime fechaVencimiento { get; set; }
        public string NombreTitular { get; set; }
        public string DNI { get; set; }
        public string banco { get; set; }
    }
}