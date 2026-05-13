package com.example.demo.producto;

import java.util.List;

public interface ProductoService  {
    
    public List<Producto> ProductoReporte(Integer idTipoProducto);

    public List<Producto> listaProducto();

    void cambiarEstado(int id, boolean activo);
    void CrearProducto(Producto producto);
    Producto findById(int id);
    void updateProducto(Producto producto);
    List<Producto> mostrarCatalogo();

}