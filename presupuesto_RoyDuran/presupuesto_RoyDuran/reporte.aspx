<%@ Page Title="" Language="C#" MasterPageFile="~/regular.Master" AutoEventWireup="true" CodeBehind="reporte.aspx.cs" Inherits="presupuesto_RoyDuran.reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Reportes</h1>
    <div class="auto-style1">
        Tipo De Reporte:<asp:DropDownList runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Descripcion" ID="drdTipo">
            <asp:ListItem Value="0">Año</asp:ListItem>
            <asp:ListItem Value="1">Mes</asp:ListItem>
            <asp:ListItem Value="2">Ingresos</asp:ListItem>
            <asp:ListItem Value="3">Gastos</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlReporte" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="878px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="idTipoTransaccion" HeaderText="idTipoTransaccion" SortExpression="idTipoTransaccion" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlReporte" runat="server" ConnectionString="<%$ ConnectionStrings:presupuestoConnectionString %>" SelectCommand="SELECT * FROM [transaccion]"></asp:SqlDataSource>
    </div>
</asp:Content>
