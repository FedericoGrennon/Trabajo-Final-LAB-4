<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarQuitarJuego.aspx.cs" Inherits="Digital_Games.AgregarQuitarJuego" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $("#txb_FechaInicio").datepicker();
            $( "#txb_FechaFin" ).datepicker();
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

        .datosCuenta form{
            border: 2px solid white;
            border-radius: 5px 6px;
            width: 20%;
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

        .botonAgregar{
            color: white;
            width: auto;
            padding: 7px 10px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            float:right;
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

        .Radio {
            display: block;
            /*position: relative;*/
            padding-left: 35px;
            margin-bottom: 12px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Hide the browser's default radio button */
        .Radio input {
            /*position: absolute;*/
            opacity: 0;
            cursor: pointer;
        }

        /* Create a custom radio button */
        .marca {
            /*position: absolute;*/
            top: 0;
            left: 0;
            height: 25px;
            width: 25px;
            background-color: #eee;
            border-radius: 50%;
        }

        /* On mouse-over, add a grey background color */
        .Radio:hover input ~ .marca {
            background-color: #ccc;
        }

        /* When the radio button is checked, add a blue background */
        .Radio input:checked ~ .marca {
            background-color: #2196F3;
        }

        /* Create the indicator (the dot/circle - hidden when not checked) */
        .marca:after {
            content: "";
            /*position: absolute;*/
            display: none;
        }

        /* Show the indicator (dot/circle) when checked */
        .Radio input:checked ~ .marca:after {
            display: block;
        }

        /* Style the indicator (dot/circle) */
        .Radio .marca:after {
 	        top: 9px;
	        left: 9px;
	        width: 8px;
	        height: 8px;
	        border-radius: 50%;
	        background: white;
        }

        .imagenesChicas{
            width:115px;
            height: 65px;
        }

        .cursor {
          cursor: pointer;
        }

        .column {
            border:2.5px solid rgba(21, 40, 56, 0.70);
            float: left;
        }

        .scroller{ 
            overflow-x: auto;
            overflow-y: auto;
            width: 617px;
            height: 70px;
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">
            <p>Datos del juego</p>
            <div><input id="txb_nombre" type="text" placeholder="Nombre"></div>
            <div><input id="txb_empresa" type="text" placeholder="Empresa"></div>
            <div><textarea id="txb_descripcion" placeholder="Descripcion" rows="10"></textarea></div>
            <div><textarea id="txb_requisitos" placeholder="Requisitos" rows="10"></textarea></div>
         
            <div>
                <input id="txb_tipo" type="text" placeholder="Buscar tipo..." onkeyup="filtrarTipo(); verficarVacio(this)">
                <div id="listaJuegos">
                    <ul id="milista" class="myUL">
                        <li><a style="cursor: pointer" onclick="encontroTipo(this)">e e e e e eeeafdsf e fsf sg df gdfg dfg dgdfg</a></li>
                        <li><a style="cursor: pointer" onclick="encontroTipo(this)">Agnes</a></li>
                        <li><a style="cursor: pointer" onclick="encontroTipo(this)">Billy</a></li>
                        <li><a style="cursor: pointer" onclick="encontroTipo(this)">Bob</a></li>
                        <li><a style="cursor: pointer" onclick="encontroTipo(this)">Calvin</a></li>
                        <li><a style="cursor: pointer" onclick="encontroTipo(this)">Christina</a></li>
                        <li><a style="cursor: pointer" onclick="encontroTipo(this)">Cindy</a></li>
                    </ul>
                </div>
            </div>

            <div>
                <label class="Radio">PC
                    <input type="radio" checked="checked" name="radio">
                    <span class="marca"></span>
                </label>
                <label class="Radio">PS4
                    <input type="radio" name="radio">
                    <span class="marca"></span>
                </label>
                <label class="Radio">PS3
                    <input type="radio" name="radio">
                    <span class="marca"></span>
                </label>
                <label class="Radio">XBOX ONE
                    <input type="radio" name="radio">
                    <span class="marca"></span>
                </label>
                <label class="Radio">XBOX 360
                    <input type="radio" name="radio">
                    <span class="marca"></span>
                </label>
            </div>

            <div>
                <div style="text-align:right; width: 480px; padding:0">
                    <button class="botonAgregar" onclick="agregarImagen()">Agregar</button>
                </div>
                <div><input id="txb_imagen" type="URL" placeholder="Ingrese URL imagen"></div>

                <div id="scroller" class="scroller">

                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <p>Datos comerciales</p>
            <div><input id="txb_Precio" type="text" placeholder="Precio ARS $"></div>
            <div><a>Stock actual: 5 </a><input id="txb_stock" type="text" placeholder="Stock a agregar"></div>
            <div>
                <div><input id="txb_cods" type="text" placeholder="COD 1"></div>
            </div>
        </div>

        <div class="datosCuenta">        
            <p>Descuento</p>
                <div>
                    <div><input id="txb_Porcentaje" type="text" placeholder="Porcentaje de descuento %"></div>
                    <div><input id="txb_FechaInicio" type="text" placeholder="Fecha de inicio"></div>
                    <div><input id="txb_FechaFin" type="text" placeholder="Fecha de finalizacion"></div>
                    <div><a>Activo / Desactivo </a><input id="txb_Disponibilidad" type="checkbox"></div>
                </div> 
        </div>
    </div>

    <script>
        function filtrarTipo() {
            var input, filter, ul, li, a, i;
            input = document.getElementById("txb_tipo");
            filter = input.value.toUpperCase();
            ul = document.getElementById("milista");
            li = ul.getElementsByTagName("li");
            for (i = 0; i < li.length; i++) {
                a = li[i].getElementsByTagName("a")[0];
                if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    li[i].style.display = "";
                } else {
                    li[i].style.display = "none";
                }
            }
        }

        function verficarVacio(valor) {
            if (valor.value == "") {
                document.getElementById('milista').style.display = "block";
            }
        }

        function encontroTipo(val) {
            document.getElementById('milista').style.display = "none";

            document.getElementById('txb_tipo').value = val.text;
            
            document.getElementById('txb_tipo').readonly = true;
        }

        var imagenes = 0;

        function agregarImagen() {
            var scroll = document.getElementById("scroller");
            var nuevoElemento = document.createElement("div");
            var imagen = document.createElement("img");
            var rutaImagen = document.getElementById("txb_imagen").value;

            imagenes++;

            scroll.appendChild(nuevoElemento);
            nuevoElemento.className = "column";
            nuevoElemento.id = "" + imagenes;
            nuevoElemento.appendChild(imagen);
            imagen.className = "cursor imagenesChicas";
            imagen.src = rutaImagen;
            imagen.alt = "" + imagenes;
            var aux = imagenes;
            imagen.addEventListener("click", function () { eliminarImagen(aux); });

            document.getElementById("txb_imagen").value = "";
        }

        function eliminarImagen(posicion) {
            if (imagenes > 0) {
                var imagen = document.getElementById("" + posicion);
                var scroll = document.getElementById("scroller");

                scroll.removeChild(imagen);
            }
        }
    </script>
</asp:Content>
