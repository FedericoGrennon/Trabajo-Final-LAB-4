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

                if (!Page.IsPostBack)
                {
                    remplazarLabels(us);
                }   
            }
        }

        protected void cargarTarjetas()
        {
            AccesoDatos ad = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ad.ObtenerTabla("Usuarios", "SELECT numeroTarjeta, banco, fechavencimiento FROM tarjetas WHERE nombreUsuario = '" + us.nombreUsuario + "'");
            int i = 0;
            foreach(DataRow row in dt.Rows)
            {
                string unltimosDigitos = row[0].ToString().Substring(row[0].ToString().Length-4, 4);
                string[] aux = row[2].ToString().Split('/');
                string fechaVencimiento = aux[1] + " / " + aux[2].Substring(0, 4);

                if(i==0)
                    literalTarjetas.Text = armarDivTarjetas(unltimosDigitos, row[1].ToString(), fechaVencimiento);
                else
                    literalTarjetas.Text += armarDivTarjetas(unltimosDigitos, row[1].ToString(), fechaVencimiento);

                i++;
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
    }
}