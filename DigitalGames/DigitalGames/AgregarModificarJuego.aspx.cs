using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;

namespace DigitalGames
{
    public partial class AgregarModificarJuego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void limpiarPagina()
        {
            txb_nombre.Text = "";
            txb_empresa.Text = "";
            txb_descripcion.Text = "";
            txb_requisitos.Text = "";
            txb_tipo.Text = "";
            rbl_listaConsolas.SelectedIndex = 0;

            txb_Precio.Text = "";
            lbl_stockActual.Text = "0";
            txb_codigo.Text = "";

            txb_Porcentaje.Text = "";
            txb_FechaInicio.Text = "";
            txb_FechaFin.Text = "";
        }

        protected void validarTextbox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value != "");
        }

        protected void validarCodJuego_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int aux = 0;

            if(lb_CodJuegos.Items.Count > 0)
            {
                for (int i = 0; i < lb_CodJuegos.Items.Count; i++)
                {
                    if(args.Value == lb_CodJuegos.Items[i].ToString())
                    {
                        aux++;
                    }
                }

                if (aux == 0)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = true;
            }
            
        }

        protected void btn_guardarCambios_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                funcionesJuegos fJue = new funcionesJuegos();
                ClaseJuego jue = new ClaseJuego();
                Descuento desc = new Descuento();

                string aux = Request.Form["ip_listboxCodigos"].ToString();
                string[] codigos = aux.Split('-');

                lbl_stockActual.Text = (codigos.Length - 1).ToString();

                jue.GenerarCod();
                jue.nombre = txb_nombre.Text;
                jue.empresa = txb_empresa.Text;
                jue.tipo = txb_tipo.Text;
                jue.precio = Convert.ToDecimal(txb_Precio.Text.Replace(".", ","));
                jue.stock = Convert.ToInt32(lbl_stockActual.Text);
                jue.consola = rbl_listaConsolas.SelectedItem.Text;
                jue.descripcion = txb_descripcion.Text;
                jue.requisitos = txb_requisitos.Text;

                desc.GenerarCod();
                desc.codJuego = jue.codJuego;
                desc.porcentaje = Convert.ToInt32(txb_Porcentaje.Text);
                desc.fechaInicio = txb_FechaInicio.Text;
                desc.fechaFin = txb_FechaFin.Text;
                desc.estado = chx_Disponibilidad.Checked;

                fJue.AgregarJuego(jue);
                fJue.AgregarDescuento(desc);

                foreach (string codigo in codigos)
                {
                    if (codigo != string.Empty)
                    {
                        fJue.AgregarCodActivacion(codigo, jue.codJuego);
                    }
                }

                limpiarPagina();
            }

            if (fu_cargadorDeArchivo.HasFile)
            {
                foreach (HttpPostedFile archivo in fu_cargadorDeArchivo.PostedFiles)
                {
                    try
                    {
                        fu_cargadorDeArchivo.SaveAs(Path.Combine(Server.MapPath("~/Imagenes/"),
                        fu_cargadorDeArchivo.FileName));
                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
        }
    }
}