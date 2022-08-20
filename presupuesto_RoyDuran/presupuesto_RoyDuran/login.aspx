<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="presupuesto_RoyDuran.login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h1>Ingreso usuarios</h1>
            <div class="div div-login">
            <h1>Login</h1>
                Email:&nbsp;
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Enabled="False" ErrorMessage="El campo no puede estar vacio" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                <br />
                <br />
            <asp:Label  ID="Label2" runat="server" Text="Clave"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox type="password" ID="txtClave" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Enabled="False" ErrorMessage="El campo no puede estar vacio" Font-Bold="True" ForeColor="#FF3300" Visible="False"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button class="btn" ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click"/>
            </div>
            
    </form>
    <footer>Desarrollo Web Profesional &copy soporte@dewep.co.cr</footer>
</body>
</html>
