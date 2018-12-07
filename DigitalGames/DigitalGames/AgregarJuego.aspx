<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarJuego.aspx.cs" Inherits="DigitalGames.AgregarJuego" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">
                <div class="accordion">
                    <p>Datos del juego</p>
                </div>
                <div class="paneles">
                    <div>
                        <input Width="450px" runat="server" type="text" ID="txb_nombre" placeholder="Nombre" />
                        <asp:CustomValidator runat="server" ID="cv_nombre" ControlToValidate="txb_nombre" ValidateEmptyText="true" OnServerValidate="cv_nombre_ServerValidate" Font-Size="15px" ForeColor="Red" ErrorMessage="Complete el campo / Nombre repetido" />
                    </div>
                    <div>
                        <input Width="450px" runat="server" type="text" ID="txb_empresa" placeholder="Empresa" />
                        <asp:RequiredFieldValidator runat="server" ID="rqf_empresa" ControlToValidate="txb_empresa" EnableClientScript="false" Font-Size="15px" ForeColor="Red" ErrorMessage="Complete el campo" />
                    </div>
                
                    <div>
                        <textarea Width="450px" runat="server" type="text" ID="txb_descripcion" placeholder="Descripcion" rows="10" />
                        <asp:RequiredFieldValidator runat="server" ID="rqf_descripcion" ControlToValidate="txb_descripcion" EnableClientScript="false" Font-Size="15px" ForeColor="Red" ErrorMessage="Complete el campo" />
                    </div>
                
                    <div>
                        <textarea Width="450px" runat="server" type="text" ID="txb_requisitos" placeholder="Requisitos" rows="10" />
                        <asp:RequiredFieldValidator runat="server" ID="rqf_requisitos" ControlToValidate="txb_requisitos" EnableClientScript="false" Font-Size="15px" ForeColor="Red" ErrorMessage="Complete el campo" />
                    </div>
                
                    <div>
                        <input Width="450px" runat="server" ID="txb_tipo" type="text" value="Acción" readonly />
                        <div id="listaJuegos">
                            <ul id="milista" class="myUL">
                                <li><a style="cursor: pointer" onclick="encontroTipo(this)">Acción</a></li>
                                <li><a style="cursor: pointer" onclick="encontroTipo(this)">Aventura</a></li>
                                <li><a style="cursor: pointer" onclick="encontroTipo(this)">Aventura Gráfica</a></li>
                                <li><a style="cursor: pointer" onclick="encontroTipo(this)">Consola Virtual</a></li>
                                <li><a style="cursor: pointer" onclick="encontroTipo(this)">Deportes</a></li>
                                <li><a style="cursor: pointer" onclick="encontroTipo(this)">Estrategia</a></li>
                                <li><a style="cursor: pointer" onclick="encontroTipo(this)">Lucha</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="radioButtons">
                        <asp:RadioButtonList runat="server" Width="100%" ID="rbl_listaConsolas" RepeatDirection="Horizontal" >
                            <asp:ListItem Selected="True">PC</asp:ListItem>
                            <asp:ListItem>PS4</asp:ListItem>
                            <asp:ListItem>PS3</asp:ListItem>
                            <asp:ListItem>XBOX ONE</asp:ListItem>
                            <asp:ListItem>XBOX 360</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <asp:Button runat="server" Width="200px" ID="btn_siguiente" type="button" OnClick="btn_siguiente_Click" Text="Siguiente" CssClass="botonSiguiente" />
                </div>
            </div>
        </div>

    <script>
        function encontroTipo(val)
        {
            document.getElementById('<%=txb_tipo.ClientID%>').value = val.text;
        }
    </script>
</asp:Content>
