<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="JuegoParticular.aspx.cs" Inherits="Digital_Games.JuegoParticular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .titulo{
           padding-top: 20px;
           padding-left: 15px;
           padding-bottom: 10px;
        }

        .subtitulo{
           padding-top: 20px;
           padding-left: 25px;
           padding-bottom: 15px;
           font-size: 20px;
           color: white;
           font-family: Candara;
        }

        .titulo a{
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

        .container {
            background-color: rgba(21, 40, 56, 0.70);
            width: 100%;
            height: 400px;
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
            padding-left: 20px;
            float: left;
            width: 620px;
            height: auto;
        }

        .column {
            border:2.5px solid rgba(21, 40, 56, 0.70);
            float: left;
        }

        .scroller{ 
            overflow-x: auto;
            overflow-y: auto;
            width: 617px;
            height: 70px;
        } 

        .accordion {
            background-color: #3c456d;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 97.5%;
            border: none;
            margin-left: 15px;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

        .activacion, .accordion:hover {
            background-color: #7ea8b4; 
        }

        .panele {
            display: none;
            background-color: whitesmoke;
            overflow: hidden;
            margin-left: 15px;
            width: 97.5%;
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
            height: 380px;
            float: left;
        }

        .card button {
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

        .card button:hover {
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="mySlides">
                <img class="imagenesGrandes" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_ddc8f5027ed86b086a7469ac97180da121c18b35.600x338.jpg?t=1540435725">
            </div>

            <div class="mySlides">
                <img class="imagenesGrandes" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_b0d016d9b2c17e6755ce164893f9d320609e9877.600x338.jpg?t=1540435725">
            </div>

            <div class="mySlides">
                <img class="imagenesGrandes" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_c6ece76f3dffad8cdaaedd62971024ae35ce731b.600x338.jpg?t=1540435725">
            </div>
    
            <div class="mySlides">
                <img class="imagenesGrandes" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_97a55c98f732c62d35a7ec778477c44b209ef963.600x338.jpg?t=1540435725">
            </div>

            <div class="mySlides">
                <img class="imagenesGrandes" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_9fc601107febdef0fb2f365ea368f93ea3c154fd.600x338.jpg?t=1540435725">
            </div>
    
            <div class="mySlides">
                <img class="imagenesGrandes" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/header.jpg?t=1540435725">
            </div>
        
            <div class="scroller">
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_ddc8f5027ed86b086a7469ac97180da121c18b35.600x338.jpg?t=1540435725" onclick="currentSlide(1)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_b0d016d9b2c17e6755ce164893f9d320609e9877.600x338.jpg?t=1540435725" onclick="currentSlide(2)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_c6ece76f3dffad8cdaaedd62971024ae35ce731b.600x338.jpg?t=1540435725" onclick="currentSlide(3)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_97a55c98f732c62d35a7ec778477c44b209ef963.600x338.jpg?t=1540435725" onclick="currentSlide(4)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_9fc601107febdef0fb2f365ea368f93ea3c154fd.600x338.jpg?t=1540435725" onclick="currentSlide(5)" alt="">
                </div>    
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/header.jpg?t=1540435725" onclick="currentSlide(6)" alt="">
                </div>
            </div>
        </div>

        <div class="card">
            <div class="titulo">
                <a>Counter strike: Global offensive</a>
            </div>
            
            <div class="price">ARS $1558.00</div>
            
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>

            <div class="stock"><div style="float:left; width: 100px"><input id="txb_cantAcomprar" type="text" placeholder="Cantidad"></div><div style="float:left; width: 150px; height:57px; margin-top: 15px"><a>(4 disponibles)</a></div></div>
            <button>Añadir al carrito</button>
        </div>
    </div>
    
     <div class="subtitulo">
        <a />Información sobre el juego:
    </div>

    <button class="accordion">Acerca de este juego</button>
    <div class="panele">
      <p>Descripcion del juego.</p>
    </div>

    <button class="accordion">Requisitos</button>
    <div class="panele">
      <p>Requisito minimo y recomendado</p>
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
