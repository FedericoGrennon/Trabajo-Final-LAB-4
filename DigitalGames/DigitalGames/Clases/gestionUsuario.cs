﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DigitalGames
{
    public class gestionUsuario
    {
        AccesoDatos ds = new AccesoDatos();

        public int AgregarUsuario(Usuarios us)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarUsuario(ref comando, us);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spInsertarUsuario");
        }

        private void ArmarParametrosAgregarUsuario(ref SqlCommand Comando, Usuarios us)
        {
            Comando.Parameters.Add("@NombreUsuario", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@Administrador", SqlDbType.Bit);
            Comando.Parameters.Add("@Contraseña", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@Mail", SqlDbType.NVarChar, 100);
            Comando.Parameters.Add("@Nombre", SqlDbType.NVarChar, 100);
            Comando.Parameters.Add("@Apellido", SqlDbType.NVarChar, 100);
            Comando.Parameters.Add("@FechaNacimiento", SqlDbType.SmallDateTime);
            Comando.Parameters.Add("@Pais", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@Provincia", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@Localidad", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@Telefono", SqlDbType.NVarChar, 50);
            Comando.Parameters.Add("@Estado", SqlDbType.Bit);

            Comando.Parameters["@NombreUsuario"].Value = us.nombreUsuario;
            Comando.Parameters["@Administrador"].Value = 0;
            Comando.Parameters["@Contraseña"].Value = us.contraseña;
            Comando.Parameters["@Mail"].Value = us.mail;
            Comando.Parameters["@Nombre"].Value = us.nombre;
            Comando.Parameters["@Apellido"].Value = us.apellido;
            Comando.Parameters["@FechaNacimiento"].Value = us.fechaNacimiento;
            Comando.Parameters["@Pais"].Value = us.pais;
            Comando.Parameters["@Provincia"].Value = us.provincia;
            Comando.Parameters["@Localidad"].Value = us.localidad;
            Comando.Parameters["@Telefono"].Value = us.telefono;
            Comando.Parameters["@Estado"].Value = 1;
        }
    }
}