package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import model.Comprobante;
import model.MetodoPago;
import model.Usuario;
import model.Venta;
import utilidades.Conexion;
public class VentasDAO {
    public VentasDAO() {
    }
     public List<Venta> getVentas() {
        List<Venta> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "    v.id AS idVenta,\n"
                    + "    v.fecha AS fechaVenta,\n"
                    + "    v.horaVenta AS horaVenta,\n"
                    + "    v.impuesto AS impuestoVenta,\n"
                    + "    v.total AS totalVenta,\n"
                    + "    v.descuento AS descuentoVenta,"
                    + "    c.id AS idCliente,\n"
                    + "    c.nombres AS nombresCliente,\n"
                    + "    c.apePaterno AS apePaternoCliente,\n"
                    + "    c.apeMaterno AS apeMaternoCliente,\n"
                    + "    c.dni AS dniCliente,\n"
                    + "    c.telefono AS telefonoCliente,\n"
                    + "    c.correo AS correoCliente,\n"
                    + "    e.id AS idEmpleado,\n"
                    + "    e.nombres AS nombresEmpleado,\n"
                    + "    e.apePaterno AS apePaternoEmpleado,\n"
                    + "    e.apeMaterno AS apeMaternoEmpleado,\n"
                    + "    e.dni AS dniEmpleado,\n"
                    + "    e.telefono AS telefonoEmpleado,\n"
                    + "    e.correo AS correoEmpleado,\n"
                    + "    mp.nombre AS nombreMetodoPago,"
                    + "    mp.id as idMetodoPago,\n"
                    + "    mp.descripcion AS descripcionMetodoPago,\n"
                    + "    comp.id AS idComprobante,\n"
                    + "    comp.monto AS montoComprobante,\n"
                    + "    comp.fecha AS fechaComprobante,\n"
                    + "    tc.nombre AS tipoComprobante\n"
                    + "\n"
                    + "FROM \n"
                    + "    Ventas v\n"
                    + "JOIN \n"
                    + "    Clientes c ON v.idCliente = c.id\n"
                    + "JOIN \n"
                    + "    Empleados e ON v.idEmpleado = e.id\n"
                    + "JOIN \n"
                    + "    MetodoPago mp ON v.idMetodoPago = mp.id\n"
                    + "LEFT JOIN \n"
                    + "    Comprobante comp ON v.idComprobante = comp.id\n"
                    + "LEFT JOIN \n"
                    + "    TipoComprobante tc ON comp.idTipoComprobante = tc.id;";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                Venta vt = new Venta();
                vt.setId(resultado.getLong("idVenta"));
                vt.setFecha(resultado.getDate("fechaVenta"));
                vt.setHora(resultado.getTime("horaVenta"));
                vt.setImpuesto(resultado.getDouble("impuestoVenta"));
                vt.setTotal(resultado.getDouble("totalVenta"));
                vt.setDescuento(resultado.getDouble("descuentoVenta"));
                Cliente cl = new Cliente();
                cl.setId(resultado.getLong("idCliente"));
                cl.setNombre(resultado.getString("nombresCliente"));
                cl.setApellPaterno(resultado.getString("apePaternoCliente"));
                cl.setApellMaterno(resultado.getString("apeMaternoCliente"));
                cl.setCorreo(resultado.getString("correoCliente"));
                cl.setTelefono(resultado.getString("telefonoCliente"));
                cl.setDni(resultado.getString("dniCliente"));
                vt.setCliente(cl);
                Usuario emp = new Usuario();
                emp.setId(resultado.getLong("idEmpleado"));
                emp.setDni(resultado.getString("dniEmpleado"));
                emp.setNombres(resultado.getString("nombresEmpleado"));
                emp.setApePaterno(resultado.getString("apePaternoEmpleado"));
                emp.setApeMaterno(resultado.getString("apeMaternoEmpleado"));
                emp.setTelefono(resultado.getString("telefonoEmpleado"));
                emp.setCorreo(resultado.getString("correoEmpleado"));
                vt.setEmpleado(emp);
                MetodoPago mp = new MetodoPago();
                mp.setId(resultado.getLong("idMetodoPago"));
                mp.setNombre(resultado.getString("nombreMetodoPago"));
                mp.setDescripcion(resultado.getString("descripcionMetodoPago"));
                vt.setMetodoPago(mp);
                Comprobante com = new Comprobante();
                com.setId(resultado.getLong("idComprobante"));
                vt.setComprobante(com);
                lista.add(vt);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getVentas: " + e.getMessage());
        }
        return lista;
    }
}
