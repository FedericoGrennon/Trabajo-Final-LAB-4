<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ModificarJuego.aspx.cs" Inherits="DigitalGames.ModificarJuego" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .botonBuscarMod{
            text-align:center;
            background-color: #4c72bf;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .ListboxModf{
            font-size: 20px;
            background-color: transparent;
            width: 100%;
            overflow: auto;
            text-align:center;
            border: 0;
        }

        .ListboxModf option{
            border: 1px solid grey;
            padding: 5px;
            font-weight: bold;
            background-color: rgba(83, 83, 83, 0.2);
            margin: 0 0 2px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal-content">
        <div class="paddingLogin">
            <asp:TextBox ID="txb_juegos" CssClass="" runat="server" PlaceHolder="Nombre juego..." />
            <asp:Button runat="server"  CssClass="botonBuscarMod" ID="btn_buscar" OnClick="btn_buscar_Click" Text="Buscar" />

            <asp:ListBox runat="server" id="lb_juegos" CssClass="ListboxModf" />
            <asp:Button runat="server" CssClass="botonesLogin" ID="btn_modificar" OnClick="btn_modificar_Click" Text="Modificar" />
        </div>
    </div>
</asp:Content>
