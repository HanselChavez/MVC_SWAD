/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utilidades.Conexion;

/**
 *
 * @author GianN
 */
public class TipoComprobante {

    private Long id;
    private String nombre;
    private String descripcion;

    public TipoComprobante() {
    }

    public TipoComprobante getTipoById(String id) {
        TipoComprobante tc = null;  // Inicializa como null para manejar el caso de que no se encuentre ningún rol

        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "SELECT * FROM BDCamas.TipoComprobante WHERE id=?";
            PreparedStatement sentencia = cnx.prepareStatement(query);
            sentencia.setString(1, id);
            ResultSet resultado = sentencia.executeQuery();

            if (resultado.next()) {
                tc = new TipoComprobante();
                tc.setId(resultado.getLong("id"));
                tc.setNombre(resultado.getString("nombre"));
                tc.setDescripcion(resultado.getString("descripcion"));
            }

            resultado.close();
            sentencia.close();
            cnx.close();
        } catch (SQLException e) {
            System.out.println("Error en getTipoById: " + e.getMessage());
        }
        return tc;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
