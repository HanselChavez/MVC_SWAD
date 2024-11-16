package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import io.github.cdimascio.dotenv.Dotenv;

/**
 *
 * @author Estudiante
 */
public class Conexion {

    private static Connection cnx;

    public static Connection conecta() {
        try {
            /*
             * Dotenv dotenv = Dotenv.configure()
             * .directory("/")
             * .load();
             */
            /*
             * String usr = dotenv.get("user");
             * String psw = dotenv.get("password");
             */
            /*
             * String usr = "root";
             * String psw = "root";
             * String url = "jdbc:mysql://localhost:33066/BDCamas";
             */
            String usr = "root";

            String psw = "977966335";
            String url = "jdbc:mysql://localhost:3307/BDCamas";
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
