using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class CompraFinalizada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                if(Session["CodVenta"] != null)
                    cargarCompras();
                Session["CodVenta"] = null;
            }
            
        }

        protected void cargarCompras()
        {
            string[] usuario = (string[])Session["Usuario"];

            AccesoDatos ad = new AccesoDatos();
            DataTable dt = new DataTable();

            string codVenta = Session["CodVenta"].ToString();

            dt = ad.ObtenerTabla("Usuarios", "SELECT v.FechaCompra, v.Numerotarjeta, dv.PrecioUnitario , j.Nombre, ca.CodActivacion"
                                           + " FROM Ventas v"
                                           + " INNER JOIN DetalleVenta dv"
                                           + " ON V.CodVenta = dv.CodVenta"
                                           + " INNER JOIN Juegos j ON j.CodJuego = dv.CodJuego"
                                           + " INNER JOIN CodActivacionVendidos ca"
                                           + " ON dv.CodVenta = ca.CodVenta AND dv.CodJuego = ca.CodJuego"
                                           + " WHERE v.NombreUsuario = '" + usuario[0] + "' AND v.CodVenta = '" + codVenta + "'");
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {

                string ultimosDigitos = row[1].ToString().Substring(row[1].ToString().Length - 4, 4);
                string fechaCompra = row[0].ToString().Substring(0, row[0].ToString().Length - 9);
                string precioUnitario = row[2].ToString().Substring(0, row[2].ToString().Length - 2);

                if (i == 0)
                    literalCompras.Text = armarDivCompras(row[3].ToString(), precioUnitario, fechaCompra, ultimosDigitos, row[4].ToString());
                else
                    literalCompras.Text += armarDivCompras(row[3].ToString(), precioUnitario, fechaCompra, ultimosDigitos, row[4].ToString());
                i++;
            }
            if (dt.Rows.Count <= 0)
            {
                literalCompras.Text = "<a>Error al cargar los detalles de la venta</a>";
            }
        }

        protected string armarDivCompras(string nombreJuego, string precioUnitario, string fechaCompra, string ultimosDigitosTarj, string codActivacion)
        {
            string div = "<div class=\"compra\">"
                            + "<div><h4>Nombre de juego: </h4><a>" + nombreJuego + "</a></div>"
                            + "<div><h4>Precio: </h4> <a>ARS $" + precioUnitario + "</a></div>"
                            + "<div><h4>Fecha de compra: </h4><a>" + fechaCompra + "</a></div>"
                            + "<div><h4>Ultimos 4 digitos de tarjeta: </h4><a>" + ultimosDigitosTarj + "</a></div>"
                            + "<div><h4>Codigo de activacion: </h4><a>" + codActivacion + "</a></div>"
                        + "</div>";

            return div;
        }

        protected void btn_continuarCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}