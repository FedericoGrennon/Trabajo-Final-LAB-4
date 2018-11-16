using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace DigitalGames
{
    public partial class AgregarModificarJuego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void validarTextbox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value != "");
        }

        protected void cv_listaImagenes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (lb_urlImagenes.Items.Count > 0);
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

                jue.GenerarCod();
                jue.codJuego = jue.codJuego;
                jue.nombre = txb_nombre.Text;
                jue.empresa = txb_empresa.Text;
                jue.tipo = txb_tipo.Text;
                jue.precio = Convert.ToDecimal(txb_Precio.Text.Replace(".", ","));
                jue.stock = Convert.ToInt32(lbl_stockActual.Text);
                jue.consola = rbl_listaConsolas.SelectedItem.Text;
                jue.descripcion = txb_descripcion.Text;
                jue.requisitos = txb_requisitos.Text;

                string aux = Request.Form["ip_listboxCodigos"].ToString();
                string[] codigos = aux.Split('-');

                lbl_stockActual.Text = (codigos.Length - 1).ToString();
                fJue.AgregarJuego(jue);

                foreach (string codigo in codigos)
                {
                    if (codigo != string.Empty)
                    {
                        fJue.AgregarCodActivacion(codigo, jue.codJuego);
                    }
                }
            }


            //if (fu_cargadorDeArchivo.HasFile)
            //{
            //    try
            //    {
            //        string filename = (Server.MapPath("~/Imagenes/") + fu_cargadorDeArchivo.FileName);
            //        fu_cargadorDeArchivo.SaveAs(filename);
            //    }
            //    catch (Exception ex)
            //    {

            //    }
            //}
        }
    }
}