﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarModificarJuego.aspx.cs" Inherits="DigitalGames.AgregarModificarJuego" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $("#<%=txb_FechaInicio.ClientID%>").datepicker();
            $( "#<%=txb_FechaFin.ClientID%>" ).datepicker();
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
            margin-top: 10px;
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

        .botonGuardar{
            color: white;
            width: auto;
            padding: 7px 10px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            float:right;
            margin: 10px;
            font-size: 30px;
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
    <form class="contenedor" runat="server">
        <div class="datosCuenta">
            <Button class="accordion" onclick="return false">
                <p>Datos del juego</p>
            </Button>
            <div class="paneles">
                <div><asp:TextBox runat="server" ID="txb_nombre" placeholder="Nombre"></asp:TextBox></div>
                <div><asp:TextBox runat="server" ID="txb_empresa" placeholder="Empresa"></asp:TextBox></div>
                <div><asp:TextBox runat="server" ID="txb_descripcion" placeholder="Descripcion" rows="10" TextMode="MultiLine"></asp:TextBox></div>
                <div><asp:TextBox runat="server" ID="txb_requisitos" placeholder="Requisitos" rows="10" TextMode="MultiLine"></asp:TextBox></div>
         
                <div>
                    <asp:TextBox runat="server" ID="txb_tipo" placeholder="Buscar tipo..." onkeyup="filtrarTipo(); verficarVacio(this)"></asp:TextBox>
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
                        <asp:RadioButton runat="server" checked="true" GroupName="radio" value="PC" /><a>PC</a>
                        <asp:RadioButton runat="server" GroupName="radio" value="PS4" /><a>PS4</a>
                        <asp:RadioButton runat="server" GroupName="radio" value="PS3" /><a>PS3</a>
                        <asp:RadioButton runat="server" GroupName="radio" value="XBOX ONE" /><a>XBOX ONE</a>
                        <asp:RadioButton runat="server" GroupName="radio" value="XBOX360" /><a>XBOX360</a>
                </div>
                <div>
                    <div style="text-align:right; width: 480px; padding:0">
                        <button class="botonAgregar" onclick="agregarImagen(); return false">Agregar</button>
                    </div>
                    <div><input id="txb_imagen" type="URL" placeholder="Ingrese URL imagen" style="width:370px; height: 30px" spellcheck="false"></div>

                    <div id="scroller" class="scroller">

                    </div>

                    <div style="text-align:center">
                        <a>Haga doble click sobre la imagen para eliminarla.</a>
                    </div>

                    <div style="text-align:center; display:none">
                        <asp:ListBox runat="server" ID="lb_urlImagenes"/>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Datos comerciales</p>
            </button>
            <div class="paneles">
                <div><asp:TextBox runat="server" id="txb_Precio" type="text" placeholder="Precio ARS $" /></div>
                
                <div style="text-align:center">
                    <a>Stock actual: </a> <a>5</a>
                </div>

                

                <div style="text-align:center; width: 480px; padding:0">
                    <asp:TextBox runat="server" id="txb_codigo" placeholder="Codigo de activacion de un juego" width="380px" />
                    <button class="botonAgregar" onclick="agregarCodigo(); return false">Agregar</button>
                </div>

                <div style="text-align: center">
                    <asp:ListBox runat="server" ID="lb_CodJuegos" Height="200px" Width="480px"></asp:ListBox>
                </div>
                
                <div style="text-align:center">
                    <a>Haga doble click sobre el codigo para eliminarlo.</a>
                </div>

            </div>
        </div>
        <div class="datosCuenta">  
            <button class="accordion" onclick="return false">
                <p>Descuento</p>
            </button>
            <div class="paneles">
                <div>
                    <div><asp:TextBox runat="server" id="txb_Porcentaje" placeholder="Porcentaje de descuento %" /></div>
                    <div><asp:TextBox runat="server" id="txb_FechaInicio" placeholder="Fecha de inicio" /></div>
                    <div><asp:TextBox runat="server" id="txb_FechaFin" placeholder="Fecha de finalizacion" /></div>
                    <div class="checkDisponi"><a>Descuento Activo / Desactivo </a></div>
                    <div class="checkDisponi"><asp:CheckBox runat="server" id="txb_Disponibilidad" checked="true" /></div>
                </div> 
            </div>
        </div>
        <div class="datosCuenta">  
            <button class="accordion" onclick="return false">
                <p>Guardar cambios</p>
            </button>
            <div class="paneles">
                <div>
                    <asp:Button runat="server" cssClass="botonGuardar" Text="Guadar cambios" />
                </div> 
            </div>
        </div>
    </form>

    <script>
        function filtrarTipo() {
            var input, filter, ul, li, a, i;
            input = document.getElementById('<%=txb_tipo.ClientID%>');
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

            document.getElementById('<%=txb_tipo.ClientID%>').value = val.text;
            
            document.getElementById('<%=txb_tipo.ClientID%>').readonly = true;
        }

        var codigos = 0;

        function agregarCodigo() {
            var valor = document.getElementById('<%=txb_codigo.ClientID%>');
            var listbox = document.getElementById('<%=lb_CodJuegos.ClientID%>');
            var opcion = document.createElement("option");

            codigos++;

            opcion.id = "op" + codigos;
            opcion.innerHTML = valor.value;
            opcion.value = valor.value;
            listbox.appendChild(opcion);
            var aux = codigos;
            opcion.addEventListener("dblclick", function () { eliminarCodigo(aux); });

            valor.value = "";

            return false;
        }

        function eliminarCodigo(posicion) {
            if (codigos > 0) {
                var valor = document.getElementById('<%=txb_codigo.ClientID%>');
                var listbox = document.getElementById('<%=lb_CodJuegos.ClientID%>');
                var opcion = document.getElementById("op" + posicion);

                valor.value = opcion.value;

                listbox.removeChild(opcion);
            }
        }

        var imagenes = 0;

        function agregarImagen() {
            var scroll = document.getElementById("scroller");
            var nuevoElemento = document.createElement("div");
            var imagen = document.createElement("img");
            var rutaImagen = document.getElementById("txb_imagen").value;
            var listbox = document.getElementById('<%=lb_urlImagenes.ClientID%>');
            var opcion = document.createElement("option");

            imagenes++;

            scroll.appendChild(nuevoElemento);
            nuevoElemento.className = "column";
            nuevoElemento.id = "imagen" + imagenes;
            nuevoElemento.appendChild(imagen);
            imagen.className = "cursor imagenesChicas";
            imagen.src = rutaImagen;

            opcion.id = "op" + imagenes;
            opcion.innerHTML = rutaImagen;
            opcion.value = rutaImagen;
            listbox.appendChild(opcion);

            imagen.alt = "" + imagenes;
            var aux = imagenes;
            imagen.addEventListener("dblclick", function () { eliminarImagen(aux); });

            document.getElementById("txb_imagen").value = "";
        }

        function eliminarImagen(posicion) {
            if (imagenes > 0) {
                var imagen = document.getElementById("imagen" + posicion);
                var scroll = document.getElementById("scroller");
                var opcion = document.getElementById("op" + posicion);
                var listbox = document.getElementById('<%=lb_urlImagenes.ClientID%>');
                var rutaImagen = document.getElementById("txb_imagen");

                rutaImagen.value = opcion.value;

                listbox.removeChild(opcion);
                scroll.removeChild(imagen);
                return false;
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