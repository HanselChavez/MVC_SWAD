package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Rol;
import utilidades.Conexion;
public class RolDAO {
    public RolDAO() {
    }
    public Rol getRolById(Long id) {
        Rol rl = null;  // Inicializa como null para manejar el caso de que no se encuentre ningún rol
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM roles WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setLong(1, id);
            ResultSet resultado = sentencia.executeQuery();
            if (resultado.next()) {
                Rol rol = new Rol();
                rol.setId(resultado.getLong("id"));
                rol.setNombre(resultado.getString("nombre"));
                rol.setDescripcion(resultado.getString("descripcion"));
                rl = rol;  // Asigna el rol encontrado a rl
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getDatosRolById: " + e.getMessage());
        }
        return rl;
    }
    public List<Rol> getRols() {
        List<Rol> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM roles";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                Rol rol = new Rol();
                rol.setId(resultado.getLong("id"));
                rol.setNombre(resultado.getString("nombre"));
                rol.setDescripcion(resultado.getString("descripcion"));
                lista.add(rol);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getUsers: " + e.getMessage());
        }
        return lista;
    }
    public int createRol(String nombre, String descripcion) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "INSERT INTO roles ( nombre, descripcion) "
                    + "VALUES (?, ?)";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, nombre);
            sentencia.setString(2, descripcion);
            int filasInsertadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            return filasInsertadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en createRol: " + e.getMessage());
            return 0;
        }
    }
    public int editRol(String id, String nombre, String descripcion) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "UPDATE roles SET nombre=?, descripcion=? WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, nombre);
            sentencia.setString(2, descripcion);
            sentencia.setString(3, id);
            int filasActualizadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editRol: " + e.getMessage());
            return 0;
        }
    }
    public int deleteRol(String id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "DELETE FROM roles WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            int filasEliminadas = sentencia.executeUpdate();
            sentencia.close();
            cnx.close();
            return filasEliminadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en deleteRol: " + e.getMessage());
            return 0;
        }
    }
}
