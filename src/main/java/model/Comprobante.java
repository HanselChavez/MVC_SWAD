package model;
import java.sql.Date;
import java.sql.Time;
public class Comprobante {
    private TipoComprobante tipo;
    private Long id;
    private double monto;
    private Date fecha;
    private Time hora;
    public Comprobante() {
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public double getMonto() {
        return monto;
    }
    public void setMonto(double monto) {
        this.monto = monto;
    }
    public Date getFecha() {
        return fecha;
    }
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public Time getHora() {
        return hora;
    }
    public void setHora(Time hora) {
        this.hora = hora;
    }
    public TipoComprobante getTipo() {
        return tipo;
    }
    public void setTipo(TipoComprobante tipo) {
        this.tipo = tipo;
    }
}
