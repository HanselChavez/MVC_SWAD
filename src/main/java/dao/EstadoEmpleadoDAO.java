package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.EstadoEmpleado;
import utilidades.Conexion;
public class EstadoEmpleadoDAO {
    public EstadoEmpleadoDAO() {
    }
    public EstadoEmpleado getEstadoEmpleadoById(Long id) {
        EstadoEmpleado es = null;  // Inicializa como null para manejar el caso de que no se encuentre ningún rol
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM EstadosEmpleado WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setLong(1, id);
            ResultSet resultado = sentencia.executeQuery();
            if (resultado.next()) {
                EstadoEmpleado estado = new EstadoEmpleado();
                es.setId(resultado.getLong("id"));
                es.setNombre(resultado.getString("nombre"));
                es.setDescripcion(resultado.getString("descripcion"));
                es = estado;  // Asigna el rol encontrado a rl
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getEstadoEmpleadoById: " + e.getMessage());
        }
        return es;
    }
}
