package com.example.demo.tipoProducto;

import java.util.List;


public interface TipoProductoService {
    TipoProducto crearTipoProducto(TipoProducto tipoProducto);

    List<TipoProducto> listaTipoProducto();

    TipoProducto findById(int id);

    void cambiarEstado(int id, boolean activo);

    boolean existePorNombre(String nombre);

    void updatetipoProducto(TipoProducto tipoProducto);

    List<TipoProducto> mostrarCatalogo();

}
