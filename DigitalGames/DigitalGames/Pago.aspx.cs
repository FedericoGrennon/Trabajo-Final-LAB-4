using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class Pago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime fechaMin = DateTime.Today;
            txb_fechaVencimiento.Attributes.Add("min", fechaMin.ToString("yyyy-MM-dd"));

            if (Session["Usuario"] != null)
            {
                if (!Page.IsPostBack)
                {
                    cargarTarjetas();
                }
                    
                if(Session["Tarjeta"] != null)
                {
                    cargarTarjetasSeleccionada(Session["Tarjeta"].ToString());
                    Session["Tarjeta"] = null;
                }
            }
        }

        protected void cargarTarjetas()
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            lb_tarjetas.DataTextField = "datos";
            lb_tarjetas.DataValueField = "NumeroTarjeta";

            string[] usuario = (string[])Session["Usuario"];

            dt = ds.ObtenerTabla("Tarjetas", "SELECT Banco + ' ' + RIGHT(NumeroTarjeta, 4) as datos, NumeroTarjeta FROM Tarjetas WHERE NombreUsuario = '" + usuario[0] + "'");

            lb_tarjetas.DataSource = dt;
            lb_tarjetas.DataBind();
        }

        protected void cargarTarjetasSeleccionada(string numeroTarjeta)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();

            string[] usuario = (string[])Session["Usuario"];

            dt = ds.ObtenerTabla("Tarjetas", "SELECT * FROM Tarjetas WHERE NombreUsuario = '" + usuario[0] + "' AND NumeroTarjeta = '" + numeroTarjeta + "'");

            DateTime fecha = Convert.ToDateTime(dt.Rows[0][2].ToString());

            txb_banco.Value = dt.Rows[0][5].ToString();
            txb_nombreTarjeta.Value = numeroTarjeta;
            txb_fechaVencimiento.Value = fecha.ToString("yyyy-MM-dd");
            txb_NombreTitular.Value = dt.Rows[0][3].ToString();
            txb_DNI.Value = dt.Rows[0][4].ToString();
        }

        protected void btn_seleccionar_Click(object sender, EventArgs e)
        {
            if(lb_tarjetas.SelectedIndex >= 0)
            {
                Session["Tarjeta"] = lb_tarjetas.SelectedValue;
                Response.Redirect("Pago.aspx");
            } 
        }

        protected void Unnamed_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btn_finalizarCompra_Click(object sender, EventArgs e)
        {
            //Si la tarjeta no existe > guardar tarjeta
            //Guardar VENTA - DETALLE VENTA - CODACTIVACIONVENDIDOS
            //dar de baja los codigos de activacion vendidos de la tabla CODIGOSDEACTIVACION
            //Y tambien actualizar STOCK de la tabla JUEGOS
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }
    }
}