using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class Juegos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["c"] != null)
            {
                string codigoJuego = Request.QueryString["c"];

                if (!Page.IsPostBack)
                {
                    cargarImagenes(codigoJuego);
                    cargarCarta(codigoJuego);
                    funcionesJuegos fJue = new funcionesJuegos();
                    fJue.insertarVisualizacion(codigoJuego, fJue.generarCodVisualizacion(), DateTime.Now);
                }
                    
            }
        }

        protected void cargarCarta(string codJuego)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ds.ObtenerTabla("Juego", "SELECT Nombre, Precio, Stock, d.Porcentaje, d.Estado, d.FechaInicio, d.FechaFin, j.Descripcion, j.Requisitos FROM Juegos j INNER JOIN Descuentos d on j.CodJuego = d.CodJuego WHERE j.CodJuego = '" + codJuego + "'");

            lbl_tituloJuego.Text = dt.Rows[0][0].ToString();

            decimal precio = Convert.ToDecimal(dt.Rows[0][1].ToString());

            if (dt.Rows[0][4].ToString() == "True")
            {
                if (DateTime.Now >= Convert.ToDateTime(dt.Rows[0][5].ToString()) && DateTime.Now < Convert.ToDateTime(dt.Rows[0][6].ToString()))
                {
                    decimal porcentaje = Convert.ToDecimal(dt.Rows[0][3].ToString());
                    decimal precioConDescuento = precio - ((precio * porcentaje) / 100);

                    divDescuento.Attributes.Add("style", "display:block");
                    lbl_PrecioJuego.Text = precio.ToString().Substring(0, precio.ToString().Length - 2);
                    lbl_PrecioConDescuento.Text = precioConDescuento.ToString().Substring(0, precioConDescuento.ToString().Length - 2);
                }
                else
                {
                    divDescuento.Attributes.Add("style", "display:none");
                    lbl_PrecioConDescuento.Text = precio.ToString().Substring(0, precio.ToString().Length - 2);
                } 
            }
            else
            {
                divDescuento.Attributes.Add("style", "display:none");
                lbl_PrecioConDescuento.Text = precio.ToString().Substring(0, precio.ToString().Length - 2);
            }

            lbl_stockJuego.Text = dt.Rows[0][2].ToString();

            if(Convert.ToInt32(lbl_stockJuego.Text) <= 0)
            {
                txb_cantAcomprarJuego.Visible = false;
                btn_AñadirCarritoJuego.Visible = false;
                btn_comprarJuego.Visible = false;
            }
            else
            {
                txb_cantAcomprarJuego.Visible = true;
                btn_AñadirCarritoJuego.Visible = true;
                btn_comprarJuego.Visible = true;
                txb_cantAcomprarJuego.Attributes.Add("max", dt.Rows[0][2].ToString());
            }

            lbl_DescripcionJuego.Text = dt.Rows[0][7].ToString();
            lbl_requisitosJuego.Text = dt.Rows[0][8].ToString();

            
        }

        protected void cargarImagenes(string codJuego)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ds.ObtenerTabla("Imagenes", "SELECT RutaImagen FROM Imagenes WHERE CodJuego = '" + codJuego + "'");

            int i = 1;

            foreach (DataRow row in dt.Rows)
            {
                string rutaImagen = row[0].ToString().Replace("~", "..");

                literalImgGrandes.Text+= armarDIVImagen(rutaImagen, false, i);
                literalImgChicas.Text += armarDIVImagen(rutaImagen, true, i);
                i++;
            }
        }

        protected string armarDIVImagen(string rutaImagen, bool imagenChica, int pos)
        {
            string div = "";

            if (imagenChica)
            {
                div = "<div class=\"column\">"
                           + "<img class=\"cursor imagenesChicas\" src=" + rutaImagen + " onclick=\"currentSlide(" + pos + ")\" alt=\"\">"
                           + "</div>";
            }
            else
            {
                div = "<div class=\"mySlides\">"
                           + "<img class=\"imagenesGrandes\" src=" + rutaImagen + ">"
                           + "</div>";
            }

            return div;
        }

        protected void btn_AñadirCarritoJuego_Click(object sender, EventArgs e)
        {
            añadirAlCarrito();
            Response.Redirect(Request.RawUrl);
        }

        protected void añadirAlCarrito()
        {
            ClaseCarrito car = new ClaseCarrito();

            if (Session["Carrito"] == null)
            {
                Session["Carrito"] = car.crearTablaEnCarrito();
            }

            string codJuego = Request.QueryString["c"];
            int cantidad = 1;
            if (txb_cantAcomprarJuego.Value != "")
                cantidad = Convert.ToInt32(txb_cantAcomprarJuego.Value);
            decimal precio = Convert.ToDecimal(lbl_PrecioConDescuento.Text);

            int stock = Convert.ToInt32(lbl_stockJuego.Text);

            DataTable tabla = (DataTable)Session["Carrito"];
            int i = 0, cantEncontrada = 0;
            bool encontro = false;
            foreach (DataRow row in tabla.Rows)
            {
                if (codJuego == row[0].ToString())
                {
                    encontro = true;
                    cantEncontrada = (int)row[2];
                    break;
                }
                i++;
            }

            if (!encontro)
            {
                AccesoDatos ds = new AccesoDatos();
                DataTable dt = new DataTable();
                dt = ds.ObtenerTabla("Descuento", "SELECT Porcentaje, FechaInicio, FechaFin, Estado FROM descuentos WHERE CodJuego = '" + codJuego + "'");

                if(dt.Rows[0][3].ToString() == "False")
                    car.AgregarFilaCarrito((DataTable)Session["Carrito"], codJuego, lbl_tituloJuego.Text, cantidad, precio, 0);
                else
                {
                    if (DateTime.Now >= Convert.ToDateTime(dt.Rows[0][1]) && DateTime.Now < Convert.ToDateTime(dt.Rows[0][2]))
                        car.AgregarFilaCarrito((DataTable)Session["Carrito"], codJuego, lbl_tituloJuego.Text, cantidad, precio, Convert.ToInt32(dt.Rows[0][0].ToString()));
                    else
                        car.AgregarFilaCarrito((DataTable)Session["Carrito"], codJuego, lbl_tituloJuego.Text, cantidad, precio, 0);
                }
            }
            else
            {
                if (cantEncontrada < stock)
                {
                    if (cantEncontrada + cantidad <= stock)
                    {
                        car.ModificarFilaCarrito((DataTable)Session["Carrito"], i, cantidad);
                    }
                    else
                    {
                        car.ModificarFilaCarrito((DataTable)Session["Carrito"], i, stock - cantEncontrada);
                    }
                }
                else
                {
                    car.ModificarFilaCarrito((DataTable)Session["Carrito"], i, stock - cantEncontrada);
                }
            }
        }

        protected void btn_comprarJuego_Click(object sender, EventArgs e)
        {
            añadirAlCarrito();
            Response.Redirect("Carrito.aspx");
        }
    }
}