package com.example.demo.producto;

import java.util.List;

public interface ProductoDAO{
    List<Producto> ProductoReporte(Integer idTipoProducto);
    Producto CrearProducto(Producto producto);
    List<Producto> listaProducto();
    void cambiarEstado(int id, boolean activo);
    Producto findById(int id);
    void updateProducto(Producto producto);
    List<Producto> mostrarCatalogo();
}

