using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace DigitalGames
{
    public class funcionesJuegos
    {
        AccesoDatos ds = new AccesoDatos();

        public int AgregarJuego(ClaseJuego jue)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarJuego(ref comando, jue);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarJuego");
        }

        private void ArmarParametrosAgregarJuego(ref SqlCommand Comando, ClaseJuego jue)
        {
            Comando.Parameters.Add("@CODJUEGO", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 100);
            Comando.Parameters.Add("@EMPRESA", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@TIPO", SqlDbType.NVarChar, 15);
            Comando.Parameters.Add("@PRECIO", SqlDbType.SmallMoney);
            Comando.Parameters.Add("@STOCK", SqlDbType.Int);
            Comando.Parameters.Add("@CONSOLA", SqlDbType.NVarChar, 15);
            Comando.Parameters.Add("@DESCRIPCION", SqlDbType.NVarChar, 500);
            Comando.Parameters.Add("@REQUISITOS", SqlDbType.NVarChar, 200);


            Comando.Parameters["@CODJUEGO"].Value = jue.codJuego;
            Comando.Parameters["@NOMBRE"].Value = jue.nombre;
            Comando.Parameters["@EMPRESA"].Value = jue.empresa;
            Comando.Parameters["@TIPO"].Value = jue.tipo;
            Comando.Parameters["@PRECIO"].Value = jue.precio;
            Comando.Parameters["@STOCK"].Value = jue.stock;
            Comando.Parameters["@CONSOLA"].Value = jue.consola;
            Comando.Parameters["@DESCRIPCION"].Value = jue.descripcion;
            Comando.Parameters["@REQUISITOS"].Value = jue.requisitos;
        }

        public int AgregarCodActivacion(string codActivacion, string codJuego)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarCodigo(ref comando, codActivacion, codJuego);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarCodigosActivacion");
        }

        private void ArmarParametrosAgregarCodigo(ref SqlCommand Comando, string codActivacion, string codJuego)
        {
            Comando.Parameters.Add("@CodActivacion", SqlDbType.NVarChar, 20);
            Comando.Parameters.Add("@CodJuego", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@Disponibilidad", SqlDbType.Bit);


            Comando.Parameters["@CodActivacion"].Value = codActivacion;
            Comando.Parameters["@CodJuego"].Value = codJuego;
            Comando.Parameters["@Disponibilidad"].Value = 1;
        }

        public int AgregarDescuento(Descuento desc)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarDescuento(ref comando, desc);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarDescuento");
        }

        private void ArmarParametrosAgregarDescuento(ref SqlCommand Comando, Descuento desc)
        {
            Comando.Parameters.Add("@CODDESCUENTO", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@CODJUEGO", SqlDbType.NVarChar, 10);
            Comando.Parameters.Add("@PORCENTAJE", SqlDbType.Int);
            Comando.Parameters.Add("@FECHAINICIO", SqlDbType.NVarChar, 15);
            Comando.Parameters.Add("@FECHAFIN", SqlDbType.NVarChar, 15);
            Comando.Parameters.Add("@ESTADO", SqlDbType.Bit);

            Comando.Parameters["@CODDESCUENTO"].Value = desc.codDescuento;
            Comando.Parameters["@CODJUEGO"].Value = desc.codJuego;
            Comando.Parameters["@PORCENTAJE"].Value = desc.porcentaje;
            Comando.Parameters["@FECHAINICIO"].Value = desc.fechaInicio;
            Comando.Parameters["@FECHAFIN"].Value = desc.fechaFin;
            Comando.Parameters["@ESTADO"].Value = desc.estado;
        }
    }
}