package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.ContactoInicial;
import model.Proveedor;
import utilidades.Conexion;

public class ProveedorDAO {

    public ProveedorDAO() {
    }

    public int createProveedor(String empresa, String telefono, String ruc, String direccion, String email, String contactoNombre, String contactoTelefono) {
        if (ruc.length() != 11 || !ruc.matches("\\d{11}")) {
            System.out.println("Ruc inválido. Asegúrate de que el RUC tenga 11 dígitos.");
            return 0;
        }
        if (empresa == null || empresa.trim().isEmpty()
                || telefono == null || telefono.trim().isEmpty()
                || ruc == null || direccion == null || direccion.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || contactoNombre == null || contactoNombre.trim().isEmpty()
                || contactoTelefono == null || contactoTelefono.trim().isEmpty()) {
            System.out.println("Datos inválidos. Asegúrate de que todos los campos estén completos y correctos.");
            return 0;
        }

        int filasInsertadas = 0;
        String queryProveedor = "INSERT INTO Proveedores (empresa, telefono, direccion, correo, ruc, usuarioCreador, usuarioModificador) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?);";
        String queryContacto = "INSERT INTO ProveedorContacto (nombre, telefono, idProveedor, usuarioCreador, usuarioModificador) "
                + "VALUES (?, ?, ?, ?, ?);";

        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            cnx.setAutoCommit(false); // Iniciar una transacción

            // Insertar Proveedor
            PreparedStatement sentenciaProveedor = cnx.prepareStatement(queryProveedor, Statement.RETURN_GENERATED_KEYS);
            sentenciaProveedor.setString(1, empresa);
            sentenciaProveedor.setString(2, telefono);
            sentenciaProveedor.setString(3, direccion);
            sentenciaProveedor.setString(4, email);
            sentenciaProveedor.setString(5, ruc);
            sentenciaProveedor.setInt(6, 1); // usuarioCreador
            sentenciaProveedor.setInt(7, 1); // usuarioModificador
            sentenciaProveedor.executeUpdate();

            // Obtener el ID del proveedor insertado
            ResultSet generatedKeys = sentenciaProveedor.getGeneratedKeys();
            if (generatedKeys.next()) {
                int idProveedor = generatedKeys.getInt(1);

                // Insertar Contacto del Proveedor
                PreparedStatement sentenciaContacto = cnx.prepareStatement(queryContacto);
                sentenciaContacto.setString(1, contactoNombre);
                sentenciaContacto.setString(2, contactoTelefono);
                sentenciaContacto.setInt(3, idProveedor);
                sentenciaContacto.setInt(4, 1); // usuarioCreador
                sentenciaContacto.setInt(5, 1); // usuarioModificador
                filasInsertadas = sentenciaContacto.executeUpdate();
            } else {
                throw new SQLException("No se pudo obtener el ID del proveedor.");
            }

            cnx.commit(); // Confirmar transacción
        } catch (SQLException e) {
            System.out.println("Error en createProveedor: " + e.getMessage());
            try {
                Conexion c = new Conexion();
                Connection cnx = c.conecta();
                cnx.rollback(); // Revertir transacción en caso de error
            } catch (SQLException ex) {
                System.out.println("Error al revertir la transacción: " + ex.getMessage());
            }
        }
        return filasInsertadas;
    }

    public int deleteProveedor(int idProveedor) {
        String queryEliminarContactos = "DELETE FROM ProveedorContacto WHERE idProveedor = ?;";
        String queryEliminarProveedor = "DELETE FROM Proveedores WHERE id = ?;";
        int filasAfectadas = 0;

        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            cnx.setAutoCommit(false); // Iniciar transacción

            // Eliminar contactos asociados al proveedor
            PreparedStatement stmtContactos = cnx.prepareStatement(queryEliminarContactos);
            stmtContactos.setInt(1, idProveedor);
            stmtContactos.executeUpdate();

            // Eliminar proveedor
            PreparedStatement stmtProveedor = cnx.prepareStatement(queryEliminarProveedor);
            stmtProveedor.setInt(1, idProveedor);
            filasAfectadas = stmtProveedor.executeUpdate();

            cnx.commit(); // Confirmar transacción
        } catch (SQLException e) {
            System.out.println("Error en deleteProveedor: " + e.getMessage());
            try {
                Conexion c = new Conexion();
                Connection cnx = c.conecta();
                cnx.rollback(); // Revertir transacción en caso de error
            } catch (SQLException ex) {
                System.out.println("Error al revertir la transacción: " + ex.getMessage());
            }
        }

        return filasAfectadas;
    }

    public int updateProveedor(int idProveedor, String empresa, String telefono, String direccion, String email, String ruc,
            String contactoNombre, String contactoTelefono, int idContacto) {
        String queryActualizarProveedor = "UPDATE Proveedores SET empresa = ?, telefono = ?, direccion = ?, correo = ?, ruc = ?, usuarioModificador = ? WHERE id = ?;";
        String queryActualizarContacto = "UPDATE ProveedorContacto SET nombre = ?, telefono = ?, usuarioModificador = ? WHERE id = ? AND idProveedor = ?;";
        int filasAfectadas = 0;

        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            cnx.setAutoCommit(false); // Iniciar transacción

            // Actualizar proveedor
            PreparedStatement stmtProveedor = cnx.prepareStatement(queryActualizarProveedor);
            stmtProveedor.setString(1, empresa);
            stmtProveedor.setString(2, telefono);
            stmtProveedor.setString(3, direccion);
            stmtProveedor.setString(4, email);
            stmtProveedor.setString(5, ruc);
            stmtProveedor.setInt(6, 1); // usuarioModificador
            stmtProveedor.setInt(7, idProveedor);
            filasAfectadas += stmtProveedor.executeUpdate();

            // Actualizar contacto asociado al proveedor
            PreparedStatement stmtContacto = cnx.prepareStatement(queryActualizarContacto);
            stmtContacto.setString(1, contactoNombre);
            stmtContacto.setString(2, contactoTelefono);
            stmtContacto.setInt(3, 1); // usuarioModificador
            stmtContacto.setInt(4, idContacto);
            stmtContacto.setInt(5, idProveedor);
            filasAfectadas += stmtContacto.executeUpdate();

            cnx.commit(); // Confirmar transacción
        } catch (SQLException e) {
            System.out.println("Error en updateProveedor: " + e.getMessage());
            try {
                Conexion c = new Conexion();
                Connection cnx = c.conecta();
                cnx.rollback(); // Revertir transacción en caso de error
            } catch (SQLException ex) {
                System.out.println("Error al revertir la transacción: " + ex.getMessage());
            }
        }

        return filasAfectadas;
    }

    public List<Proveedor> getProveedores() {
        List<Proveedor> lista = new ArrayList<>();
        String query = "SELECT * FROM Proveedores";
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            System.out.println(String.format("%-10s %-25s %-30s %-15s %-30s %-15s",
                    "ID", "Empresa", "Correo", "RUC", "Dirección", "Teléfono"));
            System.out.println("-------------------------------------------------------------------------------"
                    + "---------------------------------------------");
            while (resultado.next()) {
                Proveedor prov = new Proveedor();
                prov.setId(resultado.getLong("id"));
                prov.setEmpresa(resultado.getString("empresa"));
                prov.setCorreo(resultado.getString("correo"));
                prov.setRuc(resultado.getString("ruc"));
                prov.setDireccion(resultado.getString("direccion"));
                prov.setTelefono(resultado.getString("telefono"));
                System.out.println(String.format("%-10d %-25s %-30s %-15s %-30s %-15s",
                        prov.getId(),
                        prov.getEmpresa(),
                        prov.getCorreo(),
                        prov.getRuc(),
                        prov.getDireccion(),
                        prov.getTelefono()));
                lista.add(prov);
            }
        } catch (SQLException e) {
            System.err.println("Error en getProveedores: " + e.getMessage());
        }
        return lista;
    }

    public Proveedor getProveedorById(String id) {
        System.out.println("Iniciando búsqueda del proveedor con ID: " + id);

        if (id == "") {
            System.err.println("El ID proporcionado es inválido.");
            return null;
        }

        Proveedor pv = null;
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT p.id, p.empresa, p.telefono, p.direccion, p.correo, p.ruc, "
                    + "pc.nombre AS contacto_nombre, pc.telefono AS contacto_telefono ,pc.id as idContacto "
                    + "FROM Proveedores p "
                    + "LEFT JOIN ProveedorContacto pc ON p.id = pc.idProveedor "
                    + "WHERE p.id = ?";

            try (PreparedStatement sentencia = cnx.prepareStatement(query)) {
                sentencia.setString(1, id);
                System.out.println("Ejecutando consulta con ID: " + id);

                try (ResultSet resultado = sentencia.executeQuery()) {
                    if (resultado.next()) {
                        pv = new Proveedor();
                        pv.setId(resultado.getLong("id"));
                        pv.setEmpresa(resultado.getString("empresa"));
                        pv.setRuc(resultado.getString("ruc"));
                        pv.setTelefono(resultado.getString("telefono"));
                        pv.setCorreo(resultado.getString("correo"));
                        pv.setDireccion(resultado.getString("direccion"));
                        Long idContacto = resultado.getLong("idContacto");
                        // Información del contacto (si existe)
                        String contactoNombre = resultado.getString("contacto_nombre");
                        String contactoTelefono = resultado.getString("contacto_telefono");

                        // Asignamos el contacto a un objeto de tipo Contacto (deberías crear esta clase si no la tienes)
                        if (contactoNombre != null && contactoTelefono != null) {
                            ContactoInicial contacto = new ContactoInicial(idContacto, contactoNombre, contactoTelefono);
                            pv.setContactoInicial(contacto); // Suponiendo que Proveedor tiene un atributo Contacto
                        }

                    } else {
                        System.out.println("No se encontró un proveedor con ID: " + id);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error en getProveedorById con ID: " + id);
            System.err.println("Mensaje de error: " + e.getMessage());
        }
        return pv;
    }
}
