<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="DigitalGames.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contenedor{
            margin:auto auto auto auto;
            width: 90%;
            height: 600px;
            border: 2px solid white;
            border-radius: 5px 6px;
            background-color: rgba(29, 46, 74, 1);
        }

        .contenedorJuegos{
            margin: 10px;
            padding: 5px;
            border: 2px solid white;
            border-radius: 5px 6px;
            height: 450px;
            max-height: 450px;
            overflow:auto;
        }

        .tituloCarrito{
            padding: 15px;
            border-bottom: 2px solid white;
            background-color: #317bb2;
        }

        .botonContinuarCompra{
            color: white;
            width: auto;
            padding: 7px 10px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }

        .tituloCarrito a{
            color: rgba(29, 46, 74, 1);
            font-size: 25px;
            border-radius: 5px 6px;
            font-weight: bold;
        }

        .juegos{
            padding: 5px;
            border-bottom: 0.5px solid white;
            height: 50px;
        }

        .dentroJuego div{
            float: left;
        }

        .NombreJuego{
            width: 50%;
            font-size: 20px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .precioUnit{
            text-align:center;
            width: 15%;
            font-size: 25px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .cantidad{
            width: 10%;
            font-size: 25px;
        }

        .cantidad a{
            vertical-align: top;
            color:grey;
            font-size: 12px;
        }

        .stockJuego{
            vertical-align: top;
            color:grey;
            font-size: 12px;
        }

        .input{
            width:40%;
            margin-left: 10px;
            margin-right: 10px;
        }

        .input input{
            padding: 0;
            text-align:center;
        }

        .input a{
            font-size: 10px;
            color: gray;
        }

        .precioTotalJuego{
            text-align:center;
            width: 15%;
            font-size: 25px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .botonEliminar{
            width: 10%;
            text-align:right;
        }

        .aspectosBotonEliminar{
            color: white;
            width: auto;
            padding: 4px 7px;
            background-color: red;
            margin-left: 10px;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }

        .total{
            padding: 5px;
            text-align: right; 
            margin: 10px;
        }

        .total div{
            width: 30%;
            float: right;
        }

        .BotonPagar{
            color: white;
            font-size: 20px;
            width: auto;
            padding: 7px 25px;
            background-color: green;
            margin-left: 10px;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;

        }

        .total a{
            font-size: 25px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .totala{
            font-size: 25px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .tarjetas{
            padding: 10px;
            height: auto;
            max-height: 300px;
            overflow: auto;
        }

        @media screen and (max-width: 1220px) {
              .contenedor {width: 1220px;
                           margin-left: 10px;
                            margin-top: 60px;
              }
        }

        
        .datosCompra{
            border: 1px solid black;
            border-radius: 5px 6px;
        }

        .datosCompra h4{
            display:initial;
            margin: 0;
        }

        .datosCompra h2, h3{
           text-align: center;
        }

        .datosCompra div{
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div id="Modificar" class="modal">
            <div id="pago" class="modal-content animate">
                <div class="paddingLogin">
                    <div id="elegirTarjeta">
                        <h4 style="margin: 0"><b>Elegir tarjetas</b></h4>
                        <div class="tarjetas">
                            <div><asp:Button runat="server" ID="btn_tarjeta1" CssClass="botonesLogin" OnClientClick="abrirCargarTrajeta(); return false" Text="Banco Nacion 4455"  /></div>
                        </div>
                        <button type="button" onclick="cerrarModificar()" class="cancelbtn">Cancel</button>
                    </div>

                    <div id="cargarTarjeta">
                        <label><b>Datos de la trajeta</b></label>
                        <asp:TextBox runat="server" id="txb_banco" placeholder="Banco" />
                        <asp:TextBox runat="server" id="txb_nombreTarjeta" placeholder="Numero de la tarjeta" />
                        <asp:TextBox runat="server" id="txb_fechaVencimiento" placeholder="Fecha de vencimiento" />
                        <asp:TextBox runat="server" id="txb_codigoSeguridad" placeholder="Codigo de seguridad" />
                        <asp:TextBox runat="server" id="txb_NombreTitular" placeholder="Nombre titular" />
                        <asp:TextBox runat="server" id="txb_DNI" placeholder="DNI" />

                        <asp:Button runat="server" OnClientClick="abrirComprado(); return false" CssClass="botonesLogin" Text="Finalizar compra" />
                        <button type="button" onclick="cerrarModificar()" class="cancelbtn">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="compraFinalizada" class="modal">
            <div class="modal-content animate">
                <div class="paddingLogin">
                    <div class="datosCompra">
                        <h2><b>Datos de la compra</b></h2>
                        <div><h4>Nombre de juego: </h4> <asp:Label runat="server" ID="lbl_nombreJuegoPago" Text="Player Uknow Battelground PC LATAM" /></div>
                        <div><h4>Precio: </h4> <a>ARS $ </a><asp:Label runat="server" ID="lbl_precioPago" Text="1500" /></div>
                        <div><h4>Fecha de compra: </h4> <asp:Label runat="server" ID="lbl_fechaPago" Text="11/02/2015" /></div>
                        <div><h4>Ultimos 4 digitos de tarjeta: </h4> <asp:Label runat="server" ID="lbl_ultNumTarjeta" Text="4455" /></div>
                        <div><h4>Codigo de activacion: </h4> <asp:Label runat="server" ID="lbl_codActivacion" Text="444 555 888" /></div>

                        <div><h3>Te hemos enviamos un Email con los detalles de la compra</h3></div>
                    </div>

                    <asp:Button runat="server" ID="btn_finalizar" CssClass="cancelbtn" Text="Finalizar" />
                </div>
            </div>
        </div>
    
        <div class="contenedor">
            <div class="tituloCarrito">
                <div style="float:right; margin-top: -2px">
                    <asp:button runat="server" ID="btn_continuarCompra" Text="Continuar comprando" CssClass="botonContinuarCompra"/>
                </div>
                <a>Mi Carrito</a>
            
            </div>
            <div class="contenedorJuegos">
                <div class="juegos">
                    <div class="dentroJuego">
                        <div class="NombreJuego"><asp:Label runat="server" ID="lbl_nombreJuego" Text="Counter Strike" /></div> 
                        <div class="precioUnit"><a>ARS $ </a><asp:Label runat="server" ID="lbl_precioUintario" Text="80" /></div> 
                        <div class="cantidad">
                            <div style="width: 100%; text-align:center; display:inline-block">
                                <div><button>-</button></div>
                                <div class="input"><input class="inputCantidad" type="text" value="5"></div>
                                <div><button>+</button></div>
                            </div>
                            <div style="text-align: left; width: 100%">
                                <a>stock disponilbe: </a><asp:Label runat="server" CssClass="stockJuego" ID="lbl_stockDisponible" Text="100" />
                            </div>
                        </div>  
                        <div class="precioTotalJuego"><a>ARS $ </a><asp:Label runat="server" ID="lbl_totalJuego" Text="400" /></div> 
                        <div class="botonEliminar"><asp:Button runat="server" ID="btn_eliminarJuego" CssClass="aspectosBotonEliminar" Text="Eliminar" /></div>
                    </div>
                </div>
            </div>

            <div class="total">
                <div style="width:11%; margin-top: -5px;"><asp:Button runat="server" ID="btn_Pagar" CssClass="BotonPagar" OnClientClick="abrirPago('true'); return false" Text="Pagar" /></div>
                <div><a>Total: </a> <a>ARS $ </a><asp:Label runat="server" CssClass="totala" ID="lbl_total" Text="400" /></div>   
            </div>
        </div>
    </form>
    

    <script>
        function abrirPago(tieneTarjeta) {
            document.getElementById("elegirTarjeta").style.display = "block";
            document.getElementById("cargarTarjeta").style.display = "none";

            modal2.style.display = 'block';
            document.getElementById("pago").style.display = "block";

            if (tieneTarjeta==="false") {
                document.getElementById("elegirTarjeta").style.display = "none";
                document.getElementById("cargarTarjeta").style.display = "block";
            }

            cuerpo.style.overflow = "hidden";
        }

        function abrirCargarTrajeta() {
            document.getElementById("elegirTarjeta").style.display = "none";
            document.getElementById("cargarTarjeta").style.display = "block";
        }

        function abrirComprado() {
            document.getElementById("compraFinalizada").style.display = "block";
            modal2.style.display = "none";
        }

        function cerrarModificar() {
            modal2.style.display = "none";

            cuerpo.style.overflow = "auto";
        }
    </script>
</asp:Content>
