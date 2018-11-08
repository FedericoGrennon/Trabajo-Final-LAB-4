<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="DigitalGames.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
        $( "#<%=txb_fechaNacUsuario.ClientID%>" ).datepicker();
        } );
    </script>

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
            width: auto;
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
            display: none;
            background-color: transparent;
            overflow: auto;
            max-height: 400px;
            height: auto;
            margin:auto auto auto auto;
            text-align:center;
            width: 500px;
        }

        .campoAmodificarUsuario{
            font-weight:bold;
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Modificar" class="modal">
        <div id="modif" class="modal-content animate">
            <div class="paddingLogin">
                <asp:Label runat="server" CssClass="campoAmodificarUsuario" ID="lbl_campoModificarUsuario" Text="campoModificar" />
                <div id="txbNormal">
                    <asp:TextBox runat="server" ID="txb_modificarUsuario" />
                </div>
                
                <div id="fechaNac">
                    <asp:TextBox runat="server" ID="txb_fechaNacUsuario" />
                </div>

                <div id="repitaContra">
                    <asp:TextBox runat="server" type="password" />
                    <label for="psw"><b>Repita contraseña</b></label>
                    <asp:TextBox runat="server" ID="txb_contraseñaUsuario" type="password" />
                </div>

                <asp:Button runat="server" CssClass="botonesLogin" id="btn_ModificarUsuario" Text="Modificar" />
                <button type="button" onclick="cerrarModificar()" class="cancelbtn">Cancel</button>
            </div>
        </div>
    </div>
    
    <div class="contenedor">
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Datos de la cuenta</p>
            </button>
            <div class="paneles">
                <div><h4>Usuario: </h4> <asp:Label runat="server" ID="lbl_nombreUsuario" CssClass="camposUsuario" Text="Fedex" /> <button class="botonModificar" onclick="abrirModificar('Usuario'); return false;">Modificar</button></div>
                <div><h4>Email: </h4> <asp:Label runat="server" ID="lbl_EmailUsuario" CssClass="camposUsuario" Text="fede@hotmail.com" /> <button class="botonModificar" onclick="abrirModificar('Email'); return false;">Modificar</button></div>
                <div><h4>Contraseña: </h4> <asp:Label runat="server" ID="lbl_contraseñaUsuario" CssClass="camposUsuario" Text="pepito97" /> <button class="botonModificar" onclick="abrirModificar('Contraseña'); return false;">Modificar</button></div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Datos personales</p>
            </button>
            <div class="paneles">
                <div>
                    <h4>Nombre completo: </h4> 
                    <asp:Label runat="server" ID="lbl_nombreCompletoUsuario" CssClass="camposUsuario" Text="Federico" /> 
                    <button class="botonModificar" onclick="abrirModificar('Nombre completo'); return false;">Modificar</button>
                </div>
                <div>
                    <h4>Apellido: </h4> 
                    <asp:Label runat="server" ID="lbl_apellidoUsuario" CssClass="camposUsuario" Text="Grennon" /> 
                    <button class="botonModificar" onclick="abrirModificar('Apellido'); return false;">Modificar</button>
                </div>
                <div>
                    <h4>Fecha de nacimineto: </h4> 
                    <asp:Label runat="server" ID="lbl_fechaNacUsuario" CssClass="camposUsuario" Text="08/01/1997" /> 
                    <button class="botonModificar" onclick="abrirModificar('Fecha de nacimiento'); return false;">Modificar</button>
                </div>
                <div>
                    <h4>Pais: </h4> 
                    <asp:Label runat="server" ID="lbl_paisUsuario" CssClass="camposUsuario" Text="Argentinta" />  
                    <button class="botonModificar" onclick="abrirModificar('Pais'); return false;">Modificar</button>
                </div>
                <div>
                    <h4>Provincia: </h4> 
                    <asp:Label runat="server" ID="lbl_provinciaUsuario" CssClass="camposUsuario" Text="Buenos Aires" /> 
                    <button class="botonModificar" onclick="abrirModificar('Provincia'); return false;">Modificar</button>
                </div>
                <div>
                    <h4>Localidad: </h4> 
                    <asp:Label runat="server" ID="lbl_localidadUsuario" CssClass="camposUsuario" Text="Garin" /> 
                    <button class="botonModificar" onclick="abrirModificar('Localidad'); return false;">Modificar</button>
                </div>
                <div>
                    <h4>Telefono: </h4> 
                    <asp:Label runat="server" ID="lbl_telefonoUsuario" CssClass="camposUsuario" Text="1131135369" /> 
                    <button class="botonModificar" onclick="abrirModificar('Telefono'); return false;">Modificar</button>
                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Tarjetas de credito</p>
            </button>
            
            <div class="paneles">
                <div>
                    <div>
                        <div class="tarjeta">
                            <div><h4>Ultimos 4 digitos: </h4> <asp:Label runat="server" ID="lbl_ultimosDigitosTarjetaUsuario" CssClass="camposUsuario" Text="4455" /></div>
                            <div><h4>Banco: </h4> <asp:Label runat="server" ID="lbl_bancoUsuario" CssClass="camposUsuario" Text="Macro" /></div>
                            <div><h4>Vencimiento: </h4> <asp:Label runat="server" ID="lbl_fechaVencUsuario" CssClass="camposUsuario" Text="11/2025" /></div>
                            <div style="text-align:right; padding:0">
                                <asp:Button runat="server" ID="btn_eliminarTarjeta" CssClass="botonEliminar" Text="Eliminar" />
                            </div>
                        </div>
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
                    <div class="compra">
                        <div>
                            <h4>Nombre de juego: </h4> 
                            <asp:Label runat="server" ID="lbl_nombreJuegoUsuario" CssClass="camposUsuario" Text="Counter Strike" />
                        </div>
                        <div>
                            <h4>Precio: </h4> 
                            <a>ARS $ </a>
                            <asp:Label runat="server" ID="lbl_precioJuegoUsuario" CssClass="camposUsuario" Text="1500" />
                        </div>
                        <div><h4>Fecha de compra: </h4>
                            <asp:Label runat="server" ID="lbl_FechacompraUsuario" CssClass="camposUsuario" Text="11/08/2018" />
                        </div>
                        <div><h4>Ultimos 4 digitos de tarjeta: </h4>
                            <asp:Label runat="server" ID="lbl_ultimosDigitosCompraUsuario" CssClass="camposUsuario" Text="4455" />
                        </div>
                        <div><h4>Codigo de activacion: </h4>
                            <asp:Label runat="server" ID="lbl_codActivacionUsuario" CssClass="camposUsuario" Text="4455 4455 4455" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Privacidad de la cuenta</p>
            </button>
            <div class="paneles">
                <div><a style="color:red; font-weight: bold; -webkit-text-stroke: 0.7px white; font-size: 25px; letter-spacing: 1px">¡ATENCION!</a><a> Al cerrar su cuenta se eliminarán todos sus datos y es irreversible.</a></div>
                <div><asp:Button runat="server" ID="btn_eliminarCuentaUsuario" CssClass="botonEliminar" style="padding: 10px 17px; margin: 0" Text="Cerrar cuenta" /></div>    
            </div>
        </div>
    </div>

    <script>
        function abrirModificar(id) {
            document.getElementById("txbNormal").style.display = "block";
            document.getElementById("repitaContra").style.display = "none";
            document.getElementById("fechaNac").style.display = "none";

            modal2.style.display = 'block';
            document.getElementById("modif").style.display = "block";

            if (id === 'Contraseña') {
                document.getElementById("repitaContra").style.display = "block";
                document.getElementById("txbNormal").style.display = "none";
            }else if (id === 'Fecha de nacimiento') {
                document.getElementById("fechaNac").style.display = "block";
                document.getElementById("txbNormal").style.display = "none";
            }

            document.getElementById("<%=lbl_campoModificarUsuario.ClientID%>").innerText = id;

            cuerpo.style.overflow = "hidden";
        }

        function cerrarModificar() {
            modal2.style.display = "none";

            cuerpo.style.overflow = "auto";
        }

        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>
</asp:Content>
