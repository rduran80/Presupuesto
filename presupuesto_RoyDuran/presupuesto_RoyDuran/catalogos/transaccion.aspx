﻿<%@ Page Title="" Language="C#" MasterPageFile="~/catalogos/regular.Master" AutoEventWireup="true" CodeBehind="transaccion.aspx.cs" Inherits="presupuesto_RoyDuran.catalogos.ingresos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Ingresos y Gastos</h1>
    <div class="div-inicio">Tipo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
        <br />

        <asp:Button class="btn-navbar" ID="Button1" runat="server" Text="Agregar"/>
            &nbsp;&nbsp;&nbsp;
        <asp:Button class="btn-navbar" ID="Button2" runat="server" Text="Actualizar" />
            &nbsp;&nbsp;&nbsp;
        <asp:Button class="btn-navbar" ID="Button3" runat="server" Text="Borrar" />
    </div>
    <div class="div-inicio">
        <asp:GridView ID="GridView1" runat="server" Height="285px" Width="496px">
        </asp:GridView>
    </div>
    <div class="div-inicio">
        <asp:GridView ID="GridView2" runat="server" Height="285px" Width="496px">
        </asp:GridView>
    </div>
</asp:Content>