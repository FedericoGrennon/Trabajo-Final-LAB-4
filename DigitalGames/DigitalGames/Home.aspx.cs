using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalGames
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string juego1 = "<div class=\"container\" style=\"background:url(" + "../Imagenes/50ce442f981177f216a2e436e338cb5c.jpg" + ")no-repeat center;background-size:cover\">"
                      + "<div class=\"row\">"
                            + "<div class=\"column-66\">"
                               + "<h1 class=\"xlarge-font\"><p runat=\"server\" ID=\"lbl_tituloJuegoHome\" Style=\"font-weight:bold\" >"+ "Titulo Juego" +"</p></h1>"
                               + "<div><p runat=\"server\" ID=\"lbl_descripcionJuegoHome\" class=\"descripciones\" />" + "Breve descripcion" + "</p></div>"
                               + "<div class=\"price\"><a>ARS $</a><a runat=\"server\" ID=\"lbl_PrecioJuegoHome\" class=\"descripcion\" />" + "1150" + "</a></div>"
                               + "<input ID=\"btn_verMasHome\" type=\"button\" class=\"button\" value=\"Ver mas\" onclick=\"redireccionarHome('JUE1')\" />"
                            + "</div>"
                        + "</div>"
                    + "</div>";

            literal.Text = juego1;
        }
    }
}