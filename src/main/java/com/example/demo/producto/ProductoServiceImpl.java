package com.example.demo.producto;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoDAO ProductoDAO;

    public ProductoServiceImpl(ProductoDAO ProductoDAO) {
        this.ProductoDAO = ProductoDAO;
    }

    @Override
    public List<Producto> ProductoReporte(Integer idTipoProducto) {
        return ProductoDAO.ProductoReporte(idTipoProducto);
    }

    @Override
    public void CrearProducto(Producto producto) {
        ProductoDAO.CrearProducto(producto);
    }

    @Override
    public List<Producto> listaProducto() {
        return ProductoDAO.listaProducto();
    }

    @Override
    public void cambiarEstado (int id, boolean activo) {
        Producto producto= ProductoDAO.findById(id);
        if (producto!=null) {
            producto.setActivo(activo);
            ProductoDAO.updateProducto(producto);
        }
    }


    @Override
    public Producto findById(int id) {
        return ProductoDAO.findById(id);
    }

    @Override
    public void updateProducto(Producto producto) {
        ProductoDAO.updateProducto(producto);
    }

    @Override
    public List<Producto> mostrarCatalogo() {
        return ProductoDAO.listaProducto(); 
    }
}