using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace presupuesto_RoyDuran.Clases
{
    public class ClsPersona
    {
        public static void registrarPersonaUsuario(string ced, string nom, string Apellido1, string Apellido2, string emailPersona, string Direccion, string Telefono, string email, string clave, int tipo_usuario)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["presupuestoConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            SqlCommand comando = new SqlCommand("registrarPersonaUsuario", conexion)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            conexion.Open();
            comando.Parameters.Add("@Cedula", SqlDbType.VarChar, 20).Value = ced;
            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50).Value = nom;
            comando.Parameters.Add("@Apellido1", SqlDbType.VarChar, 50).Value = Apellido1;
            comando.Parameters.Add("@Apellido2", SqlDbType.VarChar, 50).Value = Apellido2;
            comando.Parameters.Add("@emailPersona", SqlDbType.VarChar, 20).Value = emailPersona;
            comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 100).Value = Direccion;
            comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20).Value = Telefono;
            comando.Parameters.Add("@email", SqlDbType.VarChar, 20).Value = email;
            comando.Parameters.Add("@clave", SqlDbType.VarChar, 30).Value = clave;
            comando.Parameters.Add("@tipo_usuario", SqlDbType.Int).Value = tipo_usuario;
            comando.ExecuteNonQuery();
            conexion.Close();

        }
    }
}