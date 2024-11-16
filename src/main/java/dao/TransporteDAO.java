package dao;
import java.sql.Connection;
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
}
