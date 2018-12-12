using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class AgregarJuego : System.Web.UI.Page
    {
        ClaseJuego jue = new ClaseJuego();

        protected void Page_Load(object sender, EventArgs e)
        {  
            if (!Page.IsPostBack)
            {
                vaciarSessions();

                if (Request.QueryString["cod"] != null)
                {
                    if (Session["Modificar"] == null)
                        Session["Modificar"] = true;

                    if (Session["Juego"] == null)
                        cargarTextbox();
                    else
                        cargarTextboxSession();
                }
            }

            if (Request.QueryString["cod"] != null)
            {
                cargarClaseJuego(jue);
            }
        }

        protected void vaciarSessions()
        {
            Session["CodigosEliminar"] = null;
            Session["Modificar"] = null;
            Session["Stock"] = null;
            Session["CodigosActivacion"] = null;
            Session["Descuento"] = null;
            Session["Imagenes"] = null;
            Session["CantImagenes"] = null;
            Session["ImagenesAelminiar"] = null;
        }

        protected void cargarClaseJuego(ClaseJuego jue)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = new DataTable();

            string codJuego = Request.QueryString["cod"];

            tabla = ds.ObtenerTabla("Juego", "SELECT precio, stock FROM juegos WHERE codJuego = '" + codJuego + "'");

            jue.codJuego = codJuego;
            jue.precio = (decimal)tabla.Rows[0][0];
            jue.stock = (int)tabla.Rows[0][1];
        }

        protected void cargarTextbox()
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = new DataTable();

            string codJuego = Request.QueryString["cod"];

            tabla = ds.ObtenerTabla("Juego", "SELECT * FROM juegos WHERE codJuego = '" + codJuego + "'");

            txb_nombre.Value = tabla.Rows[0][1].ToString();
            txb_empresa.Value = tabla.Rows[0][2].ToString();
            txb_tipo.Value = tabla.Rows[0][3].ToString();
            rbl_listaConsolas.SelectedValue = tabla.Rows[0][6].ToString();
            txb_descripcion.Value = tabla.Rows[0][7].ToString();
            txb_requisitos.Value = tabla.Rows[0][8].ToString();
        }

        protected void cargarTextboxSession()
        {
            DataTable tabla = (DataTable)Session["Juego"];

            txb_nombre.Value = tabla.Rows[0][1].ToString();
            txb_empresa.Value = tabla.Rows[0][2].ToString();
            txb_tipo.Value = tabla.Rows[0][3].ToString();
            rbl_listaConsolas.SelectedValue = tabla.Rows[0][6].ToString();
            txb_descripcion.Value = tabla.Rows[0][7].ToString();
            txb_requisitos.Value = tabla.Rows[0][8].ToString();

            Session["Juego"] = null;
        }

        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                funcionesJuegos fJue = new funcionesJuegos();
                if(Session["Juego"] == null)
                {
                    Session["Juego"] = fJue.crearTabla();
                }

                if (Session["Modificar"] == null)
                {
                    jue.GenerarCod();
                    jue.precio = 0;
                    jue.stock = 0;
                }
                    
                jue.nombre = txb_nombre.Value.Replace('\'', '´');
                jue.empresa = txb_empresa.Value;
                jue.tipo = txb_tipo.Value; 
                jue.consola = rbl_listaConsolas.SelectedItem.ToString();
                jue.descripcion = txb_descripcion.Value;
                jue.requisitos = txb_requisitos.Value;

                fJue.AgregarFila((DataTable)Session["Juego"], jue);

                Response.Redirect("AgregarJuego(Paso2).aspx");
            }
        }

        protected void cv_nombre_ServerValidate(object source, ServerValidateEventArgs args)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();

            if (Session["Modificar"] == null)
                dt = ds.ObtenerTabla("Juegos", "SELECT Nombre FROM Juegos WHERE Nombre = '" + txb_nombre.Value.Replace('\'', '´') + "'");
            else
                dt = ds.ObtenerTabla("Juegos", "SELECT Nombre FROM Juegos WHERE Nombre = '" + txb_nombre.Value.Replace('\'', '´') + "' AND codJuego != '" + jue.codJuego + "'");
               
            bool esta = true;
            if (dt.Rows.Count <= 0)
            {
                if (txb_nombre.Value == string.Empty)
                {
                    esta = false;
                }
            }
            else
            {
                esta = false;
            }

            args.IsValid = esta;
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Session["Modificar"] = null;
            Session["Juego"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}