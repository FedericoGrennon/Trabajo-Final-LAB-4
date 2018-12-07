using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class AgregarJuego_Paso2_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            if (cv_codigo.IsValid)
            {
                if (Session["Stock"] == null)
                    Session["Stock"] = 0;

                lb_CodJuegos.Items.Add(modificarCodigo());
                Session["Stock"] = (int)Session["Stock"] + 1;
                lbl_stockActual.Text = Session["Stock"].ToString();
            }
        }

        protected string modificarCodigo()
        {
            int i = 0;
            string codigo = "";
            foreach (char letra in txb_codigo.Text.ToCharArray())
            {
                if (i == 4)
                {
                    codigo += '-';
                    i = 0;
                }

                codigo += letra;
                i++;
            }

            return codigo.ToUpper();
        }

        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            if (rqv_precio.IsValid)
            {

            }
        }

        protected void cv_codigo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            bool esta = true;

            if (txb_codigo.Text == string.Empty || txb_codigo.Text.Length != 16)
            {
                esta = false;
            }
            else
            {
                string pattern = "^[A-Za-z0-9]";
                System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(pattern);
                foreach (char letra in txb_codigo.Text.ToCharArray())
                {
                    if (!regex.IsMatch(letra.ToString()) || letra == ' ')
                    {
                        esta = false;
                        break;
                    }
                }

                if (esta)
                {
                    foreach (ListItem item in lb_CodJuegos.Items)
                    {
                        if (item.ToString() == modificarCodigo())
                        {
                            esta = false;
                            break;
                        }
                    }
                    if (esta)
                    {
                        AccesoDatos ds = new AccesoDatos();
                        DataTable dt = new DataTable();
                        dt = ds.ObtenerTabla("Codigos", "SELECT CodActivacion FROM CodigosActivacion WHERE CodActivacion = '" + modificarCodigo() + "'");

                        if (dt.Rows.Count > 0)
                        {
                            esta = false;
                        }
                    }
                }
            }

            args.IsValid = esta;
        }
    }
}