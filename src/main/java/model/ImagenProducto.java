package model;
public class ImagenProducto {
    private Long id;
    private String imagen;
    private Long idProducto;
    private boolean esPrincipal;
    public ImagenProducto() {
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getImagen() {
        return imagen;
    }
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    public Long getIdProducto() {
        return idProducto;
    }
    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }
    public boolean isEsPrincipal() {
        return esPrincipal;
    }
    public void setEsPrincipal(boolean esPrincipal) {
        this.esPrincipal = esPrincipal;
    }
}
