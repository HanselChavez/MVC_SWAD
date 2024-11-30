package model;

public class Proveedor {

    private Long id;
    private String empresa;
    private String telefono;
    private String ruc;
    private String direccion;
    private String correo;
    private ContactoInicial contactoInicial;

    // Constructor por defecto
    public Proveedor() {
    }

    // Constructor con todos los atributos
    public Proveedor(Long id, String empresa, String telefono, String ruc, String direccion, String correo,Long idContacto, String contactoNombre, String contactoTelefono) {
        this.id = id;
        this.empresa = empresa;
        this.telefono = telefono;
        this.ruc = ruc;
        this.direccion = direccion;
        this.correo = correo;
        this.contactoInicial = new ContactoInicial(idContacto,contactoNombre, contactoTelefono);
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public ContactoInicial getContactoInicial() {
        return contactoInicial;
    }

    public void setContactoInicial(ContactoInicial contactoInicial) {
        this.contactoInicial = contactoInicial;
    }

    // Clase interna para representar el contacto inicial
}
