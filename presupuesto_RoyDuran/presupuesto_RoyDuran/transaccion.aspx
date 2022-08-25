<%@ Page Title="" Language="C#" MasterPageFile="/regular.Master" AutoEventWireup="true" CodeBehind="transaccion.aspx.cs" Inherits="presupuesto_RoyDuran.catalogos.ingresos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        border-style: none;
        border-color: inherit;
        border-width: 1px;
        height: 273px;
        width: 50%;
        margin: 0 auto;
        padding: 10px;
        text-align: center;
        color: white;
    }
    .auto-style2 {
        border-style: none;
        border-color: inherit;
        border-width: 1px;
        height: 303px;
        width: 50%;
        margin: 0 auto;
        padding: 10px;
        text-align: center;
        color: white;
    }
    .auto-style3 {
        border-style: none;
        border-color: inherit;
        border-width: 1px;
        height: 295px;
        width: 50%;
        margin: 0 auto;
        padding: 10px;
        text-align: center;
        color: white;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center;">Ingresos y Gastos</h1>
    <div class="auto-style1">
        Tipo:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        Descripcion:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        Fecha:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        Monto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" TextMode="Number"></asp:TextBox>
        <br />
        <br />

        <asp:Button class="btn-navbar" ID="Button1" runat="server" Text="Agregar"/>
            &nbsp;&nbsp;&nbsp;
        <asp:Button class="btn-navbar" ID="Button2" runat="server" Text="Actualizar" />
            &nbsp;&nbsp;&nbsp;
        <asp:Button class="btn-navbar" ID="Button3" runat="server" Text="Borrar" />
    </div>
    <div class="auto-style2">
        <asp:GridView ID="GridView1" runat="server" Height="285px" Width="719px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlIngresos" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                <asp:Parameter DefaultValue="1" Name="idTipoTransaccion" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="auto-style3">
        <asp:GridView ID="GridView2" runat="server" Height="285px" Width="716px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlGastos">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="idTipoTransaccion" HeaderText="idTipoTransaccion" SortExpression="idTipoTransaccion" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlGastos" runat="server" ConnectionString="<%$ ConnectionStrings:presupuestoConnectionString %>" SelectCommand="SELECT * FROM [transaccion] WHERE ([idTipoTransaccion] = @idTipoTransaccion)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="idTipoTransaccion" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
