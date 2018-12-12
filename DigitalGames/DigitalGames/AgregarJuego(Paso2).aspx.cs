using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DigitalGames
{
    public partial class AgregarJuego_Paso2_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["Modificar"] != null)
                {
                    if (Session["CodigosActivacion"] == null)
                        cargarJuego();
                    else
                        cargarTextBox();
                }
            }
        }

        protected void cargarTextBox()
        {
            txb_codigo.Text = "";

            DataTable tabla = (DataTable)Session["Juego"];
            txb_Precio.Value = tabla.Rows[0][4].ToString().Replace(',', '.');
            lbl_stockActual.Text = tabla.Rows[0][5].ToString();

            if(lbl_stockActual.Text != "0")
            {
                if (Session["Stock"] == null)
                    Session["Stock"] = (int)tabla.Rows[0][5];

                tabla = (DataTable)Session["CodigosActivacion"];

                foreach (DataRow row in tabla.Rows)
                {
                    lb_CodJuegos.Items.Add(row[0].ToString());
                }
            }
        }

        protected void cargarJuego()
        {
            DataTable tabla = (DataTable)Session["Juego"];
            string codJuego = tabla.Rows[0][0].ToString();

            txb_Precio.Value = tabla.Rows[0][4].ToString().Replace(',', '.').Substring(0, tabla.Rows[0][4].ToString().Length - 2);
            lbl_stockActual.Text = tabla.Rows[0][5].ToString();

            if(lbl_stockActual.Text != "0")
            {
                if (Session["Stock"] == null)
                    Session["Stock"] = (int)tabla.Rows[0][5];

                funcionesJuegos fJue = new funcionesJuegos();
                AccesoDatos ds = new AccesoDatos();
                tabla = ds.ObtenerTabla("Codigos", "SELECT CodActivacion FROM CodigosActivacion WHERE CodJuego = '" + codJuego + "' AND Disponibilidad = 1");
                foreach (DataRow row in tabla.Rows)
                {
                    lb_CodJuegos.Items.Add(row[0].ToString());
                    if (Session["CodigosActivacion"] == null)
                        Session["CodigosActivacion"] = fJue.crearTablaCodigos();

                    fJue.AgregarFilaCodigos((DataTable)Session["CodigosActivacion"], row[0].ToString(), codJuego, true);
                }
            }
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            if (cv_codigo.IsValid)
            {
                if (Session["Stock"] == null)
                    Session["Stock"] = 0;

                lb_CodJuegos.Items.Add(modificarCodigo());
                Session["Stock"] = (int)Session["Stock"] + 1;
                lbl_stockActual.Text = Session["Stock"].ToString();

                funcionesJuegos fJue = new funcionesJuegos();
                DataTable tabla = (DataTable)Session["Juego"];

                string codJuego = tabla.Rows[0][0].ToString();

                if (Session["CodigosActivacion"] == null)
                    Session["CodigosActivacion"] = fJue.crearTablaCodigos();

                fJue.AgregarFilaCodigos((DataTable)Session["CodigosActivacion"], modificarCodigo(), codJuego, false);
                txb_codigo.Text = "";
            }
        }

        protected string modificarCodigo()
        {
            int i = 0;
            string codigo = "";
            foreach (char letra in txb_codigo.Text.ToCharArray())
            {
                if (i == 4)
                {
                    codigo += '-';
                    i = 0;
                }

                codigo += letra;
                i++;
            }

            return codigo.ToUpper();
        }

        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            if (rqv_precio.IsValid)
            {
                DataTable tabla = (DataTable)Session["Juego"];
                tabla.Rows[0][5] = Convert.ToInt32(lbl_stockActual.Text);
                tabla.Rows[0][4] = Convert.ToDecimal(txb_Precio.Value.Replace('.', ','));

                Session["Stock"] = null;

                Response.Redirect("AgregarJuego(Paso3).aspx");
            }
        }

        protected void cv_codigo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            bool esta = true;

            if (txb_codigo.Text == string.Empty || txb_codigo.Text.Length != 16)
            {
                esta = false;
            }
            else
            {
                string pattern = "^[A-Za-z0-9]";
                System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(pattern);
                foreach (char letra in txb_codigo.Text.ToCharArray())
                {
                    if (!regex.IsMatch(letra.ToString()) || letra == ' ')
                    {
                        esta = false;
                        break;
                    }
                }

                if (esta)
                {
                    foreach (ListItem item in lb_CodJuegos.Items)
                    {
                        if (item.ToString() == modificarCodigo())
                        {
                            esta = false;
                            break;
                        }
                    }
                    if (esta)
                    {
                        AccesoDatos ds = new AccesoDatos();
                        DataTable dt = new DataTable();
                        dt = ds.ObtenerTabla("Codigos", "SELECT CodActivacion FROM CodigosActivacion WHERE CodActivacion = '" + modificarCodigo() + "'");

                        if (dt.Rows.Count > 0)
                        {
                            esta = false;
                        }
                    }
                }
            }

            args.IsValid = esta;
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if(lb_CodJuegos.Items.Count > 0)
            {
                if(lb_CodJuegos.SelectedIndex >= 0)
                {
                    if (Session["CodigosActivacion"] != null)
                    {
                        DataTable tabla = (DataTable)Session["CodigosActivacion"];

                        if ((bool)tabla.Rows[lb_CodJuegos.SelectedIndex][3])
                        {
                            funcionesJuegos fJue = new funcionesJuegos();
                            if (Session["CodigosEliminar"] == null)
                                Session["CodigosEliminar"] = fJue.crearTablaCodActivacionEliminar();

                            fJue.AgregarFilaCodActivacionEliminar((DataTable)Session["CodigosEliminar"], tabla.Rows[lb_CodJuegos.SelectedIndex][0].ToString());
                        }

                        tabla.Rows[lb_CodJuegos.SelectedIndex].Delete();
                        if (tabla.Rows.Count <= 0)
                            Session["CodigosActivacion"] = null;
                    }

                    string codigo = lb_CodJuegos.SelectedItem.ToString();

                    lb_CodJuegos.Items.RemoveAt(lb_CodJuegos.SelectedIndex);
                    if((int)Session["Stock"] > 0)
                        Session["Stock"] = (int)Session["Stock"] - 1;
                    lbl_stockActual.Text = Session["Stock"].ToString();
                }
            } 
        }

        protected void btn_eliminarTodo_Click(object sender, EventArgs e)
        {
            if(lb_CodJuegos.Items.Count > 0)
            {
                DataTable tabla = (DataTable)Session["CodigosActivacion"];

                foreach(DataRow row in tabla.Rows)
                {
                    if ((bool)row[3])
                    {
                        funcionesJuegos fJue = new funcionesJuegos();
                        if (Session["CodigosEliminar"] == null)
                            Session["CodigosEliminar"] = fJue.crearTablaCodActivacionEliminar();

                        fJue.AgregarFilaCodActivacionEliminar((DataTable)Session["CodigosEliminar"], row[0].ToString());
                    }
                }

                lb_CodJuegos.Items.Clear();
                Session["Stock"] = null;
                lbl_stockActual.Text = "0";
                Session["CodigosActivacion"] = null;
            }
        }

        protected void btn_Volver_Click(object sender, EventArgs e)
        {
            Session["Stock"] = null;
            Session["CodigosActivacion"] = null;
            Session["CodigosEliminar"] = null;

            DataTable tabla = (DataTable)Session["Juego"];

            if(Session["Modificar"] != null)
                Response.Redirect("AgregarJuego.aspx?cod=" + tabla.Rows[0][0].ToString());
            else
                Response.Redirect("AgregarJuego.aspx");
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Session["CodigosEliminar"] = null;
            Session["Modificar"] = null;
            Session["Juego"] = null;
            Session["Stock"] = null;
            Session["CodigosActivacion"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}