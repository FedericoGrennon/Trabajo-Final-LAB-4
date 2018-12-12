using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Usuario"] != null)
            {
                string[] trae = (string[])Session["Usuario"];

                btn_inicioSes_reg.Visible = false;
                btn_usuario.Text = trae[0];
                btn_usuario.Visible = true;
                btn_cerrarSesion.Visible = true;

                if (trae[1] == "Admin")
                {
                    btn_agregarJuego.Visible = true;
                    btn_ModfJuego.Visible = true;
                }
                else
                {
                    btn_agregarJuego.Visible = false;
                    btn_ModfJuego.Visible = false;
                }
            }
            else
            {
                btn_inicioSes_reg.Visible = true;
                btn_usuario.Visible = false;
                btn_cerrarSesion.Visible = false;
                btn_agregarJuego.Visible = false;
                btn_ModfJuego.Visible = false;
            }

            if (Session["Carrito"] != null)
            {
                cargarCarrito();
            }

            if(EsconderNavBar("Pago.aspx")
            || EsconderNavBar("AgregarJuego(Paso2).aspx")
            || EsconderNavBar("AgregarJuego(Paso3).aspx")
            || EsconderNavBar("AgregarJuego(Paso4).aspx"))
            {
                NavegadorSuperior.Attributes.Add("Style", "display:none");
            }
            else
            {
                NavegadorSuperior.Attributes.Add("Style", "display:block");
            }
        }

        protected bool EsconderNavBar(string paginaActual)
        {
            if (Request.Url.Segments[Request.Url.Segments.Length - 1] == paginaActual)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void cargarCarrito()
        {
            DataTable tabla = (DataTable)Session["Carrito"];
            int i = 0;
            foreach (DataRow row in tabla.Rows)
            {
                if(i==0)
                    literalCarrito.Text = crearDivCarrito(row[1].ToString(), row[2].ToString(), row[3].ToString(), row[0].ToString());
                else
                    literalCarrito.Text += crearDivCarrito(row[1].ToString(), row[2].ToString(), row[3].ToString(), row[0].ToString());

                i++;
            }
        }

        protected string crearDivCarrito(string titulo, string cantidad, string precio, string codJuego)
        {
            string div = "<div class=\"juego\">"
                        + "<div class=\"JuegoTituloCarrito\"><a>" + titulo + "</a></div>"
                        + "<div class=\"cantJuego\"><a>" + cantidad + " articulo/s</a></div>"
                        + "<div class=\"precioJuego\"><a>ARS $" + precio + "</a></div>"
                        + "</div>";

            return div;
        }

        protected void btn_Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            if(txb_buscar.Text != "")
                Response.Redirect("Home.aspx?Juego=" + txb_buscar.Text);
            else
                Response.Redirect("Home.aspx");
        }

        protected void btn_PC_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cons=PC");
        }

        protected void btn_PS3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cons=PS3");
        }

        protected void btn_PS4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cons=PS4");
        }

        protected void btn_XBOX360_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cons=XBOX-360");
        }

        protected void btn_XBOXONE_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cons=XBOX-ONE");
        }

        protected void btn_Acción_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cat=Acción");
        }

        protected void btn_Aventura_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cat=Aventura");
        }

        protected void btn_AventuraGráfica_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cat=Aventura-Gráfica");
        }

        protected void btn_ConsolaVirtual_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cat=Consola-Virtual");
        }

        protected void btn_Deportes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cat=Deportes");
        }

        protected void btn_Estrategia_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cat=Estrategia");
        }

        protected void btn_Lucha_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Cat=Lucha");
        }

        protected void btn_inicioSes_reg_Click(object sender, EventArgs e)
        {
            Response.Redirect("IniciarSession.aspx");
        }

        protected void btn_usuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuario.aspx");
        }

        protected void btn_cerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void btn_agregarJuego_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarJuego.aspx");
        }

        protected void btn_ModfJuego_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarJuego.aspx");
        }

        protected void btn_LimpiarCarrito_Click(object sender, EventArgs e)
        {
            Session["Carrito"] = null;
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_irCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        protected void btn_Descuentos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Descuentos.aspx");
        }
    }
}