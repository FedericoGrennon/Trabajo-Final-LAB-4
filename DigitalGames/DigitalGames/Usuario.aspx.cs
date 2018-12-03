using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class Usuario : System.Web.UI.Page
    {
        Usuarios us = new Usuarios();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                cargarUsuario(us);
                cargarTarjetas();
                cargarCompras();

                if (!Page.IsPostBack)
                {
                    remplazarLabels(us);
                }
            }
        }

        protected void cargarCompras()
        {
            AccesoDatos ad = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ad.ObtenerTabla("Usuarios", "SELECT v.FechaCompra, v.Numerotarjeta, dv.PrecioUnitario , j.Nombre, ca.CodActivacion"
                                           + " FROM Ventas v"
                                           + " INNER JOIN DetalleVenta dv"
                                           + " ON V.CodVenta = dv.CodVenta"
                                           + " INNER JOIN Juegos j ON j.CodJuego = dv.CodJuego"
                                           + " INNER JOIN CodActivacionVendidos ca"
                                           + " ON dv.CodVenta = ca.CodVenta AND dv.CodJuego = ca.CodJuego"
                                           + " WHERE v.NombreUsuario = '" + us.nombreUsuario + "'");
            int i = 0;
            foreach (DataRow row in dt.Rows)
            {
                
                string ultimosDigitos = row[1].ToString().Substring(row[1].ToString().Length - 4, 4);
                string fechaCompra = row[0].ToString().Substring(0, row[0].ToString().Length - 10);
                string precioUnitario = row[2].ToString().Substring(0, row[2].ToString().Length - 2);

                if (i==0)
                    literalCompras.Text = armarDivCompras(row[3].ToString(), precioUnitario, fechaCompra, ultimosDigitos, row[4].ToString());
                else
                    literalCompras.Text += armarDivCompras(row[3].ToString(), precioUnitario, fechaCompra, ultimosDigitos, row[4].ToString());
                i++;
            }
            if (dt.Rows.Count <= 0)
            {
                literalCompras.Text = "<a>No realizo ninguna compra</a>";
            }
        }

        protected void cargarTarjetas()
        {
            AccesoDatos ad = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ad.ObtenerTabla("Usuarios", "SELECT numeroTarjeta, banco, fechavencimiento FROM tarjetas WHERE nombreUsuario = '" + us.nombreUsuario + "'");
            int i = 0;

            foreach (DataRow row in dt.Rows)
            {
                string ultimosDigitos = row[0].ToString().Substring(row[0].ToString().Length-4, 4);
                string[] aux = row[2].ToString().Split('/');
                string fechaVencimiento = aux[1] + " / " + aux[2].Substring(0, 4);

                if(i==0)
                    literalTarjetas.Text = armarDivTarjetas(ultimosDigitos, row[1].ToString(), fechaVencimiento);
                else
                    literalTarjetas.Text += armarDivTarjetas(ultimosDigitos, row[1].ToString(), fechaVencimiento);
                i++;
            }

            if (dt.Rows.Count <= 0)
            {
                literalTarjetas.Text = "<a>No tiene ninguna tarjeta cargada</a>";
            }
        }

        protected void cargarUsuario(Usuarios us)
        {
            string[] usuario = (string[])Session["Usuario"];

            AccesoDatos ad = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ad.ObtenerTabla("Usuarios", "SELECT * FROM usuarios WHERE nombreUsuario = '" + usuario[0] + "'");
            us.nombreUsuario = dt.Rows[0][0].ToString();
            us.contraseña = dt.Rows[0][2].ToString();
            us.mail = dt.Rows[0][3].ToString();
            us.nombre = dt.Rows[0][4].ToString();
            us.apellido = dt.Rows[0][5].ToString();
            us.fechaNacimiento = Convert.ToDateTime(dt.Rows[0][6].ToString());
            us.pais = dt.Rows[0][7].ToString();
            us.provincia = dt.Rows[0][8].ToString();
            us.localidad = dt.Rows[0][9].ToString();
            us.telefono = dt.Rows[0][10].ToString();
        }

        protected void ActualizarClaseUsuario(Usuarios us)
        {
            us.nombreUsuario = txb_nombreUsuario.Value;
            us.contraseña = txb_contraseñaUsuario.Value;
            us.mail = txb_MailUsuario.Value;
            us.nombre = txb_nombreCompletoUsuario.Value;
            us.apellido = txb_apellidoUsuario.Value;
            us.fechaNacimiento = Convert.ToDateTime(txb_fechaNacUsuario.Value);
            us.pais = txb_PaisUsuario.Value;
            us.provincia = txb_ProvinciaUsuario.Value;
            us.localidad = txb_LocalidadUsuario.Value;
            us.telefono = txb_TelefonoUsuario.Value;
        }

        protected void remplazarLabels(Usuarios us)
        {
            txb_nombreUsuario.Value = us.nombreUsuario;
            txb_MailUsuario.Value = us.mail;
            txb_contraseñaUsuario.Value = us.contraseña;
            txb_nombreCompletoUsuario.Value = us.nombre;
            txb_apellidoUsuario.Value = us.apellido;
            txb_fechaNacUsuario.Value = us.fechaNacimiento.ToString("yyyy-MM-dd");
            txb_PaisUsuario.Value = us.pais;
            txb_ProvinciaUsuario.Value = us.provincia;
            txb_LocalidadUsuario.Value = us.localidad;
            txb_TelefonoUsuario.Value = us.telefono;
        }

        protected void cv_validarNombreReg_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "")
            {
                AccesoDatos ds = new AccesoDatos();
                DataTable dt = new DataTable();
                dt = ds.ObtenerTabla("Usuario", "SELECT NombreUsuario FROM Usuarios WHERE NombreUsuario != '" + us.nombreUsuario + "'");
                bool esta = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (txb_nombreUsuario.Value == row[0].ToString())
                    {
                        esta = false;
                        break;
                    }
                }

                args.IsValid = esta;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void cv_validarEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "")
            {
                AccesoDatos ds = new AccesoDatos();
                DataTable dt = new DataTable();
                dt = ds.ObtenerTabla("Usuario", "SELECT mail FROM Usuarios WHERE NombreUsuario != '" + us.nombreUsuario + "'");
                bool esta = true;
                foreach (DataRow row in dt.Rows)
                {
                    if (txb_MailUsuario.Value == row[0].ToString())
                    {
                        esta = false;
                        break;
                    }
                }

                args.IsValid = esta;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void validarTextbox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value != "");
        }

        protected string armarDivTarjetas(string ultimosDigitos, string banco, string fechaVencimiento)
        {
            string div = "<div class=\"tarjeta\">"
                            + "<div><h4>Ultimos 4 digitos: </h4><a class=\"camposUsuario\">" + ultimosDigitos + "</a></div>"
                            + "<div><h4> Banco: </h4><a class=\"camposUsuario\">" + banco + "</a></div>"
                            + "<div><h4> Vencimiento: </h4><a class=\"camposUsuario\">" + fechaVencimiento + "</a></div>"
                         + "</div>";

            return div;
        }

        protected string armarDivCompras(string nombreJuego, string precioUnitario, string fechaCompra, string ultimosDigitosTarj, string codActivacion)
        {
            string div = "<div class=\"compra\">"
                            +"<div><h4>Nombre de juego: </h4><a>" + nombreJuego + "</a></div>"
                            +"<div><h4>Precio: </h4> <a>ARS $" + precioUnitario + "</a></div>"
                            +"<div><h4>Fecha de compra: </h4><a>" + fechaCompra + "</a></div>"
                            +"<div><h4>Ultimos 4 digitos de tarjeta: </h4><a>" + ultimosDigitosTarj + "</a></div>"
                            +"<div><h4>Codigo de activacion: </h4><a>" + codActivacion + "</a></div>"
                        +"</div>";

            return div;
        }

        protected void btn_eliminarTarjeta_Click(object sender, EventArgs e)
        {
            AccesoDatos ad = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ad.ObtenerTabla("Usuarios", "SELECT numeroTarjeta FROM tarjetas WHERE nombreUsuario = '" + us.nombreUsuario + "'");
            foreach (DataRow row in dt.Rows)
            {
               if(txb_4DigitosAborrar.Text == row[0].ToString())
                {
                    ad.EliminarTarjeta(row[0].ToString());
                    break;
                }
            }

            Response.Redirect("Usuario.aspx");
        }

        protected void btn_eliminarCuentaUsuario_Click(object sender, EventArgs e)
        {
            AccesoDatos ds = new AccesoDatos();
            ds.darBajaUsuario(us.nombreUsuario);
            Session["Usuario"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void btn_GuardarCambios_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                funcionesJuegos fJue = new funcionesJuegos();
                ActualizarClaseUsuario(us);
                fJue.ActualizarUsuario(us);
            }
            else
            {
                panelDcuenta.Attributes.Add("display", "block");
                panelDpersonales.Attributes.Add("display", "block");
            }
        }
    }
}