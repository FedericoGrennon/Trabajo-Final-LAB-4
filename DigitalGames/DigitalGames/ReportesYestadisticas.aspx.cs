using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class ReportesYestadisticas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargarDDL();
                cargarGridView(ddl_ordenarRecaudacion.SelectedValue);
                btn_Juegos.Attributes.Add("Style", "background-color: #0c5289");
                Juegos.Attributes.Add("Style", "display:block");
            }
        }

        protected void cargarDDL()
        {
            ddl_ordenarRecaudacion.Items.Add("Mayor recaudacion");
            ddl_ordenarRecaudacion.Items.Add("Menor recaudacion");
            ddl_ordenarRecaudacion.Items.Add("Mayor vendido");
            ddl_ordenarRecaudacion.Items.Add("Menor vendido");
            ddl_ordenarRecaudacion.Items.Add("[A-Z]");
            ddl_ordenarRecaudacion.Items.Add("[Z-A]");
            ddl_ordenarRecaudacion.Items.Add("Mayor vendido con descuento");
            ddl_ordenarRecaudacion.Items.Add("Menor vendido con descuento");
            ddl_ordenarRecaudacion.Items.Add("Mayor vendido sin descuento");
            ddl_ordenarRecaudacion.Items.Add("Menor vendido sin descuento");

            ddl_ordenarRecaudacion.Items[0].Value = "Recaudacion DESC";
            ddl_ordenarRecaudacion.Items[1].Value = "Recaudacion ASC";
            ddl_ordenarRecaudacion.Items[2].Value = "CantVentasTotales DESC";
            ddl_ordenarRecaudacion.Items[3].Value = "CantVentasTotales ASC";
            ddl_ordenarRecaudacion.Items[4].Value = "nombre ASC";
            ddl_ordenarRecaudacion.Items[5].Value = "nombre DESC";
            ddl_ordenarRecaudacion.Items[6].Value = "cantVentasDesc DESC";
            ddl_ordenarRecaudacion.Items[7].Value = "cantVentasDesc ASC";
            ddl_ordenarRecaudacion.Items[8].Value = "cantVentasSinDesc DESC";
            ddl_ordenarRecaudacion.Items[9].Value = "cantVentasSinDesc ASC";

            ddl_ordenarRecaudacion.SelectedIndex = 0;
        }

        protected void cargarGridView(string orden)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = ds.ObtenerTabla("Juegos", "SELECT Nombre, SUM(CASE WHEN Porcentaje = 0 Then cantidad ELSE 0 End) as cantVentasSinDesc,  SUM(CASE WHEN Porcentaje > 0 Then cantidad ELSE 0 End) as cantVentasDesc, SUM(Cantidad) as CantVentasTotales, SUM(PrecioUnitario*Cantidad) as Recaudacion"
                                                     + " FROM DetalleVenta dv"
                                                     + " INNER JOIN Juegos j"
                                                     + " ON j.CodJuego = dv.CodJuego"
                                                     + " GROUP BY Nombre ORDER BY " + orden);

            gv_Juegos.DataSource = tabla;
            gv_Juegos.DataBind();
        }

        protected void btn_ordenar_Click(object sender, EventArgs e)
        {
            cargarGridView(ddl_ordenarRecaudacion.SelectedValue);
        }

        protected void btn_Juegos_Click(object sender, EventArgs e)
        {
            btn_Juegos.Attributes.Add("Style", "background-color: #0c5289");
            btn_Usuarios.Attributes.Add("Style", "background-color: #4e7797");
            btn_General.Attributes.Add("Style", "background-color: #4e7797");

            Juegos.Attributes.Add("Style", "display:block");
            Usuarios.Attributes.Add("Style", "display:none");
            General.Attributes.Add("Style", "display:none");
        }

        protected void btn_Usuarios_Click(object sender, EventArgs e)
        {
            btn_Juegos.Attributes.Add("Style", "background-color: #4e7797");
            btn_Usuarios.Attributes.Add("Style", "background-color: #0c5289");
            btn_General.Attributes.Add("Style", "background-color: #4e7797");

            Juegos.Attributes.Add("Style", "display:none");
            Usuarios.Attributes.Add("Style", "display:none");
            General.Attributes.Add("Style", "display:block");
        }

        protected void btn_General_Click(object sender, EventArgs e)
        {
            btn_Juegos.Attributes.Add("Style", "background-color: #4e7797");
            btn_Usuarios.Attributes.Add("Style", "background-color: #4e7797");
            btn_General.Attributes.Add("Style", "background-color: #0c5289");

            Juegos.Attributes.Add("Style", "display:none");
            Usuarios.Attributes.Add("Style", "display:block");
            General.Attributes.Add("Style", "display:none");
        }
    }
}