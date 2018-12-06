using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DigitalGames
{
    public class FuncionesCompra
    {
        AccesoDatos ds = new AccesoDatos();

        public int AgregarTarjeta(Tarjeta tar)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarTarjeta(ref comando, tar);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarTarjeta");
        }

        private void ArmarParametrosAgregarTarjeta(ref SqlCommand Comando, Tarjeta tar)
        {
            Comando.Parameters.Add("@NumeroTarjeta", SqlDbType.NVarChar, 25);
            Comando.Parameters.Add("@NombreUsuario", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@FechaVencimiento", SqlDbType.SmallDateTime);
            Comando.Parameters.Add("@NombreTitular", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@DNI", SqlDbType.NVarChar, 15);
            Comando.Parameters.Add("@Banco", SqlDbType.NVarChar, 50);


            Comando.Parameters["@NumeroTarjeta"].Value = tar.NumeroTarjeta;
            Comando.Parameters["@NombreUsuario"].Value = tar.NombreUsuario;
            Comando.Parameters["@FechaVencimiento"].Value = tar.fechaVencimiento;
            Comando.Parameters["@NombreTitular"].Value = tar.NombreTitular;
            Comando.Parameters["@DNI"].Value = tar.DNI;
            Comando.Parameters["@Banco"].Value = tar.banco;
        }

        public int AgregarVenta(Venta ven)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarVenta(ref comando, ven);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarVenta");
        }

        private void ArmarParametrosAgregarVenta(ref SqlCommand Comando, Venta ven)
        {
            Comando.Parameters.Add("@CodVenta", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@NombreUsuario", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@FechaCompra", SqlDbType.SmallDateTime);
            Comando.Parameters.Add("@Precio", SqlDbType.SmallMoney);
            Comando.Parameters.Add("@NumeroTarjeta", SqlDbType.NVarChar, 25);


            Comando.Parameters["@CodVenta"].Value = ven.CodVenta;
            Comando.Parameters["@NombreUsuario"].Value = ven.NombreUsuario;
            Comando.Parameters["@FechaCompra"].Value = ven.fechaCompra;
            Comando.Parameters["@Precio"].Value = ven.Precio;
            Comando.Parameters["@NumeroTarjeta"].Value = ven.numeroTarjeta;
        }

        public int AgregarDetalleVenta(DetalleVenta dVen)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarDetalleVenta(ref comando, dVen);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarDetalleVenta");
        }

        private void ArmarParametrosAgregarDetalleVenta(ref SqlCommand Comando, DetalleVenta dVen)
        {
            Comando.Parameters.Add("@CodVenta", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@CodJuego", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@Cantidad", SqlDbType.Int);
            Comando.Parameters.Add("@PrecioUnitario", SqlDbType.SmallMoney);
            Comando.Parameters.Add("@Porcentaje", SqlDbType.Int);


            Comando.Parameters["@CodVenta"].Value = dVen.CodVenta;
            Comando.Parameters["@CodJuego"].Value = dVen.CodJuego;
            Comando.Parameters["@Cantidad"].Value = dVen.cantidad;
            Comando.Parameters["@PrecioUnitario"].Value = dVen.PrecioUnitario;
            Comando.Parameters["@Porcentaje"].Value = dVen.porcentaje;
        }

        public int AgregarCodActivacionVendidos(string codVenta, string codJuego, string CodActivacion)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarCodActivacionVendidos(ref comando, codVenta, codJuego, CodActivacion);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarCodActivacionVendidos");
        }

        private void ArmarParametrosAgregarCodActivacionVendidos(ref SqlCommand Comando, string codVenta, string codJuego, string CodActivacion)
        {
            Comando.Parameters.Add("@CodVenta", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@CodJuego", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@CodActivacion", SqlDbType.NVarChar, 20);


            Comando.Parameters["@CodVenta"].Value = codVenta;
            Comando.Parameters["@CodJuego"].Value = codJuego;
            Comando.Parameters["@CodActivacion"].Value = CodActivacion;
        }

        public void darBajaCodActivacion(string codActivacion, string codJuego)
        {
            SqlConnection sqlconect = new SqlConnection();

            sqlconect = ds.ObtenerConexion();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE CodigosActivacion set Disponibilidad = 'false' WHERE codActivacion = '" + codActivacion + "' AND codJuego = '" + codJuego + "'";
            cmd.Connection = sqlconect;

            cmd.ExecuteNonQuery();
            sqlconect.Close();
        }

        public void actualizarStock(string codJuego, int cantidad)
        {
            SqlConnection sqlconect = new SqlConnection();

            sqlconect = ds.ObtenerConexion();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE Juegos set Stock = '" + cantidad + "' WHERE codJuego = '" + codJuego + "'";
            cmd.Connection = sqlconect;

            cmd.ExecuteNonQuery();
            sqlconect.Close();
        }

        public bool verifificarTarjeta(string numeroTarjeta, string usuario)
        {
            AccesoDatos ds = new AccesoDatos();
            DataTable dt = new DataTable();

            dt = ds.ObtenerTabla("Tarjetas", "SELECT NumeroTarjeta FROM Tarjetas WHERE NombreUsuario = '" + usuario + "' AND NumeroTarjeta = '" + numeroTarjeta + "'");

            if(dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}