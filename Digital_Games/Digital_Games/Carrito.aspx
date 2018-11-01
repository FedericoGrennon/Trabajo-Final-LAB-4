<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Digital_Games.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contenedor{
            margin-left: 50px;
            margin-top: 80px;
            width: 90%;
            height: 600px;
            border: 2px solid white;
            border-radius: 5px 6px;

            background-color: rgba(29, 46, 74, 1);
        }

        .contenedor form{
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

        .tituloCarrito button{
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

        .juego{
            padding: 5px;
            border-bottom: 0.5px solid white;
            height: 40px;
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
            text-align:center;
            width: 10%;
            font-size: 25px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .cantidad div{
            float: left;
        }

        .input{
            width:30%;
            margin-left: 10px;
            margin-right: 10px;
        }

        .input input{
            padding: 0;
            text-align:center;
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

        .botonEliminar button{
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

        .total button{
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
    <div id="Modificar" class="modal">
        <form id="pago" class="modal-content animate">
            <div class="paddingLogin">
                <label for="uname"><b></b></label>
                <div id="elegirTarjeta">
                    <h4 style="margin: 0"><b>Elegir tarjetas</b></h4>
                    <div class="tarjetas">
                        <div><button class="botonesLogin" type="button" onclick="abrirCargarTrajeta()">Banco Nacion 4455</button></div>
                        <div><button class="botonesLogin" type="button" onclick="abrirCargarTrajeta()">Banco Nacion 4455</button></div>
                        <div><button class="botonesLogin" type="button" onclick="abrirCargarTrajeta()">Banco Nacion 4455</button></div>
                        <div><button class="botonesLogin" type="button" onclick="abrirCargarTrajeta()">Banco Nacion 4455</button></div>
                        <div><button class="botonesLogin" type="button" onclick="abrirCargarTrajeta()">Banco Nacion 4455</button></div>
                        <div><button class="botonesLogin" type="button" onclick="abrirCargarTrajeta()">Banco Nacion 4455</button></div>
                    </div>
                    <button type="button" onclick="cerrarModificar()" class="cancelbtn">Cancel</button>
                </div>

                <div id="cargarTarjeta">
                    <label><b>Datos de la trajeta</b></label>
                    <input id="txb_nombreTarjeta" type="text" placeholder="Numero de la tarjeta">
                    <input id="txb_fechaVencimiento" type="text" placeholder="Fecha de vencimiento">
                    <input id="txb_codigoSeguridad" type="text" placeholder="Codigo de seguridad">
                    <input id="txb_NombreTitular" type="text" placeholder="Nombre titular">
                    <input id="txb_DNI" type="text" placeholder="DNI">

                    <button type="button" onclick="abrirComprado()" class="botonesLogin">Finalizar compra</button>
                    <button type="button" onclick="cerrarModificar()" class="cancelbtn">Cancel</button>
                </div>
            </div>
        </form>
    </div>

    <div id="compraFinalizada" class="modal">
        <form class="modal-content animate">
            <div class="paddingLogin">
                <div class="datosCompra">
                    <h2><b>Datos de la compra</b></h2>
                    <div><h4>Nombre de juego: </h4> <a>Player Uknow Battelgroun PC LATAM</a></div>
                    <div><h4>Precio: </h4> <a>ARS $1500</a></div>
                    <div><h4>Fecha de compra: </h4> <a>11/11/1997</a></div>
                    <div><h4>Ultimos 4 digitos de tarjeta: </h4> <a>4455</a></div>
                    <div><h4>Codigo de activacion: </h4> <a>4455 5558 15SA</a></div>

                    <div><h3>Te hemos enviamos un Email con los detalles de la compra</h3></div>
                </div>

                <button type="button" onclick="finalizarCompra()" class="cancelbtn">Finalizar</button>
            </div>
        </form>
    </div>
    
    <div class="contenedor">
        <div class="tituloCarrito">
            <div style="float:right; margin-top: -2px">
                <button>Continuar comprando</button>
            </div>
            <a>Mi Carrito</a>
            
        </div>
        <form>
            <div class="juego">
                <div class="dentroJuego">
                    <div class="NombreJuego"><a>Counter Strike</a></div> 
                    <div class="precioUnit"><a>ARS $80</a></div> 
                    <div class="cantidad">
                        <div><button>-</button>
                        </div><div class="input"><input class="inputCantidad" type="text" value="5"></div>
                        <div><button>+</button></div>
                    </div>  
                    <div class="precioTotalJuego"><a>ARS $400</a></div> 
                    <div class="botonEliminar"><button>Eliminar</button></div>
                </div>
            </div>
        </form>

        <div class="total">
            <div style="width:11%; margin-top: -5px;"><button onclick="abrirPago('true')">Pagar</button></div>
            <div><a>Total: </a> <a>ARS $400</a></div>   
        </div>
    </div>

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

        function finalizarCompra() {
            location.href = "http://localhost:63536/ApartadoJuegos.aspx";
        }

        function cerrarModificar() {
            modal2.style.display = "none";

            cuerpo.style.overflow = "auto";
        }
    </script>
</asp:Content>
