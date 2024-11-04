package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utilidades.Conexion;
public class MetodoPago {
    private Long id;
    private String nombre;
    private String descripcion;
    public MetodoPago() {
    }
    public MetodoPago getMetodoById(String id) {
        MetodoPago mp = null;  // Inicializa como null para manejar el caso de que no se encuentre ningún rol
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM BDCamas.MetodoPago WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            ResultSet resultado = sentencia.executeQuery();
            if (resultado.next()) {
                mp = new MetodoPago();
                mp.setId(resultado.getLong("id"));
                mp.setNombre(resultado.getString("nombre"));
                mp.setDescripcion(resultado.getString("descripcion"));
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getMetodoById: " + e.getMessage());
        }
        return mp;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
