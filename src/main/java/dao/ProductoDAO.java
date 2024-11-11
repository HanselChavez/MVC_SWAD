package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Categoria;
import model.EstadoProducto;
import model.ImagenProducto;
import model.Producto;
import model.Proveedor;
import utilidades.Conexion;
public class ProductoDAO {
    public ProductoDAO() {
    }
    public int createProduct(String p_nombre,
            String p_descripcion,
            int p_idCategoria,
            int p_idProveedor,
            int p_idEstado,
            double p_preCompra,
            double p_preVenta,
            String imagenPrincipal,
            List<String> imagenesSecundarias) {
        Connection cnx = null;
        PreparedStatement sentencia = null;
        ResultSet generatedKeys = null;
        System.out.println("PRUEBA CREATE PRODUCTO -----");
        System.out.println(imagenesSecundarias);
        imagenesSecundarias.forEach(img -> System.out.println(img));
        System.out.println("PRUEBA CREATE PRODUCTO");
        try {
            Conexion c = new Conexion();
            cnx = c.conecta();
            String query = "INSERT INTO Productos (nombre, descripcion, precioCompra, precioVenta"
                    + ", idCategoria, idProveedor, idEstado, usuarioCreador, usuarioModificador) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            sentencia = cnx.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            sentencia.setString(1, p_nombre);
            sentencia.setString(2, p_descripcion);
            sentencia.setDouble(3, p_preCompra);
            sentencia.setDouble(4, p_preVenta);
            sentencia.setInt(5, p_idCategoria);
            sentencia.setInt(6, p_idProveedor);
            sentencia.setInt(7, p_idEstado);
            sentencia.setInt(8, 1); // usuarioCreador
            sentencia.setInt(9, 1); // usuarioModificador
            int filasInsertadas = sentencia.executeUpdate();
            if (filasInsertadas > 0) {
                generatedKeys = sentencia.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int nuevoIdProducto = generatedKeys.getInt(1);
                    if (imagenPrincipal != null && !imagenPrincipal.isEmpty()) {
                        insertImage(nuevoIdProducto, imagenPrincipal, true, cnx);
                    }
                    for (String imagenSecundaria : imagenesSecundarias) {
                        insertImage(nuevoIdProducto, imagenSecundaria, false, cnx);
                    }
                }
            }
            return filasInsertadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en createProducto: " + e.getMessage());
            return 0;
        } finally {
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (sentencia != null) {
                    sentencia.close();
                }
                if (cnx != null) {
                    cnx.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }
    private void insertImage(int idProducto, String img, boolean esPrincipal, Connection cnx) throws SQLException {
        String query = "INSERT INTO Imagenes (idProducto, img, esPrincipal) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = cnx.prepareStatement(query)) {
            stmt.setInt(1, idProducto);
            stmt.setString(2, img);
            stmt.setBoolean(3, esPrincipal);
            stmt.executeUpdate();
        }
    }
    public int editProduct(String p_nombre, String idProducto,
            String p_descripcion, int p_idCategoria, int p_idProveedor,
            int p_idEstado, double p_preCompra, double p_preVenta, String idUser, String imagenPrincipal, List<String> imagenesSecundarias) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String queryUpdateProducto = "UPDATE Productos SET "
                    + "nombre = ?, "
                    + "descripcion = ?, "
                    + "precioCompra = ?, "
                    + "precioVenta = ?, "
                    + "idCategoria = ?, "
                    + "idEstado = ?, "
                    + "idProveedor = ?, "
                    + "usuarioModificador = ? "
                    + "WHERE id = ?;";
            PreparedStatement sentenciaProducto = cnx.prepareStatement(queryUpdateProducto);
            sentenciaProducto.setString(1, p_nombre);
            sentenciaProducto.setString(2, p_descripcion);
            sentenciaProducto.setDouble(3, p_preCompra);
            sentenciaProducto.setDouble(4, p_preVenta);
            sentenciaProducto.setInt(5, p_idCategoria);
            sentenciaProducto.setInt(6, p_idEstado);
            sentenciaProducto.setInt(7, p_idProveedor);
            sentenciaProducto.setString(8, idUser);
            sentenciaProducto.setString(9, idProducto);
            int filasActualizadas = sentenciaProducto.executeUpdate();
            sentenciaProducto.close();
            if (imagenPrincipal != null) {
                String queryUpdateImagenPrincipal = "UPDATE Imagenes SET img = ?, esPrincipal = TRUE WHERE idProducto = ? AND esPrincipal = TRUE;";
                PreparedStatement sentenciaPrincipal = cnx.prepareStatement(queryUpdateImagenPrincipal);
                sentenciaPrincipal.setString(1, imagenPrincipal);
                System.out.println("IMAGEN PRINCIPAL" + imagenPrincipal);
                sentenciaPrincipal.setInt(2, Integer.parseInt(idProducto));
                int updated = sentenciaPrincipal.executeUpdate();
                sentenciaPrincipal.close();
                if (updated < 1) {
                    String query = "INSERT INTO Imagenes (idProducto, img, esPrincipal) VALUES (?, ?, ?)";
                    PreparedStatement sentenciaInsert = cnx.prepareStatement(query);
                    sentenciaInsert.setString(1, idProducto);
                    sentenciaInsert.setString(2, imagenPrincipal);
                    sentenciaInsert.setBoolean(3, true);
                    sentenciaInsert.executeUpdate();

                    sentenciaInsert.close();
                }
            }
            String queryDeleteSecundarias = "DELETE FROM Imagenes WHERE idProducto = ? AND esPrincipal = FALSE;";
            PreparedStatement sentenciaDelete = cnx.prepareStatement(queryDeleteSecundarias);
            sentenciaDelete.setInt(1, Integer.parseInt(idProducto));
            sentenciaDelete.executeUpdate();
            sentenciaDelete.close();
            String queryInsertSecundarias = "INSERT INTO Imagenes (idProducto, img, esPrincipal) VALUES (?, ?, FALSE);";
            PreparedStatement sentenciaInsert = cnx.prepareStatement(queryInsertSecundarias);
            for (String img : imagenesSecundarias) {
                System.out.println("IMGS EDIT: " + img);
                sentenciaInsert.setInt(1, Integer.parseInt(idProducto));
                sentenciaInsert.setString(2, img);
                sentenciaInsert.addBatch(); // Añadir al batch
            }
            sentenciaInsert.executeBatch(); // Ejecutar todas las inserciones
            sentenciaInsert.close();
            cnx.close();
            return filasActualizadas > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en editProduct: " + e.getMessage());
            return 0;
        }
    }
    public int deleteProduct(String id) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query1 = "DELETE FROM imagenes WHERE idProducto=?";
            String query2 = "DELETE FROM productos WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query1);
            sentencia.setString(1, id);
            sentencia.executeUpdate();
            sentencia.close();
            PreparedStatement sentencia2 = cnx.prepareStatement(query2);
            sentencia2.setString(1, id);
            int filasEliminadas2 = sentencia2.executeUpdate();
            sentencia2.close();
            cnx.close();
            return filasEliminadas2 > 0 ? 1 : 0;
        } catch (SQLException e) {
            System.out.println("Error en deleteUser: " + e.getMessage());
            return 0;
        }
    }
    public List<Producto> getProducts() {
        List<Producto> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT p.*, ep.id AS idEstado, ep.nombre AS estadoNombre, "
                    + "c.nombre AS categoriaNombre, c.id AS categoriaId, c.descripcion AS categoriaDescripcion, "
                    + "v.empresa AS proveedorEmpresa, v.correo AS proveedorCorreo, v.id AS proveedorId, "
                    + "v.ruc AS proveedorRuc, v.direccion AS proveedorDireccion, v.telefono AS proveedorTelefono, "
                    + "ip.id AS imagenId, ip.img AS imagenUrl, ip.esPrincipal "
                    + "FROM productos p "
                    + "JOIN categorias c ON p.idCategoria = c.id "
                    + "JOIN proveedores v ON p.idProveedor = v.id "
                    + "JOIN EstadosProducto ep ON p.idEstado = ep.id "
                    + "LEFT JOIN Imagenes ip ON p.id = ip.idProducto";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            Map<Long, Producto> productosMap = new HashMap<>(); // Para manejar duplicados de producto
            while (resultado.next()) {
                Long idProducto = resultado.getLong("id");
                Producto prd = productosMap.getOrDefault(idProducto, new Producto());
                if (!productosMap.containsKey(idProducto)) {
                    prd.setId(idProducto);
                    prd.setDescripcion(resultado.getString("descripcion"));
                    prd.setNombre(resultado.getString("nombre"));
                    prd.setPrecioCompra(resultado.getDouble("precioCompra"));
                    prd.setPrecioVenta(resultado.getDouble("precioVenta"));
                    Categoria categoria = new Categoria();
                    categoria.setId(resultado.getLong("categoriaId"));
                    categoria.setNombre(resultado.getString("categoriaNombre"));
                    categoria.setDescripcion(resultado.getString("categoriaDescripcion"));
                    prd.setCategoria(categoria);
                    EstadoProducto estado = new EstadoProducto();
                    estado.setId(resultado.getLong("idEstado"));
                    estado.setNombre(resultado.getString("estadoNombre"));
                    prd.setEstado(estado);
                    Proveedor proveedor = new Proveedor();
                    proveedor.setId(resultado.getLong("proveedorId"));
                    proveedor.setEmpresa(resultado.getString("proveedorEmpresa"));
                    proveedor.setCorreo(resultado.getString("proveedorCorreo"));
                    proveedor.setRuc(resultado.getString("proveedorRuc"));
                    proveedor.setDireccion(resultado.getString("proveedorDireccion"));
                    proveedor.setTelefono(resultado.getString("proveedorTelefono"));
                    prd.setProveedor(proveedor);
                    prd.setListaImagenes(new ArrayList<>()); // Inicializa la lista de imágenes
                    productosMap.put(idProducto, prd);
                }
                Long imagenId = resultado.getLong("imagenId");
                if (imagenId != null && !resultado.wasNull()) {
                    ImagenProducto imagenProducto = new ImagenProducto();
                    imagenProducto.setId(imagenId);
                    imagenProducto.setImagen(resultado.getString("imagenUrl"));
                    imagenProducto.setEsPrincipal(resultado.getBoolean("esPrincipal"));
                    imagenProducto.setIdProducto(idProducto);
                    prd.getListaImagenes().add(imagenProducto);
                }
            }
            lista.addAll(productosMap.values());
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }
    public List<Producto> getProductosByCategoriaId(Long idCategoria) {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT p.id, p.nombre, p.descripcion, p.precioCompra, p.precioVenta, "
                + "c.nombre AS categoria, e.nombre AS estado, pr.empresa AS proveedor, "
                + "p.fechaCreación, p.fechaModificación "
                + "FROM Productos p "
                + "JOIN Categorias c ON p.idCategoria = c.id "
                + "JOIN EstadosProducto e ON p.idEstado = e.id "
                + "JOIN Proveedores pr ON p.idProveedor = pr.id "
                + "WHERE p.idCategoria = ?";
        String sqlImagenes = "SELECT * FROM Imagenes WHERE idProducto = ?";
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            PreparedStatement stmt = cnx.prepareStatement(sql);
            stmt.setLong(1, idCategoria);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Producto producto = new Producto();
                    producto.setId(rs.getLong("id"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecioCompra(rs.getDouble("precioCompra"));
                    producto.setPrecioVenta(rs.getDouble("precioVenta"));
                    Categoria categoria = new Categoria();
                    categoria.setId(Long.valueOf(idCategoria));
                    categoria.setNombre(rs.getString("categoria"));
                    producto.setCategoria(categoria);
                    EstadoProducto estado = new EstadoProducto();
                    estado.setNombre(rs.getString("estado"));
                    producto.setEstado(estado);
                    Proveedor proveedor = new Proveedor();
                    proveedor.setEmpresa(rs.getString("proveedor"));
                    producto.setProveedor(proveedor);
                    try (PreparedStatement stmtImagenes = cnx.prepareStatement(sqlImagenes)) {
                        stmtImagenes.setLong(1, producto.getId());
                        ResultSet rsImagenes = stmtImagenes.executeQuery();
                        List<ImagenProducto> listaImagenes = new ArrayList<>();
                        while (rsImagenes.next()) {
                            ImagenProducto imagen = new ImagenProducto();
                            imagen.setId(rsImagenes.getLong("id"));
                            imagen.setIdProducto(rsImagenes.getLong("idProducto"));
                            imagen.setEsPrincipal(rsImagenes.getBoolean("esPrincipal"));
                            imagen.setImagen(rsImagenes.getString("img"));
                            listaImagenes.add(imagen);
                        }
                        producto.setListaImagenes(listaImagenes);
                    }
                    productos.add(producto);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en obtenerProductoPorCategoria: " + e.getMessage());
        }
        return productos;
    }
    public List<Producto> getProductosByCategoria(String value) {
        List<Producto> productos = new ArrayList<>();
        if (value == null || value.trim().isEmpty()) {
            System.out.println("El valor de categoría es nulo o vacío.");
            return productos;
        }
        String sql = "SELECT p.id, p.nombre, p.descripcion, p.precioCompra, p.precioVenta, "
                + "c.nombre AS categoria, e.nombre AS estado, pr.empresa AS proveedor, "
                + "p.fechaCreación, p.fechaModificación "
                + "FROM Productos p "
                + "JOIN Categorias c ON p.idCategoria = c.id "
                + "JOIN EstadosProducto e ON p.idEstado = e.id "
                + "JOIN Proveedores pr ON p.idProveedor = pr.id "
                + "WHERE p.idCategoria = ? || c.nombre=?";

        String sqlImagenes = "SELECT * FROM Imagenes WHERE idProducto = ?";
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            PreparedStatement stmt = cnx.prepareStatement(sql);
            stmt.setString(1, value);
            stmt.setString(2, value);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Producto producto = new Producto();
                    producto.setId(rs.getLong("id"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecioCompra(rs.getDouble("precioCompra"));
                    producto.setPrecioVenta(rs.getDouble("precioVenta"));
                    Categoria categoria = new Categoria();
                    categoria.setId(Long.valueOf(value));
                    categoria.setNombre(rs.getString("categoria"));
                    producto.setCategoria(categoria);
                    EstadoProducto estado = new EstadoProducto();
                    estado.setNombre(rs.getString("estado"));
                    producto.setEstado(estado);
                    Proveedor proveedor = new Proveedor();
                    proveedor.setEmpresa(rs.getString("proveedor"));
                    producto.setProveedor(proveedor);
                    try (PreparedStatement stmtImagenes = cnx.prepareStatement(sqlImagenes)) {
                        stmtImagenes.setLong(1, producto.getId());
                        ResultSet rsImagenes = stmtImagenes.executeQuery();
                        List<ImagenProducto> listaImagenes = new ArrayList<>();
                        while (rsImagenes.next()) {
                            ImagenProducto imagen = new ImagenProducto();
                            imagen.setId(rsImagenes.getLong("id"));
                            imagen.setIdProducto(rsImagenes.getLong("idProducto"));
                            imagen.setEsPrincipal(rsImagenes.getBoolean("esPrincipal"));
                            imagen.setImagen(rsImagenes.getString("img"));
                            listaImagenes.add(imagen);
                        }
                        producto.setListaImagenes(listaImagenes);
                    }
                    productos.add(producto);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en obtenerProductoPorCategoria: " + e.getMessage());
        }
        return productos;
    }
    public Producto getProductById(Long idProducto) {
        Producto producto = null;
        String sql = "SELECT p.id, p.nombre, p.descripcion, p.precioCompra, p.precioVenta, "
                + "c.nombre AS categoria,c.id AS categoriaID, e.nombre AS estado,e.id AS estadoID, pr.id AS proveedorID, pr.empresa AS proveedor, "
                + "ip.id AS imagenId, ip.img AS imagenUrl, ip.esPrincipal "
                + "FROM Productos p "
                + "JOIN Categorias c ON p.idCategoria = c.id "
                + "JOIN EstadosProducto e ON p.idEstado = e.id "
                + "JOIN Proveedores pr ON p.idProveedor = pr.id "
                + "LEFT JOIN Imagenes ip ON p.id = ip.idProducto "
                + "WHERE p.id = ?";
        Conexion c = new Conexion();
        Connection cnx = c.conecta();
        try (PreparedStatement stmt = cnx.prepareStatement(sql)) {
            stmt.setLong(1, idProducto);
            try (ResultSet rs = stmt.executeQuery()) {
                Map<Long, Producto> productosMap = new HashMap<>();
                while (rs.next()) {
                    producto = productosMap.getOrDefault(idProducto, new Producto());
                    if (!productosMap.containsKey(idProducto)) {
                        producto.setId(rs.getLong("id"));
                        producto.setNombre(rs.getString("nombre"));
                        producto.setDescripcion(rs.getString("descripcion"));
                        producto.setPrecioCompra(rs.getDouble("precioCompra"));
                        producto.setPrecioVenta(rs.getDouble("precioVenta"));
                        Categoria categoria = new Categoria();
                        categoria.setId(rs.getLong("categoriaID"));
                        categoria.setNombre(rs.getString("categoria"));
                        producto.setCategoria(categoria);
                        EstadoProducto estado = new EstadoProducto();
                        estado.setId(rs.getLong("estadoID"));
                        estado.setNombre(rs.getString("estado"));
                        producto.setEstado(estado);
                        Proveedor proveedor = new Proveedor();
                        proveedor.setId(rs.getLong("proveedorID"));
                        proveedor.setEmpresa(rs.getString("proveedor"));
                        producto.setProveedor(proveedor);
                        producto.setListaImagenes(new ArrayList<>());
                        productosMap.put(idProducto, producto);
                    }
                    Long imagenId = rs.getLong("imagenId");
                    if (imagenId != null && !rs.wasNull()) {
                        ImagenProducto imagenProducto = new ImagenProducto();
                        imagenProducto.setId(imagenId);
                        imagenProducto.setImagen(rs.getString("imagenUrl"));
                        imagenProducto.setEsPrincipal(rs.getBoolean("esPrincipal"));
                        imagenProducto.setIdProducto(idProducto);
                        producto.getListaImagenes().add(imagenProducto);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error en getProductById: " + e.getMessage());
        }
        return producto;
    }
}
