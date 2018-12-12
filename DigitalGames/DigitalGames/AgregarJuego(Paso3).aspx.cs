using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class AgregarJuego_Paso3_ : System.Web.UI.Page
    {
        Descuento desc = new Descuento();

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime fechaMin = DateTime.Now;
            DateTime fechaMax = DateTime.Now.AddYears(52);
            txb_FechaInicio.Attributes.Add("min", fechaMin.ToString("yyyy-MM-dd HH:mm").Replace(' ', 'T'));
            txb_FechaFin.Attributes.Add("min", fechaMin.ToString("yyyy-MM-dd HH:mm").Replace(' ', 'T'));
            txb_FechaInicio.Attributes.Add("max", fechaMax.ToString("yyyy-MM-dd HH:mm").Replace(' ', 'T'));
            txb_FechaFin.Attributes.Add("max", fechaMax.ToString("yyyy-MM-dd HH:mm").Replace(' ', 'T'));

            if (!Page.IsPostBack)
            {
                if (Session["Modificar"] != null)
                {
                    if (Session["Descuento"] == null)
                        cargarTextBox();
                    else
                        cargarTextBoxVolver();
                }
            }
        }

        protected void cargarCodDescuento(Descuento desc)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = (DataTable)Session["Juego"];
            string codJuego = tabla.Rows[0][0].ToString();
            tabla = ds.ObtenerTabla("Descuento", "SELECT CodDescuento FROM Descuentos WHERE CodJuego = '" + codJuego + "'");

            desc.codDescuento = tabla.Rows[0][0].ToString();
        }

        protected void cargarTextBox()
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = (DataTable)Session["Juego"]; 
            string codJuego = tabla.Rows[0][0].ToString();
            tabla = ds.ObtenerTabla("Descuento", "SELECT * FROM Descuentos WHERE CodJuego = '" + codJuego + "'");

            txb_Porcentaje.Value = tabla.Rows[0][2].ToString();
            txb_FechaInicio.Value = ((DateTime)tabla.Rows[0][3]).ToString("yyyy-MM-dd HH:mm:ss").Replace(' ', 'T');
            txb_FechaFin.Value = ((DateTime)tabla.Rows[0][4]).ToString("yyyy-MM-dd HH:mm:ss").Replace(' ', 'T');
            chx_Disponibilidad.Checked = (bool)tabla.Rows[0][5];
        }

        protected void cargarTextBoxVolver()
        {
            DataTable tabla = (DataTable)Session["Descuento"];

            txb_Porcentaje.Value = tabla.Rows[0][2].ToString();
            txb_FechaInicio.Value = ((DateTime)tabla.Rows[0][3]).ToString("yyyy-MM-dd HH:mm:ss").Replace(' ', 'T');
            txb_FechaFin.Value = ((DateTime)tabla.Rows[0][4]).ToString("yyyy-MM-dd HH:mm:ss").Replace(' ', 'T');
            chx_Disponibilidad.Checked = (bool)tabla.Rows[0][5];

            Session["Descuento"] = null;
        }

        protected void btn_Volver_Click(object sender, EventArgs e)
        {
            Session["Descuento"] = null;
            Response.Redirect("AgregarJuego(Paso2).aspx");
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Session["CodigosEliminar"] = null;
            Session["Modificar"] = null;
            Session["Juego"] = null;
            Session["Stock"] = null;
            Session["CodigosActivacion"] = null;
            Session["Descuento"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                funcionesJuegos fJue = new funcionesJuegos();
                DataTable tabla = (DataTable)Session["Juego"];

                if (Session["Descuento"] == null)
                    Session["Descuento"] = fJue.crearTablaDescuento();

                if(Session["Modificar"] == null)
                    desc.GenerarCod();
                desc.codJuego = tabla.Rows[0][0].ToString();
                desc.porcentaje = Convert.ToInt32(txb_Porcentaje.Value);
                desc.fechaInicio = Convert.ToDateTime(txb_FechaInicio.Value);
                desc.fechaFin = Convert.ToDateTime(txb_FechaFin.Value);
                desc.estado = chx_Disponibilidad.Checked;

                fJue.AgregarFilaDescuento((DataTable)Session["Descuento"], desc);

                Response.Redirect("AgregarJuego(Paso4).aspx");
            }
        }

        protected void btn_Omitir_Click(object sender, EventArgs e)
        {
            Session["Descuento"] = null;
            Response.Redirect("AgregarJuego(Paso4).aspx");
        }
    }
}