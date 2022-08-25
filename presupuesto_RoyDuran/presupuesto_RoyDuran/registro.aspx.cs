using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presupuesto_RoyDuran
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsuario.Text = txtMail.Text;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Clases.ClsPersona.registrarPersonaUsuario(txtCedula.Text,txtNombre.Text,txtApellido1.Text,txtApellido2.Text,txtDireccion.Text,txtTelefono.Text,txtMail.Text,txtMail.Text,txtClve.Text,drdTipoUsuario.SelectedItem.Value);
            Response.Redirect("login1.aspx");
        }
    }
}