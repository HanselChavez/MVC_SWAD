package model;

import java.sql.Date;
import java.sql.Time;

public class Venta {
    
    private Long id;
    private Cliente cliente;
    private Usuario empleado;
    private Date fecha;
    private double impuesto;
    private double total;
    private double descuento;
    private MetodoPago metodoPago;
    private Time hora;
    private Comprobante comprobante;
    
    public Venta() {
    }
          
    public double getImpuesto() {
        return impuesto;
    }
    
    public void setImpuesto(double impuesto) {
        this.impuesto = impuesto;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Cliente getCliente() {
        return cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public Usuario getEmpleado() {
        return empleado;
    }
    
    public void setEmpleado(Usuario empleado) {
        this.empleado = empleado;
    }
    
    public Date getFecha() {
        return fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    public double getTotal() {
        return total;
    }
    
    public void setTotal(double total) {
        this.total = total;
    }
    
    public double getDescuento() {
        return descuento;
    }
    
    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }
    
    public MetodoPago getMetodoPago() {
        return metodoPago;
    }
    
    public void setMetodoPago(MetodoPago metodoPago) {
        this.metodoPago = metodoPago;
    }
    
    public Time getHora() {
        return hora;
    }
    
    public void setHora(Time hora) {
        this.hora = hora;
    }
    
    public Comprobante getComprobante() {
        return comprobante;
    }
    
    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }
    
}
