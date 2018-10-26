<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="DigitalGames.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .divs{
            margin:0;
            padding:0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divs">
        <img src="https://www.quakelive.com/images/promo1.jpg" style="width:100%">
    </div>
    <div class="divs">
        <img src="https://cdn.atomix.vg/wp-content/uploads/2018/03/Ya-est%C3%A1-disponible-la-actualizaci%C3%B3n-de-marzo-de-Quake-Champions-Atomix-2.jpg" style="width:100%">
    </div>
    <div class="divs">
        <img src="https://minecraft.net/static/pages/img/minecraft-hero-og.c5517b7973e1.jpg" style="width:100%">
    </div>
</asp:Content>
