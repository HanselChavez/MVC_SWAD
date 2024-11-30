package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Compra;
import model.Comprobante;
import model.Proveedor;
import model.TipoComprobante;
import model.Usuario;
import utilidades.Conexion;
public class CompraDAO {
    public CompraDAO() {
    }
    public List<Compra> getCompras() {
        List<Compra> list = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "    co.id AS idCompra,\n"
                    + "    co.fecha AS fechaCompra,\n"
                    + "    co.horaCompra,\n"
                    + "    co.total AS totalCompra,\n"
                    + "    p.id AS idProveedor,\n"
                    + "    p.empresa,\n"
                    + "    p.telefono as telefonoProveedor,\n"
                    + "    p.direccion AS direccionProveedor,\n"
                    + "    p.correo AS correoProveedor,\n"
                    + "    p.ruc,\n"
                    + "    e.id AS idEmpleado,\n"
                    + "    e.nombres AS nombresEmpleado,\n"
                    + "    e.apePaterno AS apePaternoEmpleado,\n"
                    + "    e.apeMaterno AS apeMaternoEmpleado,\n"
                    + "    e.dni AS dniEmpleado,\n"
                    + "    e.telefono AS telefonoEmpleado,\n"
                    + "    e.correo AS correoEmpleado,\n"
                    + "    comp.id AS idComprobante,\n"
                    + "    comp.monto AS montoComprobante,\n"
                    + "    comp.fecha AS fechaComprobante,\n"
                    + "    tc.id AS tipoComprobanteID,\n"
                    + "    tc.nombre AS tipoComprobante\n"
                    + "\n"
                    + "FROM \n"
                    + "    Compras co\n"
                    + "JOIN \n"
                    + "    Proveedores p ON co.idProveedor = p.id\n"
                    + "JOIN \n"
                    + "    Empleados e ON co.idEmpleado = e.id\n"
                    + "LEFT JOIN \n"
                    + "    Comprobante comp ON co.idComprobante = comp.id\n"
                    + "LEFT JOIN \n"
                    + "    TipoComprobante tc ON comp.idTipoComprobante = tc.id;";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                Compra co = new Compra();
                co.setId(resultado.getLong("idCompra"));
                co.setFecha(resultado.getDate("fechaCompra"));
                co.setHora(resultado.getTime("horaCompra"));
                co.setTotal(resultado.getDouble("totalCompra"));
                Proveedor pv = new Proveedor();
                pv.setId(resultado.getLong("idProveedor"));
                pv.setEmpresa(resultado.getString("empresa"));
                pv.setRuc(resultado.getString("ruc"));
                pv.setCorreo(resultado.getString("correoProveedor"));
                pv.setTelefono(resultado.getString("telefonoProveedor"));
                pv.setDireccion(resultado.getString("direccionProveedor"));
                co.setProveedor(pv);
                Usuario emp = new Usuario();
                emp.setId(resultado.getLong("idEmpleado"));
                emp.setDni(resultado.getString("dniEmpleado"));
                emp.setNombres(resultado.getString("nombresEmpleado"));
                emp.setApePaterno(resultado.getString("apePaternoEmpleado"));
                emp.setApeMaterno(resultado.getString("apeMaternoEmpleado"));
                emp.setTelefono(resultado.getString("telefonoEmpleado"));
                emp.setCorreo(resultado.getString("correoEmpleado"));
                co.setComprador(emp);
                TipoComprobante tc = new TipoComprobante();
                tc.setId(resultado.getLong("tipoComprobanteID"));
                tc.setNombre(resultado.getString("tipoComprobante"));
                Comprobante com = new Comprobante();
                com.setId(resultado.getLong("idComprobante"));
                com.setTipo(tc);
                co.setComprobante(com);
                list.add(co);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getVentas: " + e.getMessage());
        }
        return list;
    }
}
