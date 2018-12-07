<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Descuentos.aspx.cs" Inherits="DigitalGames.Descuentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        html {
          box-sizing: border-box;
        }

        *, *:before, *:after {
          box-sizing: inherit;
        }

        .row{
            margin: 20px 0 0 0;
            text-align:center;
        }

        .column {
          display: inline-block;
          width: 550px;
          background-color: #3c5e83;
          margin: 15px;
          box-shadow: black 15px 15px 70px;
        }

        @media screen and (max-width: 550px) {
          .column {
            width: 550px;
          }
        }

        .container {
          width: auto;
          color: white;
        }

        .container div{
            padding: 5px;
        }

        .container::after, .row::after {
          content: "";
          clear: both;
          display: table;
        }

        .title {
          color: white;
          font-size: 30px;
          font-weight: bold;
        }

        .button {
          border: none;
          outline: 0;
          display: inline-block;
          padding: 8px;
          color: white;
          background-color: #3a7e34;
          text-align: center;
          cursor: pointer;
          width: 100%;
          font-size: 20px;
        }

        .button:hover {
          background-color: #808080;
        }

        .price{
                text-align: right;
                color:white;
                font-size: 40px;
                font-weight:800;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Literal runat="server" ID="literalDescuentos" />
    </div>
    <script>
        function redireccionarHome(codigo)
        {
            var pagina = "<%=Page.ResolveUrl("~/Juego.aspx")%>";

            location.href = pagina + "?c=" + codigo;
        }
    </script>
    
</asp:Content>
