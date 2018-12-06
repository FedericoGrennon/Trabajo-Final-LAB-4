<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="CompraFinalizada.aspx.cs" Inherits="DigitalGames.CompraFinalizada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
        .datosCuenta p{
            color: rgba(29, 46, 74, 1);
            background-color: #317bb2;
            padding: 15px;
            margin: 0;
            font-size: 25px;
            font-weight: bold;
            border: 2px solid white;
            border-radius: 2px;
        }

        .datosCuenta div{
            padding: 10px;
        }

        .datosCuenta h4{
            font-size: 20px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .datosCuenta a{
            font-size: 16px;
            color: white;
        }

        .compra{
            margin: 10px;
            background-color: #132f49;
            border: 2px solid white;
            border-radius: 5px 6px;
        }

        .accordion {
            background-color: #3c456d;
            color: white;
            width: 100%;
            text-align: center;
            font-size: 15px;
        }

        .contenedor{
            margin: 20px auto auto auto;
            width:70%;
            max-height: 400px;
            min-width: 400px;
        }

        .paneles {
            display: block;
            background-color: transparent;
            overflow: auto;
            max-height: 768px;
            height: auto;
            margin:auto auto auto auto;
            text-align:center;
            width: 700px;
        }

        .paneles input{
            width: 300px;
            margin: 0;
        }

        .botonContinuarCompra{
            color: white;
            width: auto;
            padding: 9px 12px;
            font-size: 15px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">
            <div class="accordion" style="padding:0">
                <p>Detalles de la compra</p>
            </div>
            <div class="paneles">
                <asp:Literal runat="server" ID="literalCompras" />
            </div>
            <div style="text-align:center">
                <asp:button runat="server" ID="btn_continuarCompra" Text="Continuar comprando" CssClass="botonContinuarCompra" OnClick="btn_continuarCompra_Click"/>
            </div>
        </div>
    </div>
    
</asp:Content>
