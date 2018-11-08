using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalGames
{
    public partial class AgregarModificarJuego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_guardarCambios_Click(object sender, EventArgs e)
        {

        }

        protected void cv_listaImagenes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = lb_urlImagenes.Items.Count > 0;
        }
    }
}