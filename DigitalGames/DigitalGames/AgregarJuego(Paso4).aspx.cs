using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace DigitalGames
{
    public partial class AgregarJuego_Paso4_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["CantImagenes"] == null)
                    Session["CantImagenes"] = cantidadImagenes();

                if (Session["Modificar"] != null)
                {
                    btn_FinalizarModificar.Visible = true;
                    cargarDataTableImagenes();
                    AgregarImagen();
                }
                else
                    btn_Finalizar.Visible = true;
            }
        }

        protected void btn_Finalizar_Click(object sender, EventArgs e)
        {
            if (sesionesCreadas())
            {
                if (Page.IsValid)
                {
                    if(lbl_portada.Text != "0")
                    {
                        funcionesJuegos fJue = new funcionesJuegos();
                        ClaseJuego jue = new ClaseJuego();
                        cargarClaseJuego(jue);
                        fJue.AgregarJuego(jue);
                        agregarCodigoActivacion(jue);
                        agregarDescuento(jue);

                        agregarImagenAbasededatos();
                        agregarFisicamenteLaImagen();

                        Session["CodigosEliminar"] = null;
                        Session["Juego"] = null;
                        Session["Stock"] = null;
                        Session["CodigosActivacion"] = null;
                        Session["Descuento"] = null;
                        Session["Imagenes"] = null;
                        Session["CantImagenes"] = null;
                        Session["ImagenesAelminiar"] = null;
                        Page.ClientScript.RegisterStartupScript(GetType(), "scripts", "<script>alert('Juego cargado correctamente')</script>");
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "scripts", "<script>alert('Seleccione una imagen de portada')</script>");
                    }
                    
                }
            }
        }

        protected void btn_FinalizarModificar_Click(object sender, EventArgs e)
        {
            if (sesionesCreadas())
            {
                if (Page.IsValid)
                {
                    if (lbl_portada.Text != "0")
                    {
                        funcionesJuegos fJue = new funcionesJuegos();
                        ClaseJuego jue = new ClaseJuego();

                        cargarClaseJuego(jue);
                        fJue.ActualizarJuego(jue);
                        actualizarCodigoActivacion(jue);
                        if (Session["Descuento"] != null)
                            actulizarDescuento();

                        if (Session["ImagenesAelminiar"] != null)
                        {
                            eliminarFisicamenteImagen(jue);
                        } 

                        agregarImagenAbasededatos();
                        agregarFisicamenteLaImagen();

                        Session["CodigosEliminar"] = null;
                        Session["Juego"] = null;
                        Session["Stock"] = null;
                        Session["CodigosActivacion"] = null;
                        Session["Descuento"] = null;
                        Session["Imagenes"] = null;
                        Session["CantImagenes"] = null;
                        Session["ImagenesAelminiar"] = null;
                        Page.ClientScript.RegisterStartupScript(GetType(), "scripts", "<script>alert('Juego modificado correctamente')</script>");
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "scripts", "<script>alert('Seleccione una imagen de portada')</script>");
                    }
                }
            }
        }

        protected void eliminarFisicamenteImagen(ClaseJuego jue)
        {
            funcionesJuegos fJue = new funcionesJuegos();
            DataTable tabla = (DataTable)Session["ImagenesAelminiar"];

            foreach (DataRow row in tabla.Rows)
            {
                fJue.EliminarImagenBD(row[0].ToString(), jue.codJuego);

                string rutaImagen = AppDomain.CurrentDomain.BaseDirectory + row[1].ToString().Remove(0, 2).Replace('/', '\\');
                File.Delete(rutaImagen);
            }
        }

        protected void agregarImagenAbasededatos()
        {
            funcionesJuegos fJue = new funcionesJuegos();
            DataTable tabla = (DataTable)Session["Imagenes"];
            DataTable DT = (DataTable)Session["Juego"];

            foreach (DataRow row in tabla.Rows)
            {
                if (Session["Modificar"] == null)
                    fJue.AgregarImagen(GenerarCodImagen(), DT.Rows[0][0].ToString(), row[1].ToString(), (bool)row[2]);
                else
                {
                    if(row[0].ToString() == "null")
                    {
                        fJue.AgregarImagen(GenerarCodImagen(), DT.Rows[0][0].ToString(), row[1].ToString(), (bool)row[2]);
                    }
                    else
                    {
                        if (!(bool)row[2])
                            fJue.cambiarEstadoImagen(row[0].ToString(), DT.Rows[0][0].ToString(), "false");
                        else
                            fJue.cambiarEstadoImagen(row[0].ToString(), DT.Rows[0][0].ToString(), "true");
                    }
                }
            }
        }

        protected void agregarFisicamenteLaImagen()
        {
            DataTable tabla = (DataTable)Session["Imagenes"];

            foreach (DataRow row in tabla.Rows)
            {
                if (Session["Modificar"] == null)
                {
                    string rutaImagen = AppDomain.CurrentDomain.BaseDirectory + row[1].ToString().Remove(0, 2).Replace('/', '\\');
                    File.WriteAllBytes(rutaImagen, (byte[])row[3]);
                }
                else
                {
                    if (row[0].ToString() == "null")
                    {
                        string rutaImagen = AppDomain.CurrentDomain.BaseDirectory + row[1].ToString().Remove(0, 2).Replace('/', '\\');
                        File.WriteAllBytes(rutaImagen, (byte[])row[3]);
                    }
                }  
            }
        }

        protected void agregarDescuento(ClaseJuego jue)
        {
            Descuento desc = new Descuento();
            funcionesJuegos fJue = new funcionesJuegos();

            if (Session["Descuento"] != null)
            {
                DataTable tabla = (DataTable)Session["Descuento"];
                
                foreach (DataRow row in tabla.Rows)
                {
                    desc.codDescuento = row[0].ToString();
                    desc.codJuego = row[1].ToString();
                    desc.porcentaje = (int)row[2];
                    desc.fechaInicio = (DateTime)row[3];
                    desc.fechaFin = (DateTime)row[4];
                    desc.estado = (bool)row[5];

                    fJue.AgregarDescuento(desc);
                }
            }
            else
            {
                desc.GenerarCod();
                desc.codJuego = jue.codJuego;
                desc.porcentaje = 0;
                desc.fechaInicio = DateTime.Now;
                desc.fechaFin = DateTime.Now;
                desc.estado = false;

                fJue.AgregarDescuento(desc);
            }
        }

        protected void actulizarDescuento()
        {
            Descuento desc = new Descuento();
            funcionesJuegos fJue = new funcionesJuegos();

            DataTable tabla = (DataTable)Session["Descuento"];

            foreach (DataRow row in tabla.Rows)
            {
                desc.codDescuento = row[0].ToString();
                desc.codJuego = row[1].ToString();
                desc.porcentaje = (int)row[2];
                desc.fechaInicio = (DateTime)row[3];
                desc.fechaFin = (DateTime)row[4];
                desc.estado = (bool)row[5];

                fJue.ActualizarDescuento(desc);
            }
        }

        protected void actualizarCodigoActivacion(ClaseJuego jue)
        {
            if (Session["CodigosActivacion"] != null)
            {
                DataTable codActivacion = (DataTable)Session["CodigosActivacion"];
                
                funcionesJuegos fJue = new funcionesJuegos();

                foreach(DataRow row in codActivacion.Rows)
                {
                    if (!(bool)row[3])
                    {
                        fJue.AgregarCodActivacion(row[0].ToString(), row[1].ToString());
                    }
                }
            }

            if (Session["CodigosEliminar"] != null)
            {
                DataTable codEliminar = (DataTable)Session["CodigosEliminar"];
                FuncionesCompra fCompra = new FuncionesCompra();

                foreach (DataRow row in codEliminar.Rows)
                {
                    fCompra.darBajaCodActivacion(row[0].ToString(), jue.codJuego);
                }
            }
        }

        protected void agregarCodigoActivacion(ClaseJuego jue)
        {
            if (jue.stock > 0)
            {
                funcionesJuegos fJue = new funcionesJuegos();
                DataTable tabla = (DataTable)Session["CodigosActivacion"];
                foreach (DataRow row in tabla.Rows)
                {
                    fJue.AgregarCodActivacion(row[0].ToString(), row[1].ToString());
                }
            }
        }

        protected void cargarClaseJuego(ClaseJuego jue)
        {
            DataTable tabla = (DataTable)Session["Juego"];

            jue.codJuego = tabla.Rows[0][0].ToString();
            jue.nombre = tabla.Rows[0][1].ToString();
            jue.empresa = tabla.Rows[0][2].ToString();
            jue.tipo = tabla.Rows[0][3].ToString();
            jue.precio = (decimal)tabla.Rows[0][4];
            jue.stock = (int)tabla.Rows[0][5];
            jue.consola = tabla.Rows[0][6].ToString();
            jue.descripcion = tabla.Rows[0][7].ToString();
            jue.requisitos = tabla.Rows[0][8].ToString();

        }

        protected bool sesionesCreadas()
        {
            if(Session["Juego"] != null && Session["Imagenes"] != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btn_Volver_Click(object sender, EventArgs e)
        {
            Session["Imagenes"] = null;
            Session["CantImagenes"] = null;
            Session["ImagenesAelminiar"] = null;
            Response.Redirect("AgregarJuego(Paso3).aspx");
        }

        protected void cargarDataTableImagenes()
        {
            funcionesJuegos fJue = new funcionesJuegos();
            AccesoDatos ds = new AccesoDatos();
            DataTable tabla = new DataTable();
            tabla = (DataTable)Session["Juego"];
            string codJuego = tabla.Rows[0][0].ToString();
            tabla = ds.ObtenerTabla("Imagenes", "SELECT codImagen, rutaImagen, primeraImagen FROM Imagenes WHERE CodJuego = '" + codJuego + "'");

            if (Session["Imagenes"] == null)
                Session["Imagenes"] = fJue.crearTablaImagenes();

            byte[] bytesImagen = null;
            int i = 1;
            foreach (DataRow row in tabla.Rows)
            {
                string rutaImagen = AppDomain.CurrentDomain.BaseDirectory + row[1].ToString().Remove(0, 2).Replace('/', '\\');
                bytesImagen = File.ReadAllBytes(rutaImagen);

                fJue.AgregarFilaImagenes((DataTable)Session["Imagenes"], row[0].ToString(), row[1].ToString(), (bool)row[2], bytesImagen);

                if ((bool)row[2])
                {
                    lbl_portada.Text = i.ToString();
                }

               i++;
            }
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Session["CodigosEliminar"] = null;
            Session["Modificar"] = null;
            Session["Juego"] = null;
            Session["Stock"] = null;
            Session["CodigosActivacion"] = null;
            Session["Descuento"] = null;
            Session["Imagenes"] = null;
            Session["CantImagenes"] = null;
            Session["ImagenesAelminiar"] = null;
            Response.Redirect("Home.aspx");
        }

        protected int cantImagenesSession()
        {
            DataTable tabla = (DataTable)Session["Imagenes"];

            return tabla.Rows.Count;
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            if (fu_Imagen.HasFile)
            {
                if(Session["Imagenes"] != null)
                {
                    if(cantImagenesSession() >= 7)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('Maximo 7 imagenes')</script>");
                    }
                    else
                    {
                        guardarImagenes();
                        Session["CantImagenes"] = (int)Session["CantImagenes"] + 1;
                    }
                }
                else
                {
                    guardarImagenes();
                    Session["CantImagenes"] = (int)Session["CantImagenes"] + 1;
                }

                AgregarImagen();

                fu_Imagen.PostedFile.InputStream.Dispose();
                fu_Imagen.FileContent.Dispose();
                fu_Imagen.Dispose();
            }
        }

        protected string cargarImagenesDesdeBytes(string extencion, byte[] imagen)
        {
            string mimeTipo = "image/" + extencion;
            string base64 = Convert.ToBase64String(imagen);
            return string.Format("data:" + mimeTipo + ";base64,{0}", base64);
        }

        protected void AgregarImagen()
        {
            int i = 0;

            if (Session["Imagenes"] != null)
            {
                DataTable tabla = (DataTable)Session["Imagenes"];

                foreach(DataRow row in tabla.Rows)
                {
                    string[] ruta = tabla.Rows[0][1].ToString().Split('.');
                    string extencion = ruta[ruta.Length - 1];

                    if (i == 0)
                    {
                        literalImgChicas.Text = armarDIVImagen(cargarImagenesDesdeBytes(extencion, (byte[])row[3]), i);
                    }
                    else
                    {
                        literalImgChicas.Text += armarDIVImagen(cargarImagenesDesdeBytes(extencion, (byte[])row[3]), i);
                    }
                    
                    i++;
                }
            }
        }

        public void guardarImagenes()
        {
            FileUpload file = new FileUpload();
            int cantImagenes = (int)Session["CantImagenes"];
            string rutaImagen = "";
            file = fu_Imagen;

            if (file.HasFile)
            {
                string Extencion = Path.GetExtension(file.FileName);
                rutaImagen = "~/Imagenes/" + "Img_" + cantImagenes + Extencion;
                cargarSessionImagenes(rutaImagen, file);
            }
        }

        protected void cargarSessionImagenes(string rutaImagen, FileUpload file)
        {
            funcionesJuegos fJue = new funcionesJuegos();
            
            if (Session["Imagenes"] == null)
                Session["Imagenes"] = fJue.crearTablaImagenes();

                fJue.AgregarFilaImagenes((DataTable)Session["Imagenes"], "null", rutaImagen, false, file.FileBytes);
        }

        public string GenerarCodImagen()
        {
            int id = 0;
            AccesoDatos ds = new AccesoDatos();
            if (ds.obtenerCantidad("SELECT count(codImagen) FROM Imagenes", ref id))
            {
                id += 1;
                return "IMG" + id.ToString();

            }
            else
                return "IMG1";
        }

        protected string armarDIVImagen(string rutaImagen, int pos)
        {
            string div = "<div class=\"column\">"
                           + "<img id=\"img" + pos + "\" class=\"cursor imagenesChicas\" src=" + rutaImagen + " onclick=\"cargarSession('" + pos + "')\">"
                       + "</div>";

            return div;
        }

        protected int cantidadImagenes()
        {
            int cant = 0;
            AccesoDatos ds = new AccesoDatos();
            if (ds.obtenerCantidad("SELECT count(codImagen) FROM Imagenes", ref cant))
            {
                return cant;
            }
            else
                return 0;
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            if(Session["Imagenes"] != null)
            {
                DataTable tabla = (DataTable)Session["Imagenes"];

                if(txb_posicionSeleccionada.Value != "null")
                {
                    int pos = Convert.ToInt32(txb_posicionSeleccionada.Value);

                    if (tabla.Rows[pos][0].ToString() != "null")
                    {
                        funcionesJuegos fJue = new funcionesJuegos();

                        if (Session["ImagenesAelminiar"] == null)
                            Session["ImagenesAelminiar"] = fJue.crearTablaImagenesEliminar();


                        fJue.AgregarFilaImagenesEliminar((DataTable)Session["ImagenesAelminiar"], tabla.Rows[pos][0].ToString(), tabla.Rows[pos][1].ToString());
                    }

                    if(tabla.Rows.Count > 0)
                    {
                        if ((bool)tabla.Rows[pos][2] == true)
                        {
                            lbl_portada.Text = "0";
                        }

                        tabla.Rows[pos].Delete();

                        Session["Imagenes"] = tabla;
                    }
                    else
                    {
                        lbl_portada.Text = "0";
                        Session["Imagenes"] = null;
                    }
                        

                    Session["CantImagenes"] = (int)Session["CantImagenes"] - 1;
                    txb_posicionSeleccionada.Value = "null";

                    AgregarImagen();
                }
            }
        }

        protected void cv_imagenes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(Session["Imagenes"] == null)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void btn_seleccionarPortada_Click(object sender, EventArgs e)
        {
            if (txb_posicionSeleccionada.Value != "null")
            {
                DataTable tabla = (DataTable)Session["Imagenes"];

                foreach (DataRow row in tabla.Rows)
                {
                    row[2] = false;
                }
                int pos = Convert.ToInt32(txb_posicionSeleccionada.Value);
                tabla.Rows[pos][2] = true;
                lbl_portada.Text = (pos + 1).ToString();
            }
        }
    }
}