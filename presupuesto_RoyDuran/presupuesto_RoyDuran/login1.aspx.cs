using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presupuesto_RoyDuran
{
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["presupuestoConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            SqlCommand comando = new SqlCommand("validarUsuario", conexion)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            conexion.Open();
            comando.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = txtNombre.Text;
            comando.Parameters.Add("@clave", SqlDbType.VarChar, 50).Value = txtClave.Text;
            SqlDataReader registro = comando.ExecuteReader();

            if (registro.Read())
            {
                if (registro[1].Equals(1))
                {
                    Response.Redirect("inicio.aspx");
                }
                else if (registro[1].Equals(2))
                {
                    Response.Redirect("inicioRegular.aspx");
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