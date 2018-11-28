using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class IniciarSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UsuarioCreado"] != null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('Usuario registrado correctamente')</script>");
                Session["UsuarioCreado"] = null;
            }
                
        }

        protected void btn_LogineIS_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                Response.Redirect("Home.aspx");
            }
            
        }

        protected void btn_registrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarse.aspx");
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void cv_validaNombreIS_ServerValidate(object source, ServerValidateEventArgs args)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ds.ObtenerTabla("Usuario", "SELECT NombreUsuario, mail, contraseña, Administrador FROM Usuarios WHERE estado='true'");
            bool esta = false;
            foreach (DataRow row in dt.Rows)
            {
                if (txb_nombreUsuarioIS.Text == row[0].ToString() || txb_nombreUsuarioIS.Text == row[1].ToString())
                {
                    if(txb_contraseñaIS.Value == row[2].ToString())
                    {
                        string[] manda = new string[2];

                        manda[0] = row[0].ToString();

                        if (row[3].ToString() == "True")
                        {
                            manda[1] = "Admin";
                        }
                        else
                        {
                            manda[1] = "NoAdmin";
                        }

                        Session["Usuario"] = manda;
                        esta = true;
                        break;
                    }
                }
            }

            args.IsValid = esta;
        }

        protected void Unnamed_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(args.Value != "")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}