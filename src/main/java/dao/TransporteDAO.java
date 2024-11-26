package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Transporte;
import utilidades.Conexion;
public class TransporteDAO {
    public TransporteDAO() {
    }
    public List<Transporte> getTransportes() {
        List<Transporte> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM Transporte";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                Transporte tr = new Transporte();
                tr.setId(resultado.getLong("id"));
                tr.setDescripcion(resultado.getString("descripcion"));
                tr.setMarca(resultado.getString("marca"));
                tr.setModelo(resultado.getString("modelo"));
                tr.setPlaca(resultado.getString("placa"));
                lista.add(tr);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getTransportes: " + e.getMessage());
        }
        return lista;
    }
    
    // Crear un transporte
    public int createTransporte(String descripcion, String marca, String modelo, String placa, String usuCreador) {
        String query = "INSERT INTO Transporte (descripcion, marca, modelo, placa, usuarioCreador, usuarioModificador) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection cnx = new Conexion().conecta();
            PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setString(1, descripcion);
            sentencia.setString(2, marca);
            sentencia.setString(3, modelo);
            sentencia.setString(4, placa);
            sentencia.setString(5, usuCreador);
            sentencia.setString(6, usuCreador);

            int filasInsertadas = sentencia.executeUpdate();
            if (filasInsertadas > 0) {
                System.out.println("Transporte creado con éxito.");
                return 1;
            }
        } catch (SQLException e) {
            System.out.println("Error en createTransporte: " + e.getMessage());
        }
        return 0;
    }

    // Editar un transporte
    public int editTransporte(Long id, String descripcion, String marca, String modelo, String placa, String usuarioModificador) {
        String query = "UPDATE Transporte SET descripcion=?, marca=?, modelo=?, placa=?, usuarioModificador=? WHERE id=?";
        try (Connection cnx = new Conexion().conecta();
             PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setString(1, descripcion);
            sentencia.setString(2, marca);
            sentencia.setString(3, modelo);
            sentencia.setString(4, placa);
            sentencia.setString(5, usuarioModificador);
            sentencia.setLong(6, id);

            int filasActualizadas = sentencia.executeUpdate();
            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editTransporte: " + e.getMessage());
        }
        return 0;
    }

    // Eliminar un transporte
    public int deleteTransporte(Long id) {
        String query = "DELETE FROM Transporte WHERE id=?";
        try (Connection cnx = new Conexion().conecta();
             PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setLong(1, id);

            int filasEliminadas = sentencia.executeUpdate();
            return filasEliminadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en deleteTransporte: " + e.getMessage());
        }
        return 0;
    }

    // Obtener transporte por ID
    public Transporte getTransporteById(Long id) {
        String query = "SELECT * FROM Transporte WHERE id=?";
        Transporte tr = null;
        try (Connection cnx = new Conexion().conecta();
             PreparedStatement sentencia = cnx.prepareStatement(query)) {
            sentencia.setLong(1, id);
            try (ResultSet resultado = sentencia.executeQuery()) {
                if (resultado.next()) {
                    tr = new Transporte();
                    tr.setId(resultado.getLong("id"));
                    tr.setDescripcion(resultado.getString("descripcion"));
                    tr.setMarca(resultado.getString("marca"));
                    tr.setModelo(resultado.getString("modelo"));
                    tr.setPlaca(resultado.getString("placa"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en getTransporteById: " + e.getMessage());
        }
        return tr;
    } 
}
