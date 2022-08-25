using System.Data;
using System.Data.SqlClient;

namespace presupuesto_RoyDuran
{
    public class ClsUsuario
    {
        private static string email { get; set; }
        private static string idusuario { get; set; }
        private static int tipousuario { get; set; }
        private static string clave { get; set; }
        private static string respuesta { get; set; }

        public ClsUsuario() { }

        public ClsUsuario(string mail, string iduser, int tipouser, string clav)
        {
            email = mail;
            idusuario = iduser;
            tipousuario = tipouser;
            clave = clav;
        }

        public static string GetEmail() { return email; }
        public static string GetIdusuario() { return idusuario; }
        public static int GetTipousuario() { return tipousuario; }
        public static string GetClave() { return clave; }
        public static string GetRespuesta() { return respuesta; }


        public static void SetEmail(string mail)
        {
            email = mail;
        }

        public static void SetIdusuario(string Iduser)
        {
            idusuario = Iduser;
        }

        public static void SetTipousuario(int Tipouser)
        {
            tipousuario = Tipouser;
        }

        public static void SetClave(string clav)
        {
            clave = clav;
        }

        public static void insertarUsuario(string nombre, string clave, int tipo)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["ExamenFinalConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            SqlCommand comando = new SqlCommand("insertarUsuario", conexion)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            conexion.Open();
            comando.Parameters.Add("@nombreUsuario", SqlDbType.VarChar, 50).Value = nombre;
            comando.Parameters.Add("@tipoUsuario", SqlDbType.Int).Value = tipo;
            comando.Parameters.Add("@claveUsuario", SqlDbType.VarChar, 50).Value = clave;
            comando.ExecuteNonQuery();
            conexion.Close();

        }

        public static int validarUsuario(string nombre, string clave)
        {
            //int tipoUsuario = 0;
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["presupuestoConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            SqlCommand comando = new SqlCommand("obtUsuario", conexion)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            conexion.Open();
            comando.Parameters.Add("@nombreUsuario", SqlDbType.VarChar, 50).Value = nombre;
            comando.Parameters.Add("@claveUsuario", SqlDbType.VarChar, 50).Value = clave;
            SqlDataReader registro = comando.ExecuteReader();

            if (registro.Read())
            {
                tipousuario = int.Parse(registro[2].ToString());

            }
            conexion.Close();
            return tipousuario;
        }

    }
}