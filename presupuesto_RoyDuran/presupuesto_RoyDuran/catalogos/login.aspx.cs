using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presupuesto_RoyDuran
{
    public partial class login : System.Web.UI.Page
    {
        ClsUsuario usuario = new ClsUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["presupuestoConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select email,clave, from usuario where email = '" + txtNombre.Text + "' and clave = '" + txtClave.Text +"'", conexion);
                                               
            SqlDataReader registro = comando.ExecuteReader();

            if (registro.Read())
            {
                if (ClsUsuario.GetTipousuario().Equals(1))
                {
                    Response.Redirect("inicio.aspx");
                }
                else
                {
                    Response.Redirect("incioRegular.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Usuario o clave incorrectos');</script>");
            }
            conexion.Close();
        }
    }
}