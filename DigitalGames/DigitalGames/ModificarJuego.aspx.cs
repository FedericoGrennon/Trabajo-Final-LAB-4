using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class ModificarJuego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargarListbox("SELECT codJuego, Nombre FROM juegos");
            }
        }

        protected void cargarListbox(string consulta)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            lb_juegos.DataTextField = "Nombre";
            lb_juegos.DataValueField = "codJuego";

            dt = ds.ObtenerTabla("Usuario", consulta);

            if (dt.Rows.Count > 0)
            {
                lb_juegos.DataSource = dt;
                lb_juegos.DataBind();
            }
            else
            {
                lb_juegos.Items.Clear();
            }
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            if(txb_juegos.Text != "")
            {
                cargarListbox("SELECT codJuego, Nombre FROM juegos WHERE nombre LIKE '%" + txb_juegos.Text + "%'");
            }
            else
            {
                cargarListbox("SELECT codJuego, Nombre FROM juegos");
            }
        }
        
        protected void btn_modificar_Click(object sender, EventArgs e)
        {
            if(lb_juegos.SelectedIndex >= 0)
                Response.Redirect("AgregarJuego.aspx?cod=" + lb_juegos.SelectedValue);
        }
    }
}