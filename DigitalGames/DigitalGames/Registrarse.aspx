<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="DigitalGames.Registrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="regitrarse" class="modal-content">
        <div class="paddingLogin">
            <label><b>Datos de la cuenta</b></label>

            <input runat="server" type="text" maxlength="49" ID="txb_nombreUsuarioReg" placeholder="Usuario" />
            <asp:CustomValidator runat="server" ID="cv_validaReg1" ControlToValidate="txb_nombreUsuarioReg" ValidateEmptyText="true" OnServerValidate="cv_validarNombreReg_ServerValidate" ErrorMessage="Campo oblogatorio / Usuario repetido" ForeColor="red" Font-Size="15px" />

            <input runat="server" type="email" maxlength="99" ID="txb_MailReg" placeholder="Email" />
            <asp:CustomValidator runat="server" ID="cv_validaReg2" ValidateEmptyText="true" ControlToValidate="txb_MailReg" OnServerValidate="cv_validarEmail_ServerValidate" ErrorMessage="Campo oblogatorio / Email repetido" ForeColor="red" Font-Size="15px" />
                    
            <input runat="server" type="password" minlenght="6" maxlength="16" ID="txb_contraseñaReg" placeholder="Contraseña" />
            <asp:customValidator runat="server" ID="cv_validaReg3" ControlToValidate="txb_contraseñaReg" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    
            <input runat="server" type="password" minlenght="6" maxlength="16" ID="txb_ConfirmarcontraseñaReg" placeholder="Repita contraseña" />
            <asp:customValidator runat="server" ID="cv_validaReg4" ControlToValidate="txb_ConfirmarcontraseñaReg" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Repita la contraseña." />
            <asp:CompareValidator runat="server" ID="cv_validaReg5" ControlToValidate="txb_ConfirmarcontraseñaReg" ControlToCompare="txb_contraseñaReg" ErrorMessage="Las contraseñas no coinciden" ForeColor="Red" Font-Size="15px" />

            <div><label><b>Datos personales</b></label></div>
            <input runat="server" type="text" maxlength="49" id="txb_NombreReg" placeholder="Nombre completo" />
            <asp:customValidator runat="server" ID="cv_validaReg6" ControlToValidate="txb_NombreReg" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    
            <input runat="server" type="text" maxlength="49" id="txb_ApellidoReg" placeholder="Apellido" />
            <asp:customValidator runat="server" ID="cv_validaReg7" ControlToValidate="txb_ApellidoReg" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    
            <input runat="server" type="date" id="txb_fechaNacReg" placeholder="Fecha de nacimiento" />
            <asp:customValidator runat="server" ID="cv_validaReg8" ControlToValidate="txb_fechaNacReg" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    
            <input runat="server" type="text" maxlength="49" id="txb_Pais" placeholder="Pais" />
            <asp:customValidator runat="server" ID="cv_validaReg9" ControlToValidate="txb_Pais" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    
            <input runat="server" type="text" maxlength="49" id="txb_Provincia" placeholder="Provincia" />
            <asp:customValidator runat="server" ID="cv_validaReg10" ControlToValidate="txb_Provincia" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    
            <input runat="server" type="text" maxlength="49" id="txb_Localidad" placeholder="Localidad" />
            <asp:customValidator runat="server" ID="cv_validaReg11" ControlToValidate="txb_Localidad" Font-size="15px"  ValidateEmptyText="true" OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />
                    
            <input runat="server" type="number" minlenght="8" maxlength="49" id="txb_Telefono" placeholder="Telefono" />
            <asp:customValidator runat="server" ID="cv_validaReg12" ControlToValidate="txb_Telefono" Font-size="15px"  ValidateEmptyText="true"  OnServerValidate="validarTextbox_ServerValidate" ForeColor="red" ErrorMessage="Campo oblogatorio." />

            <asp:Button runat="server" CssClass="botonesLogin" id="btn_NuevaCuentaReg" Text="Crear cuenta" OnClick="btn_NuevaCuentaReg_Click" />

            <asp:Button runat="server" id="btn_cancelReg" type="button" CssClass="cancelbtn" OnClick="btn_cancelReg_Click" Text="Volver" />
        </div>
    </div>
</asp:Content>
