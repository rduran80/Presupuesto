<%@ Page Title="" Language="C#" MasterPageFile="~/regular.Master" AutoEventWireup="true" CodeBehind="reporteGlobal.aspx.cs" Inherits="presupuesto_RoyDuran.reporteGlobal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Reporte global</h1>
    <div>
        <fieldset>
            <legend>Balance</legend>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </fieldset>
    </div>
    <div>
                <fieldset>
            <legend>Ingresos</legend>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlIngresos">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="idTipoTransaccion" HeaderText="idTipoTransaccion" SortExpression="idTipoTransaccion" />
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                            <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlIngresos" runat="server" ConnectionString="<%$ ConnectionStrings:presupuestoConnectionString %>" SelectCommand="SELECT * FROM [transaccion] WHERE ([idTipoTransaccion] = @idTipoTransaccion)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="idTipoTransaccion" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </fieldset>
    </div>
    <div>
                <fieldset>
            <legend>Gastos</legend>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlIngresos">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="idTipoTransaccion" HeaderText="idTipoTransaccion" SortExpression="idTipoTransaccion" />
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                            <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        </Columns>
                    </asp:GridView>
        </fieldset>
    </div>
</asp:Content>
