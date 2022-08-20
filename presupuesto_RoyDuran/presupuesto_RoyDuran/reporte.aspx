<%@ Page Title="" Language="C#" MasterPageFile="~/regular.Master" AutoEventWireup="true" CodeBehind="reporte.aspx.cs" Inherits="presupuesto_RoyDuran.reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Reportes</h1>
    <div class="auto-style1">
        Tipo De Reporte:<asp:DropDownList runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Descripcion">
            <asp:ListItem Value="0">Año</asp:ListItem>
            <asp:ListItem Value="1">Mes</asp:ListItem>
            <asp:ListItem Value="2">Ingresos</asp:ListItem>
            <asp:ListItem Value="3">Gastos</asp:ListItem>
        </asp:DropDownList>
    </div>
</asp:Content>
