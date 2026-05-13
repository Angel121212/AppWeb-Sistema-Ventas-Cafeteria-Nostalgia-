package com.example.demo.boleta;

import com.example.demo.compra.Compra;
import com.example.demo.producto.Producto;

public class DetalleCompra {
    private int id;
    private Compra compra;
    private Producto producto;
    private int cantidad;
    private double subtotal;

    public DetalleCompra(int id, Compra compra, Producto producto, int cantidad, double subtotal) {
        this.id = id;
        this.compra = compra;
        this.producto = producto;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }
    
    public DetalleCompra() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

}
