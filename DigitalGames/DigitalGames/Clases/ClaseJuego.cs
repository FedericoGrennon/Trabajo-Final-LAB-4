using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DigitalGames
{
    public class ClaseJuego
    {
        public string codJuego{ set; get; }
        public string nombre { set; get; }
        public string empresa { set; get; }
        public string tipo { set; get; }
        public decimal precio { set; get; }
        public int stock { set; get; }
        public string consola { set; get; }
        public string descripcion { set; get; }
        public string requisitos { set; get; }

        public void GenerarCod()
        {
            int id = 0;
            AccesoDatos ds = new AccesoDatos();
            if (ds.obtenerCantidad("SELECT count(codJuego) FROM Juegos", ref id))
            {
                id += 1;
                codJuego = "JUE" + id.ToString();

            }
            else
                codJuego = "JUE1";
        }
    }
}