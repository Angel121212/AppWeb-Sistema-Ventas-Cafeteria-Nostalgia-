package com.example.demo.producto;

import java.time.LocalDate;

import com.example.demo.tipoProducto.TipoProducto;

public class Producto {

    private int id;
    private String nombre;
    private Double precio;
    private LocalDate fechaCreacion;
    private TipoProducto tipoProducto;
    private boolean activo=true;

    
    
    public Producto(int id, String nombre, Double precio, LocalDate fechaCreacion, TipoProducto tipoProducto) {
        this.id = id;
        this.nombre = nombre;
        this.precio=precio;
        this.fechaCreacion = fechaCreacion;
        this.tipoProducto = tipoProducto;
        this.activo=true;
    }

    public Producto() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio=precio;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public TipoProducto getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(TipoProducto tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isActivo(){
        return activo;
    }

    public void setActivo(boolean activo){
        this.activo=activo;
    }

}