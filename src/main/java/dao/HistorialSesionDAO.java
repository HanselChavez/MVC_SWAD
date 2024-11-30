package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.HistorialSesion;
import utilidades.Conexion;
public class HistorialSesionDAO {
    public List<HistorialSesion> getHistorialSesion() {
        List<HistorialSesion> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT \n"
                    + "  id,\n"
                    + "  idEmpleado,\n"
                    + "  ip \n"
                    + " FROM HistorialSesion";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                HistorialSesion hs = new HistorialSesion();
                hs.setId(resultado.getLong("id"));
                hs.setIdUsuario(resultado.getLong("idEmpleado"));
                hs.setIp(resultado.getString("ip"));

                lista.add(hs);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getHistorialSesion: " + e.getMessage());
        }
        return lista;
    }
}
