package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Estudiante
 */
public class Conexion {

    private static Connection cnx;

    public static Connection conecta() {
        try {
            String usr = "kthxaeujln";
            String psw = "$prFzsINPZX4khEE";
            String url = "jdbc:mysql://furniture-dayanara-server.mysql.database.azure.com:3306/bdcamas";

            Class.forName("com.mysql.cj.jdbc.Driver");
            cnx = DriverManager.getConnection(url, usr, psw);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnx;
    }

    public static void closeResources(Connection con) {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int verificarConexion(Connection c) throws ClassNotFoundException {
        if (c != null) {
            System.out.println("Conexión exitosa a la base de datos.");
            return 1;
        } else {
            System.out.println("Error: No se pudo establecer la conexión a la base de datos.");
            return 0;
        }

    }
}
