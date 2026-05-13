package com.example.demo.compra;

import java.time.LocalDate;
import com.example.demo.usuario.Usuario;

public class Compra {
    private int id;
    private Usuario usuario;
    private LocalDate fechaCreacion;
    private String pago;
    private double total;

    public Compra(int id, Usuario usuario, LocalDate fechaCreacion, String pago, double total) {
        this.id = id;
        this.usuario = usuario;
        this.fechaCreacion = fechaCreacion;
        this.pago = pago;
        this.total = total;
    }
    public Compra() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    public double getTotal() {
        return total;
    }
    
    public void setTotal(double total) {
        this.total = total;
    }
}
