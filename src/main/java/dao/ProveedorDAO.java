package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Proveedor;
import utilidades.Conexion;
public class ProveedorDAO {
    public ProveedorDAO() {
    }
    public int createProveedor(String empresa, String telefono, String ruc, String direccion, String email) {
        if (ruc.length() != 11 || !ruc.matches("\\d{11}")) {
            System.out.println("Ruc inválido. Asegúrate de que el RUC tenga 11 dígitos.");
            return 0;
        }
        if (empresa == null || empresa.trim().isEmpty()
                || telefono == null || telefono.trim().isEmpty()
                || ruc == null || direccion == null || direccion.trim().isEmpty()
                || email == null || email.trim().isEmpty()) {
            System.out.println("Datos inválidos. Asegúrate de que todos los campos estén completos y correctos.");
            return 0;
        }
        int filasInsertadas = 0;
        String query = "INSERT INTO Proveedores (empresa, telefono, direccion, correo, ruc, usuarioCreador, usuarioModificador) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?);";
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, empresa);
            sentencia.setString(2, telefono);
            sentencia.setString(3, direccion);
            sentencia.setString(4, email);
            sentencia.setString(5, ruc);
            sentencia.setInt(6, 1); // usuarioCreador (ej. id de usuario actual)
            sentencia.setInt(7, 1); // usuarioModificador (ej. id de usuario actual)
            filasInsertadas = sentencia.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en createProveedor: " + e.getMessage());
        }
        return filasInsertadas;
    }
    public int editProveedor(String id, String empresa, String encargado,
            String ruc, String direccion, String email) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "UPDATE proveedores SET empresa=?, encargado=?, ruc=?, direccion=?, email=? WHERE id=? ";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, empresa);
            sentencia.setString(2, encargado);
            sentencia.setString(3, ruc);
            sentencia.setString(4, direccion);
            sentencia.setString(5, email);
            sentencia.setString(6, id);
            int filasActualizadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editUser: " + e.getMessage());
            return 0;
        }
    }
    public int deleteProveedor(String id) {
        System.out.println("Iniciando eliminación del proveedor con ID: " + id);
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "DELETE FROM proveedores WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            int filasEliminadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            if (filasEliminadas > 0) {
                System.out.println("Proveedor con ID: " + id + " eliminado exitosamente.");
                return 1;
            } else {
                System.out.println("No se encontró un proveedor con ID: " + id + " para eliminar.");
                return 0;
            }
        } catch (SQLException e) {
            System.err.println("Error en deleteProveedor con ID: " + id);
            System.err.println("Mensaje de error: " + e.getMessage());
            return 0;
        }
    }
    public List<Proveedor> getProveedores() {
        List<Proveedor> lista = new ArrayList<>();
        String query = "SELECT * FROM Proveedores";
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            System.out.println(String.format("%-10s %-25s %-30s %-15s %-30s %-15s",
                    "ID", "Empresa", "Correo", "RUC", "Dirección", "Teléfono"));
            System.out.println("-------------------------------------------------------------------------------"
                    + "---------------------------------------------");
            while (resultado.next()) {
                Proveedor prov = new Proveedor();
                prov.setId(resultado.getLong("id"));
                prov.setEmpresa(resultado.getString("empresa"));
                prov.setCorreo(resultado.getString("correo"));
                prov.setRuc(resultado.getString("ruc"));
                prov.setDireccion(resultado.getString("direccion"));
                prov.setTelefono(resultado.getString("telefono"));
                System.out.println(String.format("%-10d %-25s %-30s %-15s %-30s %-15s",
                        prov.getId(),
                        prov.getEmpresa(),
                        prov.getCorreo(),
                        prov.getRuc(),
                        prov.getDireccion(),
                        prov.getTelefono()));
                lista.add(prov);
            }
        } catch (SQLException e) {
            System.err.println("Error en getProveedores: " + e.getMessage());
        }
        return lista;
    }
    public Proveedor getProveedorById(String id) {
        System.out.println("Iniciando búsqueda del proveedor con ID: " + id);
        if (id == null || id.trim().isEmpty()) {
            System.err.println("El ID proporcionado es nulo o vacío.");
            return null;
        }
        Proveedor pv = null;
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            PreparedStatement sentencia = cnx.prepareStatement("SELECT * FROM Proveedores WHERE id=?");
            sentencia.setString(1, id);
            System.out.println("Ejecutando consulta con ID: " + id);
            try (ResultSet resultado = sentencia.executeQuery()) {
                if (resultado.next()) {
                    pv = new Proveedor();
                    pv.setId(resultado.getLong("id"));
                    pv.setEmpresa(resultado.getString("empresa"));
                    pv.setRuc(resultado.getString("ruc"));
                    pv.setTelefono(resultado.getString("telefono"));
                    pv.setCorreo(resultado.getString("correo"));
                    pv.setDireccion(resultado.getString("direccion"));
                    System.out.println("Proveedor encontrado:");
                    System.out.println(String.format("%-15s %-30s", "Campo", "Valor"));
                    System.out.println("--------------------------------------------------");
                    System.out.println(String.format("%-15s %-30s", "ID:", pv.getId()));
                    System.out.println(String.format("%-15s %-30s", "Empresa:", pv.getEmpresa()));
                    System.out.println(String.format("%-15s %-30s", "RUC:", pv.getRuc()));
                    System.out.println(String.format("%-15s %-30s", "Teléfono:", pv.getTelefono()));
                    System.out.println(String.format("%-15s %-30s", "Correo:", pv.getCorreo()));
                    System.out.println(String.format("%-15s %-30s", "Dirección:", pv.getDireccion()));
                } else {
                    System.out.println("No se encontró un proveedor con ID: " + id);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error en getProveedorById con ID: " + id);
            System.err.println("Mensaje de error: " + e.getMessage());
        }
        return pv;
    }
    public Proveedor getProveedorByRuc(String ruc) {
        if (ruc == null || ruc.length() != 11 || !ruc.matches("\\d{11}")) {
            System.out.println("RUC inválido. Debe tener exactamente 11 dígitos.");
            return null;
        }
        Proveedor pv = null;
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM Proveedores WHERE ruc=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, ruc);
            ResultSet resultado = sentencia.executeQuery();
            if (resultado.next()) {
                pv = new Proveedor();
                pv.setId(resultado.getLong("id"));
                pv.setEmpresa(resultado.getString("empresa"));
                pv.setRuc(resultado.getString("ruc"));
                pv.setTelefono(resultado.getString("telefono"));
                pv.setCorreo(resultado.getString("correo"));
                pv.setDireccion(resultado.getString("direccion"));
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getProveedorByRuc: " + e.getMessage());
        }
        return pv;
    }
}
