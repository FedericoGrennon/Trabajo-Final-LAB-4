<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarJuego(Paso2).aspx.cs" Inherits="DigitalGames.AgregarJuego_Paso2_" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contenedor{
            width:100%;
            background-color: rgba(29, 46, 74, 0.70);
            max-height: 400px;
            min-width: 400px;
            text-align:center
        }

        .contenedor input{
            height: 40px;
        }

        .datosCuenta{
            background-color: rgba(29, 46, 74, 1);
        }

        .datosCuenta input{
            width: 100%;
        }

        .datosCuenta textarea{
            width: 99%;
        }

        .datosCuenta p{
            color: rgba(29, 46, 74, 1);
            background-color: #317bb2;
            padding: 15px;
            margin: 0;
            font-size: 25px;
            border-radius: 5px 6px;
            font-weight: bold;
        }

        .datosCuenta div{
            padding: 5px;
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

        .paneles {
            display: inline-block;
            background-color: transparent;
            overflow: hidden;
            margin:auto auto auto auto;
            width: 500px;
        }

        .accordion {
            text-align: center;
        }

        .radioButtons{
            text-align: center;
        }

        .radioButtons input{
            cursor: pointer;
            width: 15px; 
            height: 15px;
        }

        .radioButtons label{
            font-size: 16px;
            color: white;
        }

        .botonSiguiente{
            color: white;
            padding: 7px 10px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            margin: 10px;
            font-size: 30px;
        }

        .textoStock{
            font-size: 16px;
            color: white;
        }

        .botonAgregar{
            color: white;
            padding: 7px 10px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            float:right;
            margin-top: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">
                <div class="accordion">
                    <p>Datos comerciales</p>
                </div>
                <div class="paneles">
                    <div>
                        <input runat="server" id="txb_Precio" type="number" placeholder="Precio ARS $" min="0" max="999999.00" step="0.01" />
                        <asp:RequiredFieldValidator runat="server" ID="rqv_precio" ControlToValidate="txb_Precio" Font-size="15px" EnableClientScript="false" ForeColor="red" ErrorMessage="Complete el campo." />
                    </div>
                
                    <div style="text-align:center">
                        <a>Stock actual: </a> <asp:Label runat="server" ID="lbl_stockActual" CssClass="textoStock" Text="0" />
                    </div>

                    <div style="text-align:center; width: 480px; padding:0">
                        <asp:TextBox runat="server" id="txb_codigo" placeholder="1111AAAA22221A2A" width="380px" />
                        <asp:Button runat="server" ID="btn_Agregar" Width="80px" CssClass="botonAgregar" Text="Agregar" OnClick="btn_Agregar_Click" />
                        <asp:CustomValidator runat="server" ID="cv_codigo" ControlToValidate="txb_codigo" ValidateEmptyText="true" OnServerValidate="cv_codigo_ServerValidate" Font-Size="15px" ForeColor="Red" ErrorMessage="Complete el campo / Codigo repetio / Codigo Invalido / 16 digitos sin espacios" />
                    </div>

                    <div style="text-align: center">
                        <asp:ListBox runat="server" ID="lb_CodJuegos" Height="200px" Width="480px" />
                    </div>
                
                    <div style="text-align:center">
                        <a>Haga doble click sobre el codigo para eliminarlo.</a>
                    </div>

                    <asp:Button runat="server" Width="200px" ID="btn_siguiente" type="button" OnClick="btn_siguiente_Click" Text="Siguiente" CssClass="botonSiguiente" />
                </div>
            </div>
        </div>
</asp:Content>
