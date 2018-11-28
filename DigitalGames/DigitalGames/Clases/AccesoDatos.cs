using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace DigitalGames
{
    public class AccesoDatos
    {
        String rutaBDDigitalGames =
      "Data Source=localhost\\sqlexpress;Initial Catalog=DigitalGames;Integrated Security=True";

        private SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(rutaBDDigitalGames);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(String NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(Sql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        public bool obtenerCantidad(string consulta, ref int valorAGuardar)
        {
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            conexion.ConnectionString = rutaBDDigitalGames;

            try
            {
                comando.Connection = conexion;

                comando.CommandText = consulta;

                conexion.Open();
                comando.Parameters.Clear();

                SqlDataReader data = comando.ExecuteReader();

                if (data.Read())
                {
                    valorAGuardar = data.GetInt32(0);
                    data.Close();
                    conexion.Dispose();
                }
                else
                {
                    data.Close();
                    conexion.Dispose();
                }

                return true;
            }
            catch (SqlException ex)
            {
            }

            conexion.Close();
            conexion.Dispose();

            return false;
        }

        public void EliminarTarjeta(string numeroTarjeta)
        {
            SqlConnection sqlconect = new SqlConnection();

            sqlconect = ObtenerConexion();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "DELETE FROM Tarjetas WHERE NumeroTarjeta = '" + numeroTarjeta + "'";
            cmd.Connection = sqlconect;

            cmd.ExecuteNonQuery();
            sqlconect.Close();
        }

        public void darBajaUsuario(string nombreUsuario)
        {
            SqlConnection sqlconect = new SqlConnection();

            sqlconect = ObtenerConexion();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE usuarios set estado = 'false' WHERE NombreUsuario = '" + nombreUsuario + "'";
            cmd.Connection = sqlconect;

            cmd.ExecuteNonQuery();
            sqlconect.Close();
        }
    }
}