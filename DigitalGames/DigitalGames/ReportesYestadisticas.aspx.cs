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
                cargarDDLJuegos();
                cargarGridViewJuegos(ddl_ordenarRecaudacion.SelectedValue);

                cargarDDLUsuariosReg();
                cargarGridUsuariosReg(ddl_usuariosRegistrados.SelectedValue);

                cargarDDLFrecUsuarios();
                cargarGridFrecUsuarios(ddl_frecuenciaUsuarios.SelectedValue);

                btn_Juegos.Attributes.Add("Style", "background-color: #0c5289");
                Juegos.Attributes.Add("Style", "display:block");
            }
        }

        protected void cargarDDLJuegos()
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

        protected void cargarDDLUsuariosReg()
        {
            ddl_usuariosRegistrados.Items.Add("Desde siempre");
            ddl_usuariosRegistrados.Items.Add("Ultimo Año");
            ddl_usuariosRegistrados.Items.Add("Ultimo mes");
            ddl_usuariosRegistrados.Items.Add("Ultima semana");
            ddl_usuariosRegistrados.Items.Add("Ultimo dia");

            ddl_usuariosRegistrados.Items[0].Value = "";
            ddl_usuariosRegistrados.Items[1].Value = "Year, -1";
            ddl_usuariosRegistrados.Items[2].Value = "Month, -1";
            ddl_usuariosRegistrados.Items[3].Value = "Week, -1";
            ddl_usuariosRegistrados.Items[4].Value = "Day, -1";

            ddl_ordenarRecaudacion.SelectedIndex = 0;
        }

        protected void cargarDDLFrecUsuarios()
        {
            ddl_frecuenciaUsuarios.Items.Add("Desde siempre");
            ddl_frecuenciaUsuarios.Items.Add("Ultimo mes");
            ddl_frecuenciaUsuarios.Items.Add("Ultima semana");
            ddl_frecuenciaUsuarios.Items.Add("Ultimo dia");
            ddl_frecuenciaUsuarios.Items.Add("Ultima hora");


            ddl_frecuenciaUsuarios.Items[0].Value = "";
            ddl_frecuenciaUsuarios.Items[1].Value = "Month, -1";
            ddl_frecuenciaUsuarios.Items[2].Value = "Week, -1";
            ddl_frecuenciaUsuarios.Items[3].Value = "Day, -1";
            ddl_frecuenciaUsuarios.Items[4].Value = "Hour, -1";

            ddl_frecuenciaUsuarios.SelectedIndex = 0;
        }

        protected void cargarGridViewJuegos(string orden)
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

        protected void cargarGridUsuariosReg(string filtro)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = null;

            if (filtro != "")
            {
                tabla = ds.ObtenerTabla("Juegos", "SELECT NombreUsuario, Administrador, CONVERT(VARCHAR(10),fechadecreacion,103) AS FechaDecreación, RIGHT(fechadecreacion, 7) AS HoraDeCreación, estado FROM Usuarios"
                                                          + " WHERE fechadecreacion <= SYSDATETIME() AND fechadecreacion > DATEADD(" + filtro + ", SYSDATETIME()) ORDER BY fechadecreacion DESC");
            }
            else
            {
                tabla = ds.ObtenerTabla("Juegos", "SELECT NombreUsuario, Administrador, CONVERT(VARCHAR(10),fechadecreacion,103) AS FechaDecreación, RIGHT(fechadecreacion, 7) AS HoraDeCreación, estado FROM Usuarios ORDER BY fechadecreacion DESC");
            }

            lbl_cantidadUsuariosReg.InnerHtml = "Cantidad: " + tabla.Rows.Count;

            gv_usuariosRegistrados.DataSource = tabla;
            gv_usuariosRegistrados.DataBind();
        }

        protected void cargarGridFrecUsuarios(string filtro)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = null;

            if (filtro != "")
            {
                tabla = ds.ObtenerTabla("Juegos", "SELECT nombreUsuario, COUNT(nombreUsuario) AS cantidadUsuario FROM conexionesUsuarios"
                                                + " WHERE fechaConexion <= SYSDATETIME() AND fechaConexion > DATEADD(" + filtro + ", SYSDATETIME())"
                                                + " GROUP BY nombreUsuario"
                                                + " ORDER BY cantidadUsuario DESC");
            }
            else
            {
                tabla = ds.ObtenerTabla("Juegos", "SELECT nombreUsuario, COUNT(nombreUsuario) AS cantidadUsuario FROM conexionesUsuarios"
                                                + " GROUP BY nombreUsuario"
                                                + " ORDER BY cantidadUsuario DESC");
            }

            gv_frecuenciaUsuarios.DataSource = tabla;
            gv_frecuenciaUsuarios.DataBind();
        }

        protected void btn_ordenar_Click(object sender, EventArgs e)
        {
            cargarGridViewJuegos(ddl_ordenarRecaudacion.SelectedValue);
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
            Usuarios.Attributes.Add("Style", "display:block");
            General.Attributes.Add("Style", "display:none");
        }

        protected void btn_General_Click(object sender, EventArgs e)
        {
            btn_Juegos.Attributes.Add("Style", "background-color: #4e7797");
            btn_Usuarios.Attributes.Add("Style", "background-color: #4e7797");
            btn_General.Attributes.Add("Style", "background-color: #0c5289");

            Juegos.Attributes.Add("Style", "display:none");
            Usuarios.Attributes.Add("Style", "display:none");
            General.Attributes.Add("Style", "display:block");
        }

        protected void btn_filtrar_Click(object sender, EventArgs e)
        {
            cargarGridUsuariosReg(ddl_usuariosRegistrados.SelectedValue);
        }

        protected void btn_filtrarFrecuenciaUsu_Click(object sender, EventArgs e)
        {
            cargarGridFrecUsuarios(ddl_frecuenciaUsuarios.SelectedValue);
        }
    }
}