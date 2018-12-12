<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarJuego(Paso4).aspx.cs" Inherits="DigitalGames.AgregarJuego_Paso4_" %>
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

        .botonAgregar{
            text-align:center;
            color: white;
            padding: 7px 10px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            margin-top: 8px;
        }

        .botonEliminar{
            color: white;
            padding: 7px 10px;
            background-color: red;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
            margin-top: 8px;
        }

        .row{
            width: 460px;
            height: auto;
            display: inline-block;
        }

        .column {
            border:2.5px solid rgba(21, 40, 56, 0.70);
            display: inline-block;
        }

        .imagenesChicas{
            width:115px;
            height: 65px;
        }

        .scroller{ 
            overflow: auto;
            white-space: nowrap;
            width: 460px;
            height: auto;
        } 

        .cursor{
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="datosCuenta">
                <div class="accordion">
                    <p>Imagenes (Paso 4/4)</p>
                </div>
                <div class="paneles">
                    <asp:FileUpload runat="server" ID="fu_Imagen" accept=".jpg,.png,.jpeg" Width="300px" />
                    <div>
                        <asp:Button runat="server" ID="btn_Agregar" Width="80px" CssClass="botonAgregar" Text="Agregar" OnClick="btn_Agregar_Click" />
                        <asp:Button runat="server" ID="btn_Eliminar" Width="80px" CssClass="botonEliminar" Text="Eliminar" OnClick="btn_Eliminar_Click" />
                    </div>

                    <div class="row">
                        <div class="scroller" id="divImagenes">
                            <asp:Literal runat="server" ID="literalImgChicas" />
                        </div>
                        <asp:CustomValidator runat="server" ID="cv_imagenes" OnServerValidate="cv_imagenes_ServerValidate" Font-Size="15px" ForeColor="Red" ErrorMessage="Agregue minimo una imagen." />
                    </div>

                    <div>
                        <a>Para elminar una imagen seleccione la deseada y luego toque eliminar.</a>
                    </div>

                    <div style="text-align:center">
                        <asp:Button runat="server" ID="btn_seleccionarPortada" Width="150px" CssClass="botonAgregar" Text="Seleccionar portada" OnClick="btn_seleccionarPortada_Click" />
                        <div><a>Portada: Imagen </a><asp:Label runat="server" ID="lbl_portada" Text ="0" ForeColor="White" /></div>
                        <a>Seleccione una imagen y toque seleccionar portada.</a>
                    </div>

                    <input runat="server" id="txb_posicionSeleccionada" type="hidden" value="null" />

                    <asp:Button runat="server" Width="200px" ID="btn_Volver" type="button" OnClick="btn_Volver_Click" Text="Volver" CssClass="botonCancelar" />
                    <asp:Button runat="server" Width="200px" ID="btn_Cancelar" type="button" OnClick="btn_Cancelar_Click" Text="Cancelar" CssClass="botonCancelar" />
                    <asp:Button runat="server" Width="200px" ID="btn_Finalizar" type="button" OnClick="btn_Finalizar_Click" Text="Finalizar" CssClass="botonSiguiente" Visible="false" />
                    <asp:Button runat="server" Width="200px" ID="btn_FinalizarModificar" type="button" OnClick="btn_FinalizarModificar_Click" Text="Finalizar" CssClass="botonSiguiente" Visible="false" />
                </div>
            </div>
        </div>

    <script>
        function cargarSession(pos)
        {
            var divImagenes = document.getElementById("divImagenes");
            var cantidad = divImagenes.getElementsByTagName("img").length;

            for (var i = 0; i < cantidad; i++)
            {
                if (pos == i)
                    document.getElementById("img" + pos).style.border = '2px solid white';
                else
                    document.getElementById("img" + i).style.border = '0';
            }

            document.getElementById('<%=txb_posicionSeleccionada.ClientID%>').value = pos;
        }
    </script>
</asp:Content>
