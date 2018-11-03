<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarModificarJuego.aspx.cs" Inherits="DigitalGames.AgregarModificarJuego" %>
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
            margin-top: 8px;
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

        .imagenesChicas{
            width:115px;
            height: 65px;
        }

        .imagenesChicas:hover{
            opacity: 0.7;
        }

        .cursor {
          cursor: pointer;
        }

        .column {
            border:2.5px solid rgba(21, 40, 56, 0.70);
            float: left;
        }

        .scroller{ 
            overflow-y: auto;
            width: 480px;
            height: 120px;
            border: 2px solid #c6c6c6;
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
            overflow: hidden;
            margin:auto auto auto auto;
            width: 500px;
        }

        .radioButtons{
            text-align: center;
        }

        .radioButtons input{
            cursor: pointer;
            width: 15px; 
            height: 15px;
        }
        .codigos{
            border: 2px solid white;
            border-radius: 5px 6px;
            overflow: auto;
            max-height: 200px;
            min-width: 400px;
        }
        .checkDisponi{
            text-align: center;
        }

        .checkDisponi input{
            cursor: pointer;
            width: 40px; 
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">
            <button class="accordion">
                <p>Datos del juego</p>
            </button>
            <div class="paneles">
                <div><input id="txb_nombre" type="text" placeholder="Nombre"></div>
                <div><input id="txb_empresa" type="text" placeholder="Empresa"></div>
                <div><textarea id="txb_descripcion" placeholder="Descripcion" rows="10"></textarea></div>
                <div><textarea id="txb_requisitos" placeholder="Requisitos" rows="10"></textarea></div>
         
                <div>
                    <input id="txb_tipo" type="text" placeholder="Buscar tipo..." onkeyup="filtrarTipo(); verficarVacio(this)">
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
                        <input type="radio" checked="checked" name="radio" value="PC"><a>PC</a>
                        <input type="radio" name="radio" value="PS4"><a>PS4</a>
                        <input type="radio" name="radio" value="PS3"><a>PS3</a>
                        <input type="radio" name="radio" value="XBOX ONE"><a>XBOX ONE</a>
                        <input type="radio" name="radio" value="XBOX360"><a>XBOX360</a>
                </div>
                <div>
                    <div style="text-align:right; width: 480px; padding:0">
                        <button class="botonAgregar" onclick="agregarImagen()">Agregar</button>
                    </div>
                    <div><input id="txb_imagen" type="URL" placeholder="Ingrese URL imagen" style="width:370px; height: 30px" spellcheck="false"></div>

                    <div id="scroller" class="scroller">

                    </div>

                    <div style="text-align:center">
                        <a>Haga click sobre la imagen para eliminarla.</a>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="datosCuenta">
            <button class="accordion">
                <p>Datos comerciales</p>
            </button>
            <div class="paneles">
                <div><input id="txb_Precio" type="text" placeholder="Precio ARS $"></div>
                <div style="text-align:center"><a>Stock actual: </a> <a>5</a><input id="txb_stock" type="text" placeholder="Stock a agregar"></div>
                <div class="codigos">
                    <div><input type="text" placeholder="COD 1"></div>
                    <div><input type="text" placeholder="COD 2"></div>
                    <div><input type="text" placeholder="COD 3"></div>
                    <div><input type="text" placeholder="COD 4"></div>
                    <div><input type="text" placeholder="COD 5"></div>
                    <div><input type="text" placeholder="COD 6"></div>
                </div>
            </div>
        </div>
        <div class="datosCuenta">  
            <button class="accordion">
                <p>Descuento</p>
            </button>
            <div class="paneles">
                <div>
                    <div><input id="txb_Porcentaje" type="text" placeholder="Porcentaje de descuento %"></div>
                    <div><input id="txb_FechaInicio" type="text" placeholder="Fecha de inicio"></div>
                    <div><input id="txb_FechaFin" type="text" placeholder="Fecha de finalizacion"></div>
                    <div class="checkDisponi"><a>Descuento Activo / Desactivo </a></div>
                    <div class="checkDisponi"><input id="txb_Disponibilidad" type="checkbox" checked="true"></div>
                </div> 
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