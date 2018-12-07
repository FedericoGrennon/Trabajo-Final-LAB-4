using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class Descuentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarJuegos();
        }

        protected void cargarJuegos()
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ds.ObtenerTabla("Juegos", "SELECT j.CodJuego, Nombre, Precio, RutaImagen, Porcentaje, FechaInicio, FechaFin FROM Juegos j"
                                         + " INNER JOIN Imagenes i"
                                         + " ON j.CodJuego = i.CodJuego"
                                         + " INNER JOIN Descuentos d"
                                         + " ON j.CodJuego = d.CodJuego"
                                         + " WHERE PrimeraImagen = 1 AND Estado = 1"
                                         + " AND FechaInicio <= GETDATE()"
                                         + " AND FechaFin > GETDATE()");
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                string precio = row[2].ToString();
                string porcentajeDesc = row[4].ToString();

                decimal formula = (Convert.ToDecimal(porcentajeDesc) * Convert.ToDecimal(precio)) / 100;
                string precioDesc = (Convert.ToDecimal(precio) - formula).ToString();
                precioDesc = precioDesc.Substring(0, precioDesc.Length - 2);

                string fechaInicio = row[5].ToString().Substring(0, row[5].ToString().Length - 9);
                string fechaFin = row[6].ToString().Substring(0, row[5].ToString().Length - 9);

                if (i == 0)
                {
                    literalDescuentos.Text = armarDIV(row[3].ToString().Replace("~", ".."), row[1].ToString(), precioDesc, porcentajeDesc, row[0].ToString(), fechaInicio, fechaFin);
                }
                else
                {
                    literalDescuentos.Text += armarDIV(row[3].ToString().Replace("~", ".."), row[1].ToString(), precioDesc, porcentajeDesc, row[0].ToString(), fechaInicio, fechaFin);
                }
                i++;
            }
        }

        protected string armarDIV(string rutaImagen, string titulo, string precio, string porcentajeDesc, string codJuego, string fechaInico, string fechaFin)
        {
            string div = "<div class=\"column\">"
                            + "<div class=\"card\">"
                                + "<img src=\"" + rutaImagen + "\" style=\"width:100%; height:500px; border-bottom:2px solid #1b3d62;\">"
                                + "<div class=\"container\">"
                                    + "<div style=\"height:80px\">"
                                        + "<a class=\"title\">" + titulo + "</a>"
                                    + "</div>"
                                    + "<div class=\"price\">"
                                        + "<a style=\"font-size:25px\">" + porcentajeDesc + "% OFF </a><a>ARS $"+ precio + "</a>"
                                    + "</div>"
                                    + "<div style=\"text-align:center; font-size:20px\">"
                                    +   "<a>Valido desde: " + fechaInico + " </a><a> hasta: " + fechaFin + "</a>"
                                    + "</div>"
                                    + "<input ID=\"btn_verMasHome\" type=\"button\" class=\"button\" value=\"Ver mas\" onclick=\"redireccionarHome('" + codJuego + "')\" />"
                                + "</div>"
                            + "</div>"
                        + "</div>";

            return div;
        }

    }
}