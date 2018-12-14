<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ReportesYestadisticas.aspx.cs" Inherits="DigitalGames.ReportesYestadisticas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contenedor
        {
            width:100%;
            height: 144px;
        }

        .apartado
        {
            width: calc(100% - 250px);
            height: 100%;
            margin-left: 250px;
        }

        .filtros
        {
            margin: 0 0 0 15%;
            padding: 30px;
            width: 70%;
            height: 100%;
            text-align:center;
        }

        .slideBar
        {
            background-color: #4e7797;
            margin: 0;
            padding: 0;
            width: 250px;
            position: fixed;
            height: 100%;
            overflow: auto;
            text-align:center;
        }

        .slideBar input
        {
            background-color: #4e7797;
            margin: 0;
            padding: 7px;
            width: 100%;
            border: 0;
            color: white;
            font-size: 40px;
            cursor: pointer;
        }

        .slideBar input:hover
        {
            background-color: #0c5289;
        }

        .slideBar p
        {
            margin: 0 0 10px 0;
            border-bottom: 1px solid white;
            width: 100%;
            color: white;
            font-size: 40px;
            cursor: pointer;
        }

        .dropDown{
            padding: 15px;
            text-align: right;
        }

        .dropDown a{
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        .dropDown select, input{
            padding: 8px;
            font-size: 20px;
            border: 0;
            cursor:pointer;
            background-color: #4e7797;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <div class="slideBar">
            <div style="padding: 7px"><p>Menu</p></div>
            <div>
                <asp:Button runat="server" ID="btn_Juegos" Text="Juegos" OnClick="btn_Juegos_Click"/>
            </div>
            <div>
                <asp:Button runat="server" ID="btn_Usuarios" Text="Usuarios" OnClick="btn_Usuarios_Click"/>
            </div>
            <div>
                <asp:Button runat="server" ID="btn_General" Text="General" OnClick="btn_General_Click"/>
            </div>
        </div>

        <div class="apartado">
            <div runat="server" id="Juegos" class="filtros" style="display:none">
                <div class="dropDown">
                    <a>Ordenar por:</a>
                    <asp:DropDownList runat="server" ID="ddl_ordenarRecaudacion"/>
                    <asp:Button runat="server" ID="btn_ordenar" Text="Ordenar" OnClick="btn_ordenar_Click"/>
                </div>

                <asp:GridView runat="server" id="gv_Juegos" AutoGenerateColumns="False" Font-Size="20px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="259px" style="margin-right: 6px" Width="100%" >
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lbl_nombreJuego" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cant ventas con descuento">
                            <ItemTemplate>
                                <asp:Label ID="lbl_cantVentDesc" runat="server" Text='<%# Bind("cantVentasDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cant ventas sin descuento">
                            <ItemTemplate>
                                <asp:Label ID="lbl_cantVentasSinDesc" runat="server" Text='<%# Bind("CantVentasSinDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cant totales ventas">
                            <ItemTemplate>
                                <asp:Label ID="lbl_CantVentasTotales" runat="server" Text='<%# Bind("CantVentasTotales") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Recaudación ($ARS)">
                            <ItemTemplate>
                                <asp:Label ID="lbl_recaudacion" runat="server" Text='<%# Bind("Recaudacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
            <div runat="server" id="Usuarios" class="filtros" style="display:none">

            </div>
            <div runat="server" id="General" class="filtros" style="display:none">

            </div>
        </div>
    </div>
</asp:Content>
