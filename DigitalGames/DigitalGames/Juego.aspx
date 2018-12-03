<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Juego.aspx.cs" Inherits="DigitalGames.Juegos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .tituloLabel{
            text-align:center;
            color: white;
            font-size: 30px;
        }

        .imagenesGrandes{
            width: 600px;
            height: 337px;
        }

        .imagenesChicas{
            width:115px;
            height: 65px;
        }

        .imagenesChicas:hover{
            opacity: 0.5;
        }

        .container {
            background-color: rgba(29, 46, 74, 0.70);
            width: 100%;
            height: auto;
            text-align:center;
            padding: 20px 0 20px;
            min-width: 1000px;
        }

        .mySlides {
          width: 600px;
          height: 337px;
          display: none;
        }

        .cursor {
          cursor: pointer;
        }

        .row{
            width: 620px;
            height: auto;
            display: inline-block;
        }

        .column {
            border:2.5px solid rgba(21, 40, 56, 0.70);
            display: inline-block;
        }

        .scroller{ 
            overflow: auto;
            white-space: nowrap;
            width: 600px;
            height: auto;
        } 

        .accordion {
            background-color: #317bb2;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: 2px solid #bdbdbd;
            text-align: center;
            outline: none;
            font-size: 25px;
            transition: 0.4s;
        }

        .activacion, .accordion:hover {
            background-color: #235981; 
        }

        .panele {
            display: none;
            background-color: rgba(29, 46, 74, 0.70);
            overflow: hidden;
            width: 100%;
            text-align:center;
            color: white;
        }

        .price {
            width:100%;
            color:#0885e2;
            font-size: 35px;
            text-align:center;
        }

        .card{
            padding:10px;
            width: 324px;
            height: 387px;
            display: inline-block;
            vertical-align: top;
        }

        .botonCarta {
          border: none;
          outline: 0;
          color: white;
          background-color: #48924e;
          text-align: center;
          cursor: pointer;
          width: 100%;
          font-size: 18px;
          padding: 12px;
        }

        .checked {
            color: orange;
        }

        .botonCarta:hover {
          opacity: 0.7;
        }

        .stock{
            width:100%;
        }

        .stock a{
            text-align: left;
            color: #7d7d7d;
            font-size: 20px;
        }

        .stockTextBox{
            text-align: left;
            color: #7d7d7d;
            font-size: 20px;
        }

        .descripciones{
            display: block;
            margin-top: 1em;
            margin-bottom: 1em;
            margin-left: 0;
            margin-right: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <asp:Literal runat="server" ID="literalImgGrandes" />
        
            <div class="scroller">
                <asp:Literal runat="server" ID="literalImgChicas" />
            </div>
        </div>

        <div class="card">
            <div class="titulo">
                <asp:Label runat="server" id="lbl_tituloJuego" CssClass="tituloLabel" Text="Counter strike: Global offensive" />
            </div>

            <div runat="server" id="divDescuento">
                <div class="price"><s>ARS $</s><asp:Label runat="server" id="lbl_PrecioJuego" style="text-decoration:line-through"  Text="1558.00" /></div>
            </div>
            <div>
                <div class="price">ARS $<asp:Label runat="server" id="lbl_PrecioConDescuento"  Text="1200.00" /></div>
            </div>
            
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
            
            <div class="stock">
                <div style="float:left; width: 100px">
                    <input runat="server" id="txb_cantAcomprarJuego" type="number"  min="1" placeholder="1" value="1" />
                </div>
                <div style="float:left; width: 150px; height:57px; margin-top: 15px">
                    <a>(</a>
                    <asp:Label runat="server" id="lbl_stockJuego" CssClass="stockTextBox" Text="4" />
                    <a>disponibles)</a>
                </div>
            </div>

            <asp:Button runat="server" CssClass="botonCarta" ID="btn_AñadirCarritoJuego" Text="Añadir al carrito" OnClick="btn_AñadirCarritoJuego_Click" />
            <asp:Button runat="server" CssClass="botonCarta" style="background-color:#0885e2" ID="btn_comprarJuego" Text="Comprar ahora" OnClick="btn_comprarJuego_Click" />
        </div>
    </div>

    <div style="width:100%">
        <button class="accordion" onclick="return false">Acerca de este juego</button>
        <div class="panele">
            <asp:Label runat="server" id="lbl_DescripcionJuego" CssClass="descripciones" Text="Descripcion del juego" />
        </div>

        <button class="accordion" onclick="return false">Requisitos</button>
        <div class="panele">
            <asp:Label runat="server" id="lbl_requisitosJuego" CssClass="descripciones" Text="Requisito minimo y recomendado" />
        </div>
    </div>
    

    <script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      if (n > slides.length) {slideIndex = 1}
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
      }
      slides[slideIndex-1].style.display = "block";
    }

    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("activacion");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }
        </script>
</asp:Content>
