using System;
using System.Data;
using System.Data.SqlClient;

namespace presupuesto_RoyDuran.catalogos
{
    public partial class usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlPrsupuesto.Insert();
                limpiarCampos();
            }
            catch (Exception)
            {

                Response.Write("<script>alert('El E-Mail ya existe en la base de datos');</script>");
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlPrsupuesto.Delete();
            limpiarCampos();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlPrsupuesto.Update();
            limpiarCampos();
        }

        protected void limpiarCampos()
        {
            txtClave.Text = "";
            txtMail.Text = "";
            txtIdpersona.Text = "";
        }

        protected void drdTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["presupuestoConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            SqlCommand comando = new SqlCommand("validarUsuario", conexion)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            conexion.Open();
            SqlDataAdapter da = new SqlDataAdapter(comando);
            DataSet ds = new DataSet();
            da.Fill(ds);

            drdTipoUsuario.DataSource = ds;
            drdTipoUsuario.DataSource = "Descripcion";
            drdTipoUsuario.DataSource = "id";
        }
    }
}