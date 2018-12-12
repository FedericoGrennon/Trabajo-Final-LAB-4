<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarJuego(Paso3).aspx.cs" Inherits="DigitalGames.AgregarJuego_Paso3_" %>
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

        .checkDisponi{
            text-align: center;
        }

        .checkDisponi input{
            cursor: pointer;
            width: 40px; 
            height: 40px;
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

        .botonCancelar{
            color: white;
            padding: 7px 10px;
            background-color: red;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            margin: 10px;
            font-size: 30px;
        }

        .botonOmitir{
            color: white;
            padding: 7px 10px;
            background-color: #393939;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            margin: 10px;
            font-size: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">  
            <div class="accordion">
                <p>Descuento (Paso 3/4)</p>
            </div>
            <div class="paneles">
                <div>
                    <div><input runat="server" id="txb_Porcentaje" type="number" min="0" max="100" placeholder="Porcentaje de descuento %" /></div>
                    <asp:RequiredFieldValidator runat="server" ID="rfv_porcentaje" ControlToValidate="txb_Porcentaje" Font-size="15px" ForeColor="red" ErrorMessage="Complete el campo." EnableClientScript="false" />
                    <div><input runat="server" id="txb_FechaInicio" type="datetime-local" placeholder="Fecha de inicio" /></div>
                    <asp:RequiredFieldValidator runat="server" ID="rfv_fechaInicio" ControlToValidate="txb_FechaInicio" Font-size="15px" ForeColor="red" ErrorMessage="Complete el campo." EnableClientScript="false" />
                    <div><input runat="server" id="txb_FechaFin" type="datetime-local" placeholder="Fecha de finalizacion" /></div>
                    <asp:RequiredFieldValidator runat="server" ID="rfv_fechaFin" ControlToValidate="txb_FechaFin" Font-size="15px" ForeColor="red" ErrorMessage="Complete el campo." EnableClientScript="false" />
                    <div class="checkDisponi"><a>Descuento Activo / Desactivo </a></div>
                    <div class="checkDisponi"><asp:CheckBox runat="server" id="chx_Disponibilidad" checked="true" /></div>
                </div> 

                <asp:Button runat="server" Width="200px" ID="btn_Volver" type="button" OnClick="btn_Volver_Click" Text="Volver" CssClass="botonCancelar" />
                <asp:Button runat="server" Width="200px" ID="btn_Cancelar" type="button" OnClick="btn_Cancelar_Click" Text="Cancelar" CssClass="botonCancelar" />
                <asp:Button runat="server" Width="200px" ID="btn_Omitir" type="button" OnClick="btn_Omitir_Click" Text="Omitir" CssClass="botonOmitir" />
                <asp:Button runat="server" Width="200px" ID="btn_siguiente" type="button" OnClick="btn_siguiente_Click" Text="Siguiente" CssClass="botonSiguiente" />  
            </div>
        </div>
    </div>
</asp:Content>
