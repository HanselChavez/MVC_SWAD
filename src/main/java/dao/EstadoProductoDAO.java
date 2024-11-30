package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.EstadoProducto;
import utilidades.Conexion;
public class EstadoProductoDAO {
    public EstadoProductoDAO() {
    }
    public List<EstadoProducto> getEstados() {
        List<EstadoProducto> lista = new ArrayList<>();
        String query = "SELECT * FROM EstadosProducto";
        try (Connection cnx = new Conexion().conecta(); Statement sentencia = cnx.createStatement(); ResultSet resultado = sentencia.executeQuery(query)) {
            while (resultado.next()) {
                EstadoProducto ep = new EstadoProducto();
                ep.setId(resultado.getLong("id"));
                ep.setNombre(resultado.getString("nombre"));
                ep.setDescripcion(resultado.getString("descripcion"));
                lista.add(ep);
            }
        } catch (SQLException e) {
            System.out.println("Error en getEstados: " + e.getMessage());
        }
        return lista;
    }
    public EstadoProducto getEstadoById(String id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();

            String query = "SELECT * FROM EstadosProducto where id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            ResultSet resultado = sentencia.executeQuery();
            EstadoProducto ep = new EstadoProducto();
            while (resultado.next()) {
                ep.setId(resultado.getLong("id"));
                ep.setNombre(resultado.getString("nombre"));
                ep.setDescripcion(resultado.getString("descripcion"));
            }
            resultado.close();
            sentencia.close();
            cnx.close();
            return ep;
        } catch (SQLException e) {
            System.out.println("Error en getEstadoProductoById: " + e.getMessage());
            return null;
        }

    }
}
