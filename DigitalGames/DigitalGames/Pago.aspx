<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Pago.aspx.cs" Inherits="DigitalGames.Pago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tarjetas{
            padding: 10px;
            height: auto;
            max-height: 300px;
            overflow: auto;
        }

        .ListboxModf{
            font-size: 20px;
            background-color: transparent;
            width: 100%;
            overflow: auto;
            text-align:center;
            border: 0;
        }

        .ListboxModf option{
            border: 1px solid grey;
            padding: 5px;
            font-weight: bold;
            background-color: rgba(83, 83, 83, 0.2);
            margin: 0 0 2px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="pago" class="modal-content">
            <div class="paddingLogin">
                <div id="elegirTarjeta">
                    <h4 style="margin: 0"><b>Tus tarjetas</b></h4>
                    <div class="tarjetas">
                        <div><asp:ListBox runat="server" id="lb_tarjetas" CssClass="ListboxModf" ondblclick="ListBox_DoubleClick()" /></div>
                    </div>
                    <asp:Button runat="server" ID="btn_seleccionar" CssClass="botonesLogin" Text="Seleccionar" OnClick="btn_seleccionar_Click" />
                </div>

                <div id="cargarTarjeta">
                    <label><b>Nueva trajeta</b></label>
                    <input runat="server" type="text" id="txb_banco" placeholder="Banco" />
                    <asp:CustomValidator runat="server" ControlToValidate="txb_banco" ValidateEmptyText="true" OnServerValidate="Unnamed_ServerValidate" ErrorMessage="Complete el campo" ForeColor="Red" Font-Size="15px" />
                    <input runat="server" type="text" id="txb_nombreTarjeta" placeholder="Numero de la tarjeta" />
                    <asp:CustomValidator runat="server" ControlToValidate="txb_nombreTarjeta" ValidateEmptyText="true" OnServerValidate="Unnamed_ServerValidate" ErrorMessage="Complete el campo" ForeColor="Red" Font-Size="15px" />
                    <input runat="server" type="date" id="txb_fechaVencimiento" placeholder="Fecha de vencimiento" />
                    <asp:CustomValidator runat="server" ControlToValidate="txb_fechaVencimiento" ValidateEmptyText="true" OnServerValidate="Unnamed_ServerValidate" ErrorMessage="Complete el campo" ForeColor="Red" Font-Size="15px" />
                    <input runat="server" type="text" id="txb_NombreTitular" placeholder="Nombre titular" />
                    <asp:CustomValidator runat="server" ControlToValidate="txb_NombreTitular" ValidateEmptyText="true" OnServerValidate="Unnamed_ServerValidate" ErrorMessage="Complete el campo" ForeColor="Red" Font-Size="15px" />
                    <input runat="server" type="number" id="txb_DNI" placeholder="DNI" />
                    <asp:CustomValidator runat="server" ControlToValidate="txb_DNI" ValidateEmptyText="true" OnServerValidate="Unnamed_ServerValidate" ErrorMessage="Complete el campo" ForeColor="Red" Font-Size="15px" />

                    <asp:Button runat="server" ID="btn_finalizarCompra" CssClass="botonesLogin" Text="Finalizar compra" OnClick="btn_finalizarCompra_Click" />
                    <asp:Button runat="server" ID="btn_cancelar" type="button" class="cancelbtn" Text="Cancelar" OnClick="btn_cancelar_Click" />
                </div>
            </div>
        </div>
</asp:Content>
