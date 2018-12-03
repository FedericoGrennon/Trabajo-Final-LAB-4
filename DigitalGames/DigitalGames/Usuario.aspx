<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="DigitalGames.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contenedor{
            width:100%;
            background-color: rgba(29, 46, 74, 0.70);
            max-height: 400px;
            min-width: 400px;
        }

        .datosCuenta{
            background-color: rgba(29, 46, 74, 1);
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

        .camposUsuario{
            font-size: 16px;
            color: white;
        }

        .formularioDatosCuenta{
            border: 2px solid white;
            border-radius: 5px 6px;
            overflow: auto;
            max-height: 400px;
            min-width: 400px;
        }

        .botonModificar{
            color: #317bb2;
            width: auto;
            padding: 4px 7px;
            background-color: transparent;
            margin-left: 10px;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }

        .tarjeta{
            margin: 10px;
            background-color: #132f49;
            border: 2px solid white;
            border-radius: 5px 6px;
        }

        .botonEliminar{
            color: white;
            padding: 4px 7px;
            background-color: red;
            margin-left: 10px;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }

        .compra{
            margin: 10px;
            background-color: #132f49;
            border: 2px solid white;
            border-radius: 5px 6px;
        }

        @media screen and (max-width: 500px) {
              .contenedor {width: 500px;}
        }

        .accordion {
            background-color: #3c456d;
            color: white;
            cursor: pointer;
            padding: 0;
            width: 100%;
            border: 2px solid #bdbdbd;
            margin-left: 0;
            text-align: center;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
            border-radius: 5px 6px;
        }
        .datosCuenta p:hover {
            background-color: #235981;
        }

        .paneles {
            display: block;
            background-color: transparent;
            overflow: auto;
            max-height: 400px;
            height: auto;
            margin:auto auto auto auto;
            text-align:center;
            width: 500px;
        }

        .paneles input{
            width: 300px;
            margin: 0;
        }

        .campoAmodificarUsuario{
            font-weight:bold;
            font-size: 20px;
        }

        .botonGuardarDatos{
            color: #d0d0d0;
            background-color: green;
            padding: 15px;
            margin: 0;
            font-size: 25px;
            border-radius: 5px 6px;
            font-weight: bold;
        }

        .botonGuardarDatos:hover{
            background-color: #005600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <div class="contenedor">
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Datos de la cuenta</p>
            </button>
            <div runat="server" id="panelDcuenta" class="paneles">
                <div>
                    <h4>Usuario: </h4>
                    <input runat="server" type="text" maxlength="49" ID="txb_nombreUsuario" placeholder="Usuario" />
                        <div style="padding:0">
                            <asp:CustomValidator runat="server" ID="cv_validaReg1" ControlToValidate="txb_nombreUsuario" ValidateEmptyText="true" OnServerValidate="cv_validarNombreReg_ServerValidate" ErrorMessage="Campo oblogatorio / Usuario repetido" ForeColor="red" Font-Size="15px" />
                        </div>
                </div>
                <div>
                    <h4>Email: </h4> 
                    <input runat="server" type="email" maxlength="99" ID="txb_MailUsuario" placeholder="Email" />
                    <div style="padding:0">
                        <asp:CustomValidator runat="server" ID="cv_validaReg2" ValidateEmptyText="true" ControlToValidate="txb_MailUsuario" OnServerValidate="cv_validarEmail_ServerValidate" ErrorMessage="Campo oblogatorio / Email repetido" ForeColor="red" Font-Size="15px" />
                    </div>
                </div>
                <div>
                    <h4>Contraseña: </h4> 
                    <input runat="server" type="text" minlenght="6" maxlength="16" ID="txb_contraseñaUsuario" placeholder="Contraseña" />
                    <div style="padding:0">
                        <asp:customValidator runat="server" ID="cv_validaReg3" ControlToValidate="txb_contraseñaUsuario" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Datos personales</p>
            </button>
            <div runat="server" id="panelDpersonales" class="paneles">
                <div>
                    <h4>Nombre: </h4> 
                    <input runat="server" type="text" maxlength="49" id="txb_nombreCompletoUsuario" placeholder="Nombre completo" />
                    <div style="padding:0">                        
                         <asp:customValidator runat="server" ID="cv_validaReg6" ControlToValidate="txb_nombreCompletoUsuario" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
                <div>
                    <h4>Apellido: </h4> 
                    <input runat="server" type="text" maxlength="49" id="txb_apellidoUsuario" placeholder="Apellido" />
                    <div style="padding:0">       
                        <asp:customValidator runat="server" ID="cv_validaReg7" ControlToValidate="txb_apellidoUsuario" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
                <div>
                    <h4>Nacimineto: </h4> 
                    <input runat="server" type="date" id="txb_fechaNacUsuario" placeholder="Fecha de nacimiento" />
                    <div style="padding:0">
                        <asp:customValidator runat="server" ID="cv_validaReg8" ControlToValidate="txb_fechaNacUsuario" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
                <div>
                    <h4>Pais: </h4> 
                    <input runat="server" type="text" maxlength="49" id="txb_PaisUsuario" placeholder="Pais" />
                    <div style="padding:0">
                        <asp:customValidator runat="server" ID="cv_validaReg9" ControlToValidate="txb_PaisUsuario" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
                <div>
                    <h4>Provincia: </h4>
                    <input runat="server" type="text" maxlength="49" id="txb_ProvinciaUsuario" placeholder="Provincia" />
                    <div style="padding:0">
                        <asp:customValidator runat="server" ID="cv_validaReg10" ControlToValidate="txb_ProvinciaUsuario" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
                <div>
                    <h4>Localidad: </h4>
                    <input runat="server" type="text" maxlength="49" id="txb_LocalidadUsuario" placeholder="Localidad" />
                    <div style="padding:0">
                        <asp:customValidator runat="server" ID="cv_validaReg11" ControlToValidate="txb_LocalidadUsuario" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
                <div>
                    <h4>Telefono: </h4> 
                    <input runat="server" type="number" minlenght="8" maxlength="49" id="txb_TelefonoUsuario" placeholder="Telefono" />
                    <div style="padding:0">
                        <asp:customValidator runat="server" ID="cv_validaReg12" ControlToValidate="txb_TelefonoUsuario" Font-size="15px"  ValidateEmptyText="true"  OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align:center">
            <asp:Button runat="server" ID="btn_GuardarCambios" CssClass="botonGuardarDatos" Width="100%" Text="Guardar datos" OnClick="btn_GuardarCambios_Click" />
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Tarjetas de credito</p>
            </button>
            
            <div class="paneles">
                <div>
                    <div>
                        <asp:Literal runat="server" ID="literalTarjetas" />  
                    </div>
                    <div class="tarjeta">
                        <asp:TextBox runat="server" ID="txb_4DigitosAborrar" placeholder="Numero completo de tarjeta..." />
                        <asp:Button runat="server" ID="btn_eliminarTarjeta" Width="100px" CssClass="botonEliminar" Text="Eliminar" OnClick="btn_eliminarTarjeta_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Compras realizadas</p>
            </button>
            <div class="paneles">
                <div>
                    <asp:Literal runat="server" ID="literalCompras" />
                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Privacidad de la cuenta</p>
            </button>
            <div class="paneles">
                <div><a style="color:red; font-weight: bold; -webkit-text-stroke: 0.7px white; font-size: 25px; letter-spacing: 1px">¡ATENCION!</a><a> Al cerrar su cuenta se eliminarán todos sus datos y es irreversible.</a></div>
                <div><asp:Button runat="server" ID="btn_eliminarCuentaUsuario" CssClass="botonEliminar" style="padding: 10px 17px; margin: 0" Text="Cerrar cuenta" OnClick="btn_eliminarCuentaUsuario_Click" /></div>    
            </div>
        </div>
    </div>

    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                var panel = this.nextElementSibling;
                if (panel.style.display === "none") {
                    panel.style.display = "block";
                } else {
                    panel.style.display = "none";
                }
            });
        }
    </script>
</asp:Content>
