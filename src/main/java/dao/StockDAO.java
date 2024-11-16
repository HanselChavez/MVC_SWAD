package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Categoria;
import model.EstadoProducto;
import model.Producto;
import model.Proveedor;
import model.Stock;
import utilidades.Conexion;
public class StockDAO {
    public StockDAO() {
    }
    public List<Stock> getStock() {
        List<Stock> lista = new ArrayList<>();
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT\n"
                    + "  s.id AS stock_id,\n"
                    + "  s.ubicacion,\n"
                    + "  s.cantidad,\n"
                    + "  p.id AS producto_id,\n"
                    + "  p.nombre AS producto_nombre,\n"
                    + "  p.descripcion AS producto_descripcion,\n"
                    + "  p.precioCompra,\n"
                    + "  p.precioVenta,\n"
                    + "  p.idCategoria,\n"
                    + "  p.img,\n"
                    + "  p.idEstado,\n"
                    + "  p.idProveedor\n"
                    + "FROM Stock s\n"
                    + "JOIN Productos p ON s.idProducto = p.id;";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                Stock st = new Stock();
                st.setId(resultado.getLong("stock_id"));
                st.setUbicacion(resultado.getString("ubicacion"));
                st.setCantidad(resultado.getInt("cantidad"));
                Producto pr = new Producto();
                pr.setId(resultado.getLong("producto_id"));
                pr.setNombre(resultado.getString("producto_nombre"));
                pr.setDescripcion(resultado.getString("producto_descripcion"));
                pr.setPrecioVenta(resultado.getDouble("precioVenta"));
                pr.setPrecioCompra(resultado.getDouble("precioCompra"));
                Categoria cat = new Categoria();
                EstadoProducto ep = new EstadoProducto();
                Proveedor pv = new Proveedor();
                pr.setCategoria(cat);
                pr.setEstado(ep);
                pr.setProveedor(pv);
                st.setProducto(pr);
                lista.add(st);
            }
            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getUsers: " + e.getMessage());
        }
        return lista;
    }
}
