<%@ Page Title="" Language="C#" MasterPageFile="~/regular.Master" AutoEventWireup="true" CodeBehind="reporteFiltros.aspx.cs" Inherits="presupuesto_RoyDuran.reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Reportes</h1>
    <div class="auto-style1">
        Tipo De Reporte: <asp:DropDownList runat="server" DataSourceID="SqlDataSource1" DataTextField="tipoContable" DataValueField="tipoContable" ID="drdTipoT" AutoPostBack="True">
            <asp:ListItem Value="1">Ingresos</asp:ListItem>
            <asp:ListItem Value="2">Gastos</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:presupuestoConnectionString %>" SelectCommand="obtTipoTrans" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
&nbsp;<asp:Label ID="lblMail" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlReporte" Width="1285px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="idTipoTransaccion" HeaderText="idTipoTransaccion" SortExpression="idTipoTransaccion" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlReporte" runat="server" ConnectionString="<%$ ConnectionStrings:presupuestoConnectionString %>" SelectCommand="SELECT * FROM [transaccion] WHERE ([email] = @email)">
            <SelectParameters>
                <asp:ControlParameter ControlID="drdTipoT" Name="email" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>
