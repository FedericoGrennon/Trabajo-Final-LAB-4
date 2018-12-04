using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Carrito"] != null)
            {
                DataTable tabla = (DataTable)Session["Carrito"];

                if (!Page.IsPostBack)
                {
                    cargarCarrito(tabla);
                }
            }
        }

        protected void cargarCarrito(DataTable tabla)
        {
            decimal total = 0;
            int i = 0;
            foreach (DataRow row in tabla.Rows)
            {
                if (i == 0)
                    literalCarr.Text = armarDivCarrito(row[1].ToString(), row[3].ToString(), row[2].ToString());
                else
                    literalCarr.Text += armarDivCarrito(row[1].ToString(), row[3].ToString(), row[2].ToString());

                total += (int)row[2] * (decimal)row[3];

                i++;
            }

            lbl_total.Text = total.ToString();
        }

        protected string armarDivCarrito(string nombreJuego, string precioJuego, string cantidad)
        {
            string div = "<div class=\"juegos\">"
                    + "<div class=\"dentroJuego\">"
                        + "<div class=\"NombreJuego\"><a>" + nombreJuego + "</a></div>"
                        + "<div class=\"precioUnit\"><a>ARS $" + precioJuego + "</a></div>"
                        + "<div class=\"precioUnit\"><a>" + cantidad + " articulo/s</a></div>";

            decimal subTotal = Convert.ToInt32(cantidad) * Convert.ToDecimal(precioJuego);

                        div += "<div class=\"precioTotalJuego\"><a>ARS $" + subTotal + "</a></div>" 
                        + "<div class=\"botonEliminar\"><asp:Button runat=\"server\" ID=\"btn_eliminarJuego\" CssClass=\"aspectosBotonEliminar\" Text=\"Eliminar\" /></div>"
                    + "</div>"
                + "</div>";

            return div;
        }

        protected void btn_continuarCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}