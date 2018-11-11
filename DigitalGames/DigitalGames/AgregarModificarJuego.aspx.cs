using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace DigitalGames
{
    public partial class AgregarModificarJuego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btn_guardarCambios_Click(object sender, EventArgs e)
        {
            fu_cargadorDeArchivo.Visible = true;
        }

        protected void validarTextbox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value != "");
        }

        protected void cv_listaImagenes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (lb_urlImagenes.Items.Count > 0);
        }

        protected void validarCodJuego_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int aux = 0;

            if(lb_CodJuegos.Items.Count > 0)
            {
                for (int i = 0; i < lb_CodJuegos.Items.Count; i++)
                {
                    if(args.Value == lb_CodJuegos.Items[i].ToString())
                    {
                        aux++;
                    }
                }

                if (aux == 0)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = true;
            }
            
        }
    }
}