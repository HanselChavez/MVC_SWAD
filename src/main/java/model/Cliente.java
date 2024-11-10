package model;
public class Cliente {
    private Long id;
    private String nombre;
    private String apellPaterno;
    private String apellMaterno;
    private String telefono;
    private String correo;
    private String dni;
    public Cliente() {
    }
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellPaterno() {
        return apellPaterno;
    }
    public void setApellPaterno(String apellPaterno) {
        this.apellPaterno = apellPaterno;
    }
    public String getApellMaterno() {
        return apellMaterno;
    }
    public void setApellMaterno(String apellMaterno) {
        this.apellMaterno = apellMaterno;
    }
    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getDni() {
        return dni;
    }
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getNombreC() {
        return this.nombre + " " + this.apellPaterno + " " + this.apellMaterno;
    }
}
