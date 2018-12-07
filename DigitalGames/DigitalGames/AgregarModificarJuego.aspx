<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarModificarJuego.aspx.cs" Inherits="DigitalGames.AgregarModificarJuego" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">

    <style>
        .contenedor{
            width:100%;
            background-color: rgba(29, 46, 74, 0.70);
            max-height: 400px;
            min-width: 400px;
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

        .validationSummary{
            font-size: 20px;
            color: #ff9898;
            border: 2px solid white;
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

        .radioButtons label{
            font-size: 16px;
            color: white;
        }

        .checkDisponi{
            text-align: center;
        }

        .checkDisponi input{
            cursor: pointer;
            width: 40px; 
            height: 40px;
        }

        .textoStock{
            font-size: 16px;
            color: white;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">
            <Button class="accordion" onclick="return false">
                <p>Datos del juego</p>
            </Button>
            <div class="paneles">
                <div>
                    <asp:TextBox Width="450px" runat="server" ID="txb_nombre" placeholder="Nombre" ></asp:TextBox>
                    <asp:customValidator runat="server" ID="cv_nombreJuego" ControlToValidate="txb_nombre" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete el nombre." />
                </div>
                <div>
                    <asp:TextBox Width="450px" runat="server" ID="txb_empresa" placeholder="Empresa"></asp:TextBox>
                    <asp:customValidator runat="server" ID="cv_EmpresaJuego" ControlToValidate="txb_empresa" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete la empresa."/>
                </div>
                
                <div>
                    <asp:TextBox Width="450px" runat="server" ID="txb_descripcion" placeholder="Descripcion" rows="10" TextMode="MultiLine"></asp:TextBox>
                    <asp:customValidator runat="server" ID="cv_descripcionJuego" ControlToValidate="txb_descripcion" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete la descripcion." />
                </div>
                
                <div>
                    <asp:TextBox Width="450px" runat="server" ID="txb_requisitos" placeholder="Requisitos" rows="10" TextMode="MultiLine"></asp:TextBox>
                    <asp:customValidator runat="server" ID="cv_requisitosJuego" ControlToValidate="txb_requisitos" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete los requisitos." />
                </div>
                
                <div style="text-align:center">
                    <input Width="450px" runat="server" ID="txb_tipo" type="text" value="Acción" readonly style="display:block" />
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

                <div>
                    <div style="color:white; font-size: 15px; border:2px solid white">
                        <h5 style="text-align:center; font-size: 23px; margin:4px 0 10px 0; border-bottom: 1px solid white">Cargar Imagenes</h5>

                        <asp:FileUpload runat="server" id="fu_cargadorDeArchivo1" accept=".jpg,.png,.jpeg" />
                         
                        <asp:FileUpload runat="server" id="fu_cargadorDeArchivo2" accept=".jpg,.png,.jpeg" />
                                               
                        <asp:FileUpload runat="server" id="fu_cargadorDeArchivo3" accept=".jpg,.png,.jpeg" />
                                              
                        <asp:FileUpload runat="server" id="fu_cargadorDeArchivo4" accept=".jpg,.png,.jpeg" />
                                             
                        <asp:FileUpload runat="server" id="fu_cargadorDeArchivo5" accept=".jpg,.png,.jpeg" />
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion" onclick="return false">
                <p>Datos comerciales</p>
            </button>
            <div class="paneles">
                <div>
                    <input runat="server" id="txb_Precio" type="number" placeholder="Precio ARS $" min="0" max="999999.00" step="0.01" />
                    <asp:customValidator runat="server" ID="cv_PrecioJuego" ControlToValidate="txb_Precio" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete el precio." />
                </div>
                
                <div style="text-align:center">
                    <a>Stock actual: </a> <asp:Label runat="server" ID="lbl_stockActual" CssClass="textoStock" Text="0" />
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

                <input id="ip_listboxCodigos" type="hidden" value="" name="ip_listboxCodigos"/>

            </div>
        </div>
        <div class="datosCuenta">  
            <button class="accordion" onclick="return false">
                <p>Descuento</p>
            </button>
            <div class="paneles">
                <div>
                    <div><input runat="server" id="txb_Porcentaje" type="number" min="0" max="100" placeholder="Porcentaje de descuento %" /></div>
                    <asp:customValidator runat="server" ID="CustomValidator1" ControlToValidate="txb_Porcentaje" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete el porcentaje." />
                    <div><input runat="server" id="txb_FechaInicio" type="datetime-local" placeholder="Fecha de inicio" /></div>
                    <asp:customValidator runat="server" ID="CustomValidator2" ControlToValidate="txb_FechaInicio" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete la fecha inico." />
                    <div><input runat="server" id="txb_FechaFin" type="datetime-local" placeholder="Fecha de finalizacion" /></div>
                    <asp:customValidator runat="server" ID="CustomValidator3" ControlToValidate="txb_FechaFin" Font-size="15px"  ValidateEmptyText="true" ClientValidationFunction="validarTextBox" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Complete la fecha finalizacion." />
                    <div class="checkDisponi"><a>Descuento Activo / Desactivo </a></div>
                    <div class="checkDisponi"><asp:CheckBox runat="server" id="chx_Disponibilidad" checked="true" /></div>
                </div> 
            </div>
        </div>
        <div class="datosCuenta">  
            <button class="accordion" onclick="return false">
                <p>Guardar cambios</p>
            </button>
            <div class="paneles">
                <div>
                    <asp:Button runat="server" Height="50px" ID="btn_guardarCambios" cssClass="botonGuardar" Text="Guadar cambios" OnClick="btn_guardarCambios_Click" autopostback="false" />
                </div> 
            </div>
        </div>
    </div>

    <script>
        function ValidarListBox(sender, args){
            args.IsValid = document.getElementById(sender.controltovalidate).options.length > 0;

            if (!args.IsValid)
            {
                document.getElementById("txb_imagen").style.border = "1px solid red";
            }
            else
            {
                document.getElementById("txb_imagen").style.border  = "0";
            }
        }

        function encontroTipo(val) {
            document.getElementById('<%=txb_tipo.ClientID%>').value = val.text;
        }

        var codigos = 0;

        function agregarCodigo() {
            var valor = document.getElementById('<%=txb_codigo.ClientID%>');
            var valorAguardar = valor.value.replace(/[^a-zA-Z0-9]/g, '').toUpperCase();

            if (valor.value != "" && valorAguardar.length <= 19) {
                var listbox = document.getElementById('<%=lb_CodJuegos.ClientID%>');
                var opcion = document.createElement("option");

                var labelStock = document.getElementById('<%=lbl_stockActual.ClientID%>');

                codigos++;

                opcion.id = "op" + codigos;
                opcion.innerHTML = valorAguardar;
                opcion.value = valorAguardar;
                listbox.appendChild(opcion);
                var aux = codigos;
                opcion.addEventListener("dblclick", function () { eliminarCodigo(aux); });

                labelStock.textContent = listbox.options.length + "";

                document.getElementById("ip_listboxCodigos").value += valorAguardar + "-";

                valor.value = "";
            }

            return false;
        }

        function eliminarCodigo(posicion) {
            if (codigos > 0) {
                var valor = document.getElementById('<%=txb_codigo.ClientID%>');
                var listbox = document.getElementById('<%=lb_CodJuegos.ClientID%>');
                var opcion = document.getElementById("op" + posicion);

                var labelStock = document.getElementById('<%=lbl_stockActual.ClientID%>');

                var input = document.getElementById('ip_listboxCodigos');
                var aux = input.value;
                var cods = aux.split('-');
                var pos = 0;

                cods.forEach(function (elemento) {
                    if (elemento == opcion.textContent) {
                        cods.splice(pos, 1);
                    }
                    pos++;
                });

                input.value = cods.join("-");

                labelStock.textContent = listbox.options.length - 1 + "";

                valor.value = opcion.value;

                listbox.removeChild(opcion);
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