<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="presupuesto_RoyDuran.registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Registro de personas</h1>
            <div class="div div-login">
                Cedula:&nbsp;&nbsp; <asp:TextBox ID="txtCedula" runat="server" required="true"></asp:TextBox>
                <br />
                <br />
                Nombre:&nbsp; <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <br />
                <br />
                Apellido: <asp:TextBox ID="txtApellido1" runat="server"></asp:TextBox>
                <br />
                <br />
                Apellido: <asp:TextBox ID="txtApellido2" runat="server"></asp:TextBox>
                <br />
                <br />
                E-mail:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                <br />
                <br />
                Direccion:<asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                <br />
                <br />
                Telefono :<asp:TextBox ID="txtTelefono" runat="server" AutoPostBack="True"></asp:TextBox>
                <br />
                <br />
                Usuario:&nbsp;&nbsp; <asp:TextBox ID="txtUsuario" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <br />
                Clave:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtClve" runat="server"></asp:TextBox>
                <br />
                <br />
                Tipo usuario: <asp:DropDownList ID="drdTipoUsuario" runat="server" CssClass="auto-style1" DataSourceID="SqlTipoUsuario" DataTextField="Descripcion" DataValueField="id" Width="137px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlTipoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:presupuestoConnectionString %>" SelectCommand="SELECT * FROM [tipoUsuario]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Button class="btn-navbar" ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click"/>
                &nbsp;&nbsp;&nbsp;
            </div>

    </form>
</body>
</html>
