<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="JuegoParticular.aspx.cs" Inherits="Digital_Games.JuegoParticular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .titulo{
           padding-top: 20px;
           padding-left: 20px;
        }

        .titulo a{
            color: white;
            padding: 20px;
            font-size: 64px;
        }

        .imagenesGrandes{
            width: 100%;
            height: 600px;
        }

        .imagenesChicas{
            width:100%;
            height: 85px;
        }

        .container {
            background-color: black;
            border:5px solid #000000;
            width: 50%;
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
            width: 100%;
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
            width:16%;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titulo">
        <a />Titulo Juego
    </div>

    <div class="container">
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
    </script>
    </a>
</asp:Content>
