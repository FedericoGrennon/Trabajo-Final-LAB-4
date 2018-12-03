using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace DigitalGames
{
    public class ClaseCarrito
    {
        public DataTable crearTablaEnCarrito()
        {
            DataTable tabla = new DataTable();
            DataColumn columna = new DataColumn("codJuego", Type.GetType("System.String"));
            tabla.Columns.Add(columna);
            columna = new DataColumn("nombre", Type.GetType("System.String"));
            tabla.Columns.Add(columna);
            columna = new DataColumn("cantidad", Type.GetType("System.Int32"));
            tabla.Columns.Add(columna);
            columna = new DataColumn("precio", Type.GetType("System.Decimal"));
            tabla.Columns.Add(columna);

            return tabla;
        }

        public void AgregarFilaCarrito(DataTable tabla, string codJuego, string nombre, int cantidad, decimal precio)
        {
            DataRow dr = tabla.NewRow();
            dr["codJuego"] = codJuego;
            dr["nombre"] = nombre;
            dr["cantidad"] = cantidad;
            dr["precio"] = precio;
            tabla.Rows.Add(dr);
        }

        public void ModificarFilaCarrito(DataTable tabla, int pos, int cantidad)
        {
            tabla.Rows[pos][2] = (int)tabla.Rows[pos][2] + cantidad;
        }

        public void EliminarFilaCarrito(DataTable tabla, int pos)
        {
            tabla.Rows[pos].Delete();
        }
    }
}