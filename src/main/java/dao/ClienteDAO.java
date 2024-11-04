package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import model.Cliente;
import org.mindrot.jbcrypt.BCrypt;
import utilidades.Conexion;
public class ClienteDAO {
    public ClienteDAO() {
    }
    public int createCliente(String dni, String nombres, String correo, String contra,
            String apePaterno, String apeMaterno, String telefono,
            int usuCreador) {
        if (dni == null || dni.trim().isEmpty()
                || nombres == null || nombres.trim().isEmpty()
                || correo == null || correo.trim().isEmpty()
                || contra == null || contra.trim().isEmpty()
                || apePaterno == null || apePaterno.trim().isEmpty()
                || apeMaterno == null || apeMaterno.trim().isEmpty()
                || telefono == null || telefono.trim().isEmpty()) {
            System.out.println("Error: Todos los campos deben ser completados.");
            return 0;
        }
        if (dni.length() != 8 || !dni.matches("\\d{8}")) {
            System.out.println("Error: El DNI debe tener exactamente 8 dígitos.");
            return 0;
        }
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        if (!Pattern.matches(emailRegex, correo)) {
            System.out.println("Error: Correo electrónico no válido.");
            return 0;
        }
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        if (!Pattern.matches(passwordRegex, contra)) {
            System.out.println(
                    "Error: La contraseña debe tener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.");
            return 0;
        }
        if (telefono.length() != 9 || !telefono.matches("\\d{9}")) {
            System.out.println("Error: El teléfono debe tener exactamente 9 dígitos.");
            return 0;
        }
        String hashedPassword = BCrypt.hashpw(contra, BCrypt.gensalt());
        Connection cnx = null;
        PreparedStatement insertStmt = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;
        int filasInsertadas = 0;
        try {
            Conexion c = new Conexion();
            cnx = c.conecta();
            String querySelect = "SELECT 'Clientes' AS tabla, id, correo \n"
                    + "FROM BDCamas.Clientes \n"
                    + "WHERE correo = ? \n"
                    + "UNION\n"
                    + "SELECT 'Empleados' AS tabla, id, correo \n"
                    + "FROM BDCamas.Empleados \n"
                    + "WHERE correo = ? ;";
            selectStmt = cnx.prepareStatement(querySelect);
            selectStmt.setString(1, correo);
            selectStmt.setString(2, correo);
            ResultSet rsSelectExistente = selectStmt.executeQuery();
            if (rsSelectExistente.next()) {
                return -1;
            }
            System.out.println("VERIFICADO EN TABLA CLIENTE Y EMPLEADOS");
            // Prepara la consulta de inserción
            String insertQuery = "INSERT INTO BDCamas.Clientes (nombres, apePaterno,apeMaterno, dni,contra, correo, usuarioCreador, usuarioModificador,telefono) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
            insertStmt = cnx.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            insertStmt.setString(1, nombres);
            insertStmt.setString(2, apePaterno);
            insertStmt.setString(3, apeMaterno);
            insertStmt.setString(4, dni);
            insertStmt.setString(5, hashedPassword);
            insertStmt.setString(6, correo);
            insertStmt.setInt(7, usuCreador);
            insertStmt.setInt(8, 1);
            insertStmt.setString(9, telefono);
            filasInsertadas = insertStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en crearCliente: " + e.getMessage());
            return 0;
        } finally {
            try {
                if (insertStmt != null) {
                    insertStmt.close();
                }
                if (selectStmt != null) {
                    selectStmt.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (cnx != null) {
                    cnx.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return filasInsertadas;
    }
    public int editCliente(String id, String cl_nombre, String cl_paterno,
            String cl_materno, String cl_telf, String cl_direc, String cl_dni, String contra) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "UPDATE clientes set nombres=?, apePaterno=?, apeMaterno=?, telefono=?, correo=?, dni=? ,usuarioCreador='1',usuarioModificador='2',contra=? WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            String hashedPassword = BCrypt.hashpw(contra, BCrypt.gensalt());
            sentencia.setString(1, cl_nombre);
            sentencia.setString(2, cl_paterno);
            sentencia.setString(3, cl_materno);
            sentencia.setString(4, cl_telf);
            sentencia.setString(5, cl_direc);
            sentencia.setString(6, cl_dni);
            sentencia.setString(7, hashedPassword);
            sentencia.setString(8, id);
            int filasActualizadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editCliente: " + e.getMessage());
            return 0;
        }
    }
    public int deleteCliente(String id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "DELETE FROM clientes WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            int filasEliminadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            return filasEliminadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en deleteCliente: " + e.getMessage());
            return 0;
        }
    }
    public Cliente getClienteById(String id) {
        Cliente cl = new Cliente();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM BDCamas.Clientes WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            ResultSet resultado = sentencia.executeQuery();

            while (resultado.next()) {
                cl.setId(resultado.getLong("id"));
                cl.setNombre(resultado.getString("nombres"));
                cl.setApellPaterno(resultado.getString("apePaterno"));
                cl.setApellMaterno(resultado.getString("apeMaterno"));
                cl.setCorreo(resultado.getString("correo"));
                cl.setTelefono(resultado.getString("telefono"));
                cl.setDni(resultado.getString("dni"));
            }
            resultado.close();
            sentencia.close();
            cnx.close();
            return cl;
        } catch (SQLException e) {
            System.out.println("Error en getClienteById: " + e.getMessage());
        }
        return cl;
    }
    public List<Cliente> getClientes() {
        List<Cliente> lista = new ArrayList<>();
        try {
            Connection cnx = Conexion.conecta();
            String query = "SELECT * FROM BDCamas.Clientes";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                Cliente cl = new Cliente();
                cl.setId(resultado.getLong("id"));
                cl.setNombre(resultado.getString("nombres"));
                cl.setApellPaterno(resultado.getString("apePaterno"));
                cl.setApellMaterno(resultado.getString("apeMaterno"));
                cl.setDni(resultado.getString("dni"));
                cl.setTelefono(resultado.getString("telefono"));
                cl.setCorreo(resultado.getString("correo"));
                lista.add(cl);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getClientes: " + e.getMessage());
        }
        return lista;
    }
}
