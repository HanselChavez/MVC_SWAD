package model;
public class DetalleVenta {
    private Long idVenta;
    private int cantiidad;
    private Producto producto;
    public DetalleVenta() {
    }
    public Long getIdVenta() {
        return idVenta;
    }
    public void setIdVenta(Long idVenta) {
        this.idVenta = idVenta;
    }
    public int getCantiidad() {
        return cantiidad;
    }
    public void setCantiidad(int cantiidad) {
        this.cantiidad = cantiidad;
    }
    public Producto getProducto() {
        return producto;
    }
    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}
