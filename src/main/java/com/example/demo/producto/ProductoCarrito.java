package com.example.demo.producto;

public class ProductoCarrito {
    private Integer id;
    private String nombre;
    private Double precio;
    private int cantidad;

    public ProductoCarrito(Integer id, String nombre, Double precio, int cantidad) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public ProductoCarrito(){

    }

    public Integer getId() { 
        return id; 
    }

    public String getNombre() { 
        return nombre; 
    }

    public Double getPrecio() { 
        return precio; 
    }
    
    public int getCantidad() { 
        return cantidad; 
    }
    
    public void setCantidad(int cantidad) { 
        this.cantidad = cantidad; 
    }
}
