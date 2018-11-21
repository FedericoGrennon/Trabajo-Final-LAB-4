<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DigitalGames.Home" %>
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
            background-color:rgba(0,0,0,0.4);
            color: white;
            width:60%;
            padding:20px;
            min-height:600px;
        }

        .column-66:hover{
            background-color:rgba(0,0,0,0.9);
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

        .descripciones{
            display: block;
            margin-top: 1em;
            margin-bottom: 1em;
            margin-left: 0;
            margin-right: 0;
        }

        .price {
            width:100%;
            color:#78b4e1;
            font-size: 30px;
            margin-top: 1em;
            margin-bottom: 1em;
            margin-left: 0;
            margin-right: 0;
        }

        .pagination a:hover:not(.active) {background-color: #ddd;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Literal runat="server" ID="literal" />

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

    <script>
        function redireccionarHome(codigo) {
            var pagina = "<%=Page.ResolveUrl("~/Juego.aspx")%>";

            location.href = pagina + "?" + codigo;
        }
    </script>
</asp:Content>

