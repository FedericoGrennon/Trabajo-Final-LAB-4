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
            Response.Redirect("AgregarModificarJuego.aspx");
        }

        protected void btn_ModfJuego_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarJuego.aspx");
        }
    }
}