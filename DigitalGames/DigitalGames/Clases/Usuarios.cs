using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalGames
{
    public class Usuarios
    {
        public string nombreUsuario { get; set; }
        public string contraseña { get; set; }
        public string mail { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string pais { get; set; }
        public string provincia { get; set; }
        public string localidad { get; set; }
        public string telefono { get; set; }
    }
}