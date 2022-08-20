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
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
        </fieldset>
    </div>
    <div>
                <fieldset>
            <legend>Gastos</legend>
                    <asp:GridView ID="GridView3" runat="server">
                    </asp:GridView>
        </fieldset>
    </div>
</asp:Content>
