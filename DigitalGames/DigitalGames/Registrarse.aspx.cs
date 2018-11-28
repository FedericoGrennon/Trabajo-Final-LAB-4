using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime fechaMax = DateTime.Today.AddYears(-18);
            DateTime fechaMin = DateTime.Today.AddYears(-100);


            txb_fechaNacReg.Attributes.Add("max", fechaMax.ToString("yyyy-MM-dd"));
            txb_fechaNacReg.Attributes.Add("min", fechaMin.ToString("yyyy-MM-dd"));
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
                Session["UsuarioCreado"] = true;
                Response.Redirect("IniciarSession.aspx");
            }
        }
        
        protected void btn_cancelReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("IniciarSession.aspx");
        }

        protected void cv_validarNombreReg_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "")
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