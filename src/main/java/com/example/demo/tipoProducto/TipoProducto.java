package com.example.demo.tipoProducto;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TipoProducto {
     
    private Integer id;
    private String nombre;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate fechaCreacion;
    private boolean activo=true;

    

    public TipoProducto() {
        
    }
    
    public TipoProducto(int id, String nombre, LocalDate fechaCreacion) {
        this.id = id;
        this.nombre = nombre;
        this.fechaCreacion = fechaCreacion;
        this.activo = true;
    }



    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }
    
    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public boolean isActivo(){
        return activo;
    }

    public void setActivo(boolean activo){
        this.activo=activo;
    }
    
}
