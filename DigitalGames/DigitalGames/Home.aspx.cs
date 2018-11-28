using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class Home : System.Web.UI.Page
    {
        const int limiteJuegosPorPaginas = 2;
        string consulta = "SELECT j.CodJuego, Nombre, Descripcion, Precio, i.RutaImagen, d.Estado, d.Porcentaje, d.fechaInicio, d.fechaFin FROM Juegos j inner join Imagenes i on j.CodJuego = i.CodJuego inner join Descuentos d on j.CodJuego = d.CodJuego WHERE I.PrimeraImagen = 1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Juego"] != null)
            {
                consulta = "SELECT j.CodJuego, Nombre, Descripcion, Precio, i.RutaImagen, d.Estado, d.Porcentaje, d.fechaInicio, d.fechaFin FROM Juegos j inner join Imagenes i on j.CodJuego = i.CodJuego inner join Descuentos d on j.CodJuego = d.CodJuego WHERE I.PrimeraImagen = 1 AND j.nombre LIKE ('%" + Request.QueryString["Juego"] + "%')";
            }
            if (Request.QueryString["Cons"] != null)
            {
                consulta = "SELECT j.CodJuego, Nombre, Descripcion, Precio, i.RutaImagen, d.Estado, d.Porcentaje, d.fechaInicio, d.fechaFin FROM Juegos j inner join Imagenes i on j.CodJuego = i.CodJuego inner join Descuentos d on j.CodJuego = d.CodJuego WHERE I.PrimeraImagen = 1 AND j.consola = '" + Request.QueryString["Cons"].Replace('-', ' ') + "'";
            }
            if (Request.QueryString["Cat"] != null)
            {
                consulta = "SELECT j.CodJuego, Nombre, Descripcion, Precio, i.RutaImagen, d.Estado, d.Porcentaje, d.fechaInicio, d.fechaFin FROM Juegos j inner join Imagenes i on j.CodJuego = i.CodJuego inner join Descuentos d on j.CodJuego = d.CodJuego WHERE I.PrimeraImagen = 1 AND j.tipo = '" + Request.QueryString["Cat"].Replace('-', ' ') + "'";
            }

            if (!Page.IsPostBack)
            {
                if (Session["UltimaPos"] == null)
                    Session["UltimaPos"] = 0;
                cargarJuegos();
            }
        }

        protected void cargarMasJuegos()
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            int i = 1;
            int ultimaPosicion = Convert.ToInt32(Session["UltimaPos"].ToString());
            dt = ds.ObtenerTabla("Juegos", consulta);
            if (ultimaPosicion < dt.Rows.Count)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (i > ultimaPosicion && i <= (ultimaPosicion + limiteJuegosPorPaginas))
                    {
                        cargar(i, row);
                    }
                    else if (i > (ultimaPosicion + limiteJuegosPorPaginas))
                    {
                        Session["UltimaPos"] = i-1;
                        break;
                    }

                    if (i == dt.Rows.Count)
                    {
                        Session["UltimaPos"] = i;
                    }
                    i++;
                }
            }
        }

        protected void cargarJuegos()
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            int i = 1;
            dt = ds.ObtenerTabla("Juegos", consulta);
            foreach (DataRow row in dt.Rows)
            {
                if (i <= limiteJuegosPorPaginas)
                {
                    cargar(i, row);
                }
                else
                {
                    Session["UltimaPos"] = i-1;
                    break;
                }

                if (i == dt.Rows.Count)
                {
                    Session["UltimaPos"] = i;
                }
                i++;
            }
        }

        protected void cargar(int i, DataRow row)
        {
            string descripcion = row[2].ToString();
            string precio = row[3].ToString();
            string porcentajeDesc = row[6].ToString();

            decimal formula = (Convert.ToDecimal(porcentajeDesc) * Convert.ToDecimal(precio)) / 100;
            string precioDesc = (Convert.ToDecimal(precio) - formula).ToString();
            precioDesc = precioDesc.Substring(0, precioDesc.Length - 2);

            if (descripcion.Length >= 300)
            {
                descripcion = descripcion.Substring(0, 300).Trim(' ');
                descripcion += "...";
            }
            precio = precio.Substring(0, precio.Length - 2);

            if (i % 2 == 0)
            {
                literal.Text += armarDIV(row[4].ToString().Replace("~", ".."), row[1].ToString(), descripcion, precio, row[0].ToString(), false, row[5].ToString(), precioDesc, row[7].ToString(), row[8].ToString());
            }
            else
            {
                literal.Text += armarDIV(row[4].ToString().Replace("~", ".."), row[1].ToString(), descripcion, precio, row[0].ToString(), true, row[5].ToString(), precioDesc, row[7].ToString(), row[8].ToString());
            }
        }

        protected string armarDIV(string rutaImagen, string titulo, string descripcion, string precio, string codJuego, bool izquierda, string descuento, string precioDescuento, string fechaInico, string fechaFin)
        {
            string  div = "<div class=\"container\" style=\"background:url(" + rutaImagen + ")no-repeat center;background-size:cover\">"
                      + "<div class=\"row\">";
            if (izquierda)
            {
                div += "<div class=\"column-66\">";
            }
            else
            {
                div += "<div class=\"column-66\" style=\"text-align:right; float:right\">";
            }
            div += "<h1 class=\"xlarge-font\"><p runat=\"server\" ID=\"lbl_tituloJuegoHome\" Style=\"font-weight:bold\" >" + titulo + "</p></h1>"
                + "<div><p runat=\"server\" ID=\"lbl_descripcionJuegoHome\" class=\"descripciones\" />" + descripcion + "</p></div>";

            if (descuento == "True")
            {
                if (DateTime.Now >= Convert.ToDateTime(fechaInico) && DateTime.Now < Convert.ToDateTime(fechaFin))
                {
                    div += "<div class=\"price\" style=\"text-decoration:line-through\"><a>ARS $</a><a runat=\"server\" ID=\"lbl_PrecioJuegoHome\" class=\"descripcion\" style=\"text-decoration:line-through\" />" + precio + "</a></div>"
                     + "<div class=\"price\"><a>ARS $</a><a runat=\"server\" ID=\"lbl_PrecioJuegoHome\" class=\"descripcion\" />" + precioDescuento + "</a></div>";
                }
                else
                {
                    div += "<div class=\"price\"><a>ARS $</a><a runat=\"server\" ID=\"lbl_PrecioJuegoHome\" class=\"descripcion\" />" + precio + "</a></div>";
                }
            }
            else
            {
                div += "<div class=\"price\"><a>ARS $</a><a runat=\"server\" ID=\"lbl_PrecioJuegoHome\" class=\"descripcion\" />" + precio + "</a></div>";
            }
                div += "<input ID=\"btn_verMasHome\" type=\"button\" class=\"button\" value=\"Ver mas\" onclick=\"redireccionarHome('" + codJuego + "')\" />"
                            + "</div>"
                        + "</div>"
                    + "</div>";

            return div;
        }

        protected void btn_masJuegos_Click(object sender, EventArgs e)
        {
             cargarMasJuegos();
        }
    }
}