<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Descuentos.aspx.cs" Inherits="DigitalGames.Descuentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<style>

    html {
      box-sizing: border-box;
    }

    *, *:before, *:after {
      box-sizing: inherit;
    }

    .column {
      float: left;
      width: 31%;
      margin-bottom: 50px;
      margin-left: 2%;
    }

    @media screen and (max-width: 300px) {
      .column {
        width: 100%;
        /*display: ;*/
      }
    }

    .card {
      box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.2);
    }

    .container {
      width: auto;
      color: white;
    }

    .container::after, .row::after {
      content: "";
      clear: both;
      display: table;
    }

    .title {
      color: white;
      font-size: 20px;
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
    }

    .button:hover {
      background-color: #808080;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column">
        <div class="card">
            <img src="https://k46.kn3.net/taringa/2/D/9/B/1/1/NegroS0rete/6D7.jpg" alt="Jane" style="width:100%">
            <div class="container">
            <div style="margin: 10px 0px 10px 0px">
                <asp:label runat="server" ID="Label1" CssClass="title" Text="Counter Strike" />
            </div>
                <div style="margin: 10px 0px 10px 0px">
                    <asp:label runat="server" ID="lbl_descripcionJuego" Text="Descipcion"/>
                </div>
            <div style="margin: 10px 0px 10px 0px"> 
                <a>ARS $ </a><asp:Label runat="server" ID="lbl_precioDescuento" Text="150" />
            </div>
            <asp:button runat="server" cssClass="button" ID="btn_verMas" Text="Ver Mas"/>
            </div>
        </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="https://k46.kn3.net/taringa/2/D/9/B/1/1/NegroS0rete/6D7.jpg" alt="Jane" style="width:100%">
                <div class="container">
                <div style="margin: 10px 0px 10px 0px">
                    <asp:label runat="server" ID="Label2" CssClass="title" Text="Counter Strike" />
                </div>
                    <div style="margin: 10px 0px 10px 0px">
                        <asp:label runat="server" ID="Label3" Text="Descipcion"/>
                    </div>
                <div style="margin: 10px 0px 10px 0px"> 
                    <a>ARS $ </a><asp:Label runat="server" ID="Label4" Text="150" />
                </div>
                <asp:button runat="server" cssClass="button" ID="Button1" Text="Ver Mas"/>
                </div>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="https://k46.kn3.net/taringa/2/D/9/B/1/1/NegroS0rete/6D7.jpg" alt="Jane" style="width:100%">
                <div class="container">
                <div style="margin: 10px 0px 10px 0px">
                    <asp:label runat="server" ID="Label5" CssClass="title" Text="Counter Strike" />
                </div>
                    <div style="margin: 10px 0px 10px 0px">
                        <asp:label runat="server" ID="Label6" Text="Descipcion"/>
                    </div>
                <div style="margin: 10px 0px 10px 0px"> 
                    <a>ARS $ </a><asp:Label runat="server" ID="Label7" Text="150" />
                </div>
                <asp:button runat="server" cssClass="button" ID="Button2" Text="Ver Mas"/>
                </div>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="https://k46.kn3.net/taringa/2/D/9/B/1/1/NegroS0rete/6D7.jpg" alt="Jane" style="width:100%">
                <div class="container">
                <div style="margin: 10px 0px 10px 0px">
                    <asp:label runat="server" ID="Label8" CssClass="title" Text="Counter Strike" />
                </div>
                    <div style="margin: 10px 0px 10px 0px">
                        <asp:label runat="server" ID="Label9" Text="Descipcion"/>
                    </div>
                <div style="margin: 10px 0px 10px 0px"> 
                    <a>ARS $ </a><asp:Label runat="server" ID="Label10" Text="150" />
                </div>
                <asp:button runat="server" cssClass="button" ID="Button3" Text="Ver Mas"/>
                </div>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="https://k46.kn3.net/taringa/2/D/9/B/1/1/NegroS0rete/6D7.jpg" alt="Jane" style="width:100%">
                <div class="container">
                <div style="margin: 10px 0px 10px 0px">
                    <asp:label runat="server" ID="Label11" CssClass="title" Text="Counter Strike" />
                </div>
                    <div style="margin: 10px 0px 10px 0px">
                        <asp:label runat="server" ID="Label12" Text="Descipcion"/>
                    </div>
                <div style="margin: 10px 0px 10px 0px"> 
                    <a>ARS $ </a><asp:Label runat="server" ID="Label13" Text="150" />
                </div>
                <asp:button runat="server" cssClass="button" ID="Button4" Text="Ver Mas"/>
                </div>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="https://k46.kn3.net/taringa/2/D/9/B/1/1/NegroS0rete/6D7.jpg" alt="Jane" style="width:100%">
                <div class="container">
                <div style="margin: 10px 0px 10px 0px">
                    <asp:label runat="server" ID="Label14" CssClass="title" Text="Counter Strike" />
                </div>
                    <div style="margin: 10px 0px 10px 0px">
                        <asp:label runat="server" ID="Label15" Text="Descipcion"/>
                    </div>
                <div style="margin: 10px 0px 10px 0px"> 
                    <a>ARS $ </a><asp:Label runat="server" ID="Label16" Text="150" />
                </div>
                <asp:button runat="server" cssClass="button" ID="Button5" Text="Ver Mas"/>
                </div>
            </div>
        </div>
    
    </div>
</asp:Content>
