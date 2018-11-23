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
            if(!Page.IsPostBack)
            {
                InicioSesion.Style.Add("display", "block");
                iniciar.Style.Add("display", "none");
                regitrarse.Style.Add("display", "block");
            }
        }

        protected void btn_Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx?Juego=" + txb_buscar.Text);
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

        protected void cargarUsuario(Usuarios us)
        {
            us.nombreUsuario = txb_nombreUsuarioReg.Value;
            us.contraseña = txb_contraseñaReg.Value;
            us.mail = txb_MailReg.Value;
            us.nombre = txb_NombreReg.Value;
            us.apellido = txb_ApellidoReg.Value;
            us.fechaNacimiento = Convert.ToDateTime(txb_fechaNacReg.Value);
            us.pais = txb_Pais.Value;
            us.provincia = txb_Provincia.Value;
            us.localidad = txb_Localidad.Value;
            us.telefono = txb_Telefono.Value;
        }

        protected void btn_NuevaCuentaReg_Click(object sender, EventArgs e)
        {
            Usuarios us = new Usuarios();
            if (txb_MailReg.Value != string.Empty)
                cargarUsuario(us);

            if (Page.IsValid)
            {
                gestionUsuario gUsuario = new gestionUsuario();
                gUsuario.AgregarUsuario(us);
            }
        }

        protected void cv_validarNombreReg_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(args.Value != "")
            {
                AccesoDatos ds = new AccesoDatos();
                DataTable dt = new DataTable();
                dt = ds.ObtenerTabla("Usuario", "SELECT NombreUsuario FROM Usuarios");
                bool esta = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (txb_nombreUsuarioReg.Value == row[0].ToString())
                    {
                        esta = false;
                        break;
                    }
                }

                args.IsValid = esta;
            }
            else
            {
                args.IsValid = false;
            }
            
        }

        protected void cv_validarEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "")
            {
                AccesoDatos ds = new AccesoDatos();
                DataTable dt = new DataTable();
                dt = ds.ObtenerTabla("Usuario", "SELECT mail FROM Usuarios");
                bool esta = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (txb_MailReg.Value == row[0].ToString())
                    {
                        esta = false;
                        break;
                    }
                }

                args.IsValid = esta;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void validarTextbox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value != "");
        }
    }
}