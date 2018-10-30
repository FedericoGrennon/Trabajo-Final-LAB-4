<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="JuegoParticular.aspx.cs" Inherits="Digital_Games.JuegoParticular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            color: white;
            padding: 20px;
            font-size: 55px;
        }

        .imagenesGrandes{
            width: 100%;
            height: 400px;
        }

        .imagenesChicas{
            width:100%;
            height: 85px;
        }

        .container {
            background-color: black;
            border:5px solid #000000;
            width: 50%;
            margin-left: 15px;
        }

        .mySlides {
          display: none;
        }

        .cursor {
          cursor: pointer;
        }

        .caption-container {
            width:100%;
            text-align: center;
            background-color: #222;
            padding: 2px 0px;
            color: white;
        }

        .row{
            width: auto;
            margin: auto; 
            text-align: center; 
        }

        .row:after {
          content: "";
          display: table;
          clear: both;
        }

        .column {
            border:5px solid #000000;
            float: left;
            width:20%;
        }

        .scroller{ 
            overflow-x: auto;
            overflow-y: auto;
            height: 115px;
        } 

        
        .demo {
            opacity: 0.6;
        }

        .active,
        .demo:hover {
          opacity: 1;
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

        .active, .accordion:hover {
            background-color: #7ea8b4; 
        }

        .panel {
            display: none;
            background-color: whitesmoke;
            overflow: hidden;
            margin-left: 15px;
            width: 97.5%;

        }

        .price {
          color: grey;
          font-size: 22px;
          text-align:right;
        }

        .card button {
          border: none;
          outline: 0;
          float:right;
          text-align:right;
          color: white;
          background-color: #48924e;
          text-align: center;
          cursor: pointer;
          width: 30%;
          font-size: 18px;
          padding: 12px;
        }

        .card button:hover {
          opacity: 0.7;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titulo">
        <a />Titulo Juego
    </div>

    <div class="container"position: "relative;">
        <div class="card"style="position: absolute; left: 20%; top: 30%">
          <h1>Precio</h1>
          <p class="price">$19.99</p>
          <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum. </p>
          <p><button>Add to Cart</button></p>
     </div>
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

        <div class="caption-container">
        <p id="caption"></p>
        </div>

        <div class="row">
            <div class="scroller">
                <div class="column">
                    <img class="demo cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_ddc8f5027ed86b086a7469ac97180da121c18b35.600x338.jpg?t=1540435725" onclick="currentSlide(1)" alt="">
                </div>
                <div class="column">
                    <img class="demo cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_b0d016d9b2c17e6755ce164893f9d320609e9877.600x338.jpg?t=1540435725" onclick="currentSlide(2)" alt="">
                </div>
                <div class="column">
                    <img class="demo cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_c6ece76f3dffad8cdaaedd62971024ae35ce731b.600x338.jpg?t=1540435725" onclick="currentSlide(3)" alt="">
                </div>
                <div class="column">
                    <img class="demo cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_97a55c98f732c62d35a7ec778477c44b209ef963.600x338.jpg?t=1540435725" onclick="currentSlide(4)" alt="">
                </div>
                <div class="column">
                    <img class="demo cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/ss_9fc601107febdef0fb2f365ea368f93ea3c154fd.600x338.jpg?t=1540435725" onclick="currentSlide(5)" alt="">
                </div>    
                <div class="column">
                    <img class="demo cursor imagenesChicas" src="https://steamcdn-a.akamaihd.net/steam/apps/949380/header.jpg?t=1540435725" onclick="currentSlide(6)" alt="">
                </div>
            </div>
        </div>
    </div>

     <div class="subtitulo">
        <a />Información sobre el juego:
    </div>

    <button class="accordion">Section 1</button>
    <div class="panel">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>

    <button class="accordion">Section 2</button>
    <div class="panel">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>

    <button class="accordion">Section 3</button>
    <div class="panel">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
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
      var dots = document.getElementsByClassName("demo");
      var captionText = document.getElementById("caption");
      if (n > slides.length) {slideIndex = 1}
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";
      dots[slideIndex-1].className += " active";
      captionText.innerHTML = dots[slideIndex-1].alt;
        }

    var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }

    </script>
    </a>
</asp:Content>
