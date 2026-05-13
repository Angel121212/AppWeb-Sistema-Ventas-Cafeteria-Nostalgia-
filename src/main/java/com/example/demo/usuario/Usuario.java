package com.example.demo.usuario;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Usuario {
    private int id;
    private String nombre;
    private String email;
    private String contrasena;
    private int rol;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate fechaCreacion;
    private boolean activo= true;

    private transient String confirmarContrasena; //campo temporal para confirmar contraseña

    public Usuario(int id, String nombre, String email, String contrasena, LocalDate fechaCreacion, int rol) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.contrasena = contrasena;
        this.fechaCreacion = fechaCreacion;
        this.rol = rol;
        this.activo=true;
    }


    public Usuario() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getContrasena() {
        return contrasena;
    }
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }
    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    public int getRol() {
        return rol;
    }
    public void setRol(int rol) {
        this.rol = rol;
    }

    public String getConfirmarContrasena() {
        return confirmarContrasena;
    }

    public void setConfirmarContrasena(String confirmarContrasena) {
        this.confirmarContrasena = confirmarContrasena;
    }   

    public boolean isActivo(){
        return activo;
    }

    public void setActivo(boolean activo){
        this.activo=activo;
    }

}
