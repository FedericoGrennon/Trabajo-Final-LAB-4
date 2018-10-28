<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ApartadoJuegos.aspx.cs" Inherits="Digital_Games.ApartadoJuegos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
          box-sizing:border-box;
        }

        body {
          margin: 0;
          font-family: Arial, Helvetica, sans-serif;
        }

        .container {
          min-height: 600px;
        }

        .row:after {
          content: "";
          display: table;
          clear: both
        }

        .column-66 {
            background-color:rgba(0,0,0,0.5);
            color: white;
            width:60%;
            padding:20px;
            min-height:600px;
        }

        .large-font {
          font-size: 48px;
        }

        .xlarge-font {
          font-size: 64px
        }

        .button {
          border: none;
          color: white;
          padding: 14px 28px;
          font-size: 16px;
          cursor: pointer;
          background-color: #4CAF50;
        }

        @media screen and (max-width: 800px) {
          .column-66,
          .column-33 {
            width: 100%;
          }
        }

        .center {
            text-align: center;
            padding-top: 20px;
            padding-bottom: 20px;
            background-color:#333;
        }

        .pagination {
            display: inline-block;
        }

        .pagination a {
            color: white;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }

        .pagination a:hover:not(.active) {background-color: #ddd;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background:url(https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2013/01/205245-20-mejores-juegos-wii.jpg)no-repeat bottom;background-size:cover">
      <div class="row">
        <div class="column-66">
          <h1 class="xlarge-font"><b>Titulo</b></h1>
          <p>Breve descripcion.</p>
          <button class="button">Entrar Juego</button>
        </div>
      </div>
    </div>

    <div class="container" style="background:url(https://cdn4.areajugones.es/wp-content/uploads/2017/04/counter-strike-global-offensive-810x400.png)no-repeat bottom;background-size:cover">
      <div class="row">
        <div class="column-66" style="text-align:right; float: right">
          <h1 class="xlarge-font"><b>Titulo</b></h1>
          <p>Breve descripcion.</p>
          <button class="button">Entrar Juego</button>
        </div>
      </div>
    </div>

    <div class="container" style="background:url(https://d2skuhm0vrry40.cloudfront.net/2018/articles/2018-07-30-11-26/titan-quest-review-not-all-switch-ports-are-created-equal-1532946388292.jpg/EG11/thumbnail/1920x1080/format/jpg/1987099.jpg)no-repeat bottom;background-size:cover">
      <div class="row">
        <div class="column-66">
          <h1 class="xlarge-font"><b>Titulo</b></h1>
          <p>Breve descripcion.</p>
          <button class="button">Entrar Juego</button>
        </div>
      </div>
    </div>

    <div class="center">
      <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#1" class="active">1</a>
        <a href="#2">2</a>
        <a href="#3">3</a>
        <a href="#4">4</a>
        <a href="#5">5</a>
        <a href="#6">6</a>
        <a href="#">&raquo;</a>
      </div>
    </div>
</asp:Content>
