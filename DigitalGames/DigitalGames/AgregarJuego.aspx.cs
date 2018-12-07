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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                funcionesJuegos fJue = new funcionesJuegos();
                ClaseJuego jue = new ClaseJuego();
                if(Session["Juego"] == null)
                {
                    Session["Juego"] = fJue.crearTabla();
                }

                jue.GenerarCod();
                jue.nombre = txb_nombre.Value;
                jue.empresa = txb_empresa.Value;
                jue.tipo = txb_tipo.Value;
                jue.precio = 0;
                jue.stock = 0;
                jue.consola = rbl_listaConsolas.SelectedItem.ToString();
                jue.descripcion = txb_descripcion.Value;
                jue.requisitos = txb_requisitos.Value;

                fJue.AgregarFila((DataTable)Session["Juego"], jue);
            }
        }

        protected void cv_nombre_ServerValidate(object source, ServerValidateEventArgs args)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();
            dt = ds.ObtenerTabla("Juegos", "SELECT Nombre FROM Juegos WHERE Nombre = '" + txb_nombre.Value + "'");
            bool esta = true;
            if(dt.Rows.Count <= 0)
            {
                if(txb_nombre.Value == string.Empty)
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
    }
}