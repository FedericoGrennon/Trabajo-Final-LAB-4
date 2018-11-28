<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="IniciarSession.aspx.cs" Inherits="DigitalGames.IniciarSession" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat ="server" id="iniciar" class="modal-content">
        <div class="paddingLogin">
            <label><b>Usuario</b></label>
            <asp:TextBox runat="server" ID="txb_nombreUsuarioIS" placeholder="Ingrese usuario/email" />
            <asp:CustomValidator runat="server" ControlToValidate="txb_nombreUsuarioIS" ValidateEmptyText="true" OnServerValidate="Unnamed_ServerValidate" ErrorMessage="Complete el usuario" ForeColor="Red" Font-Size="15px" />

            <div><label for="psw"><b>Contraseña</b></label></div>
            <input runat="server" ID="txb_contraseñaIS" type="password" placeholder="Ingrese contraseña" /> 
            <asp:CustomValidator runat="server" ControlToValidate="txb_contraseñaIS" ValidateEmptyText="true" OnServerValidate="Unnamed_ServerValidate" ErrorMessage="Complete la contraseña" ForeColor="Red" Font-Size="15px" />

            <div><asp:CustomValidator runat="server" ID="cv_validaContraseñaIS" ValidateEmptyText="true" OnServerValidate="cv_validaNombreIS_ServerValidate" ErrorMessage="Usuario/email incorrecto o contraseña incorrecta" ForeColor="red" Font-Size="15px" /></div>

            <asp:Button runat="server" CssClass="botonesLogin" ID="btn_LogineIS" Text="Iniciar Sesion" OnClick="btn_LogineIS_Click" />
            <asp:Button runat="server" CssClass="botonesLogin" ID="btn_registrarse" Text="Registrarse" OnClick="btn_registrarse_Click" />
            <asp:Button runat="server" CssClass="cancelbtn" ID="btn_Cancelar" Text="Cancel" OnClick="btn_Cancelar_Click" />
        </div>
    </div>
</asp:Content>
