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
            txb_numeroTarjeta.Value = numeroTarjeta;
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
            if (Page.IsValid)
            {
                FuncionesCompra fCompra = new FuncionesCompra();
                string[] usuario = (string[])Session["Usuario"];
                if (!fCompra.verifificarTarjeta(txb_numeroTarjeta.Value, usuario[0]))
                {
                    Tarjeta tar = new Tarjeta();
                    cargarClaseTarjeta(tar);
                    fCompra.AgregarTarjeta(tar);
                }

                Venta ven = new Venta();
                cargarVenta(ven);
                fCompra.AgregarVenta(ven);

                DataTable dt = (DataTable)Session["Carrito"];
                DetalleVenta dVen = new DetalleVenta();

                foreach (DataRow row in dt.Rows)
                {
                    dVen.CodVenta = ven.CodVenta;
                    dVen.CodJuego = row[0].ToString();
                    dVen.cantidad = (int)row[2];
                    dVen.PrecioUnitario = (decimal)row[3];
                    dVen.porcentaje = (int)row[4];
                    fCompra.AgregarDetalleVenta(dVen);

                    AccesoDatos ds = new AccesoDatos();
                    DataTable dt2 = new DataTable();
                    dt2 = ds.ObtenerTabla("CodActivacion", "SELECT CodActivacion, j.Stock FROM CodigosActivacion ca INNER JOIN Juegos j ON ca.CodJuego = j.CodJuego WHERE ca.CodJuego = '" + dVen.CodJuego + "' AND Disponibilidad = 1");
                    for (int i=0; i < dVen.cantidad; i++)
                    {
                        fCompra.AgregarCodActivacionVendidos(dVen.CodVenta, dVen.CodJuego, dt2.Rows[i][0].ToString());
                        fCompra.darBajaCodActivacion(dt2.Rows[i][0].ToString(), dVen.CodJuego);
                    }
                    int stock = Convert.ToInt32(dt2.Rows[0][1]) - dVen.cantidad;
                    fCompra.actualizarStock(dVen.CodJuego, stock);
                }

                Session["Carrito"] = null;
                Session["CodVenta"] = ven.CodVenta;
                Response.Redirect("CompraFinalizada.aspx");
            }
        }

        protected void cargarClaseTarjeta(Tarjeta tar)
        {
            string[] usuario = (string[])Session["Usuario"];
            tar.NumeroTarjeta = txb_numeroTarjeta.Value;
            tar.NombreUsuario = usuario[0];
            tar.fechaVencimiento = Convert.ToDateTime(txb_fechaVencimiento.Value);
            tar.NombreTitular = txb_NombreTitular.Value;
            tar.DNI = txb_DNI.Value;
            tar.banco = txb_banco.Value;
        }

        protected void cargarVenta(Venta ven)
        {
            string[] usuario = (string[])Session["Usuario"];
            ven.GenerarCod();
            ven.NombreUsuario = usuario[0];
            ven.fechaCompra = DateTime.Now;
            ven.Precio = cargarTotal();
            ven.numeroTarjeta = txb_numeroTarjeta.Value;
        }

        protected decimal cargarTotal()
        {
            DataTable dt = (DataTable)Session["Carrito"];
            decimal total = 0;
            foreach(DataRow row in dt.Rows)
            {
                total += (int)row[2] * (decimal)row[3];
            }

            return total;
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }
    }
}