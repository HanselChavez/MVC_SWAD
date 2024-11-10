package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Categoria;
import utilidades.Conexion;
public class CategoriaDAO {
    public CategoriaDAO() {
    }
    public List<Categoria> getCategories() {
        List<Categoria> lista = new ArrayList<>();
        String query = "SELECT * FROM categorias";
        try (Connection cnx = new Conexion().conecta(); Statement sentencia = cnx.createStatement(); ResultSet resultado = sentencia.executeQuery(query)) {
            while (resultado.next()) {
                Categoria cat = new Categoria();
                cat.setId(resultado.getLong("id"));
                cat.setNombre(resultado.getString("nombre"));
                cat.setDescripcion(resultado.getString("descripcion"));
                lista.add(cat);
            }
        } catch (SQLException e) {
            System.out.println("Error en getCategories: " + e.getMessage());
        }
        return lista;
    }
    // Método para crear una categoría
    public int createCategory(String nombre, String descripcion, String usuCreador) {
        // Validación de campos
        String validationMessage = validateInputs(nombre, descripcion);
        if (validationMessage != null) {
            System.out.println(validationMessage);
            return 0;
        }
        String query = "INSERT INTO categorias (nombre, descripcion, usuarioCreador, usuarioModificador) VALUES (?, ?, ?, ?)";
        try (Connection cnx = new Conexion().conecta(); PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setString(1, nombre);
            sentencia.setString(2, descripcion);
            sentencia.setString(3, usuCreador);
            sentencia.setString(4, usuCreador);
            int filasInsertadas = sentencia.executeUpdate();
            if (filasInsertadas > 0) {
                System.out.println("Categoría creada con éxito.");
                return 1;
            } else {
                System.out.println("No se pudo crear la categoría.");
                return 0;
            }
        } catch (SQLException e) {
            System.out.println("Error en createCategory: " + e.getMessage());
            return 0;
        }
    }
    // Método para editar una categoría
    public int editCategory(Long id, String nombre, String descripcion) {
        if (nombre == null || nombre.isEmpty() || descripcion == null || descripcion.isEmpty()) {
            System.out.println("El nombre o la descripción no pueden estar vacíos.");
            return 0;
        }
        String query = "UPDATE categorias SET nombre=?, descripcion=? WHERE id=?";
        try (Connection cnx = new Conexion().conecta(); PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setString(1, nombre);
            sentencia.setString(2, descripcion);
            sentencia.setLong(3, id);
            int filasActualizadas = sentencia.executeUpdate();
            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editCategory: " + e.getMessage());
            return 0;
        }
    }
    // Método para eliminar una categoría
    public int deleteCategory(Long id) {
        String query = "DELETE FROM categorias WHERE id=?";
        try (Connection cnx = new Conexion().conecta(); PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setLong(1, id);
            int filasEliminadas = sentencia.executeUpdate();
            return filasEliminadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en deleteCategory: " + e.getMessage());
            return 0;
        }
    }
    public Categoria getCategoryByName(String name) {
        String query = "SELECT * FROM Categorias WHERE nombre=?";
        Categoria cat = null;
        try (Connection cnx = new Conexion().conecta(); PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setString(1, name);
            try (ResultSet resultado = sentencia.executeQuery()) {
                if (resultado.next()) {
                    cat = new Categoria();
                    cat.setId(resultado.getLong("id"));
                    cat.setNombre(resultado.getString("nombre"));
                    cat.setDescripcion(resultado.getString("descripcion"));
                }
            }

        } catch (SQLException e) {
            System.out.println("Error en getCategoryByName: " + e.getMessage());
        }

        return cat;
    }
    public Categoria getCategoryById(Long id) {
        String query = "SELECT * FROM categorias WHERE id=?";
        Categoria cat = null;
        try (Connection cnx = new Conexion().conecta(); PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setLong(1, id);
            try (ResultSet resultado = sentencia.executeQuery()) {
                if (resultado.next()) {
                    cat = new Categoria();
                    cat.setId(resultado.getLong("id"));
                    cat.setNombre(resultado.getString("nombre"));
                    cat.setDescripcion(resultado.getString("descripcion"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en getCategoryById: " + e.getMessage());
        }
        return cat;
    }
    public String validateInputs(String nombre, String descripcion) {
        if (nombre == null || nombre.isEmpty() || nombre.length() > 50) {
            return "El nombre no puede estar vacío y debe tener un máximo de 50 caracteres.";
        }
        if (descripcion == null || descripcion.isEmpty() || descripcion.length() > 200) {
            return "La descripción no puede estar vacía y debe tener un máximo de 200 caracteres.";
        }
        return null;
    }
}
