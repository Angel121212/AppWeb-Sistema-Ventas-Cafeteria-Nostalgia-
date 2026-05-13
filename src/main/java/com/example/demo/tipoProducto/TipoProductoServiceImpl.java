package com.example.demo.tipoProducto;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.producto.ProductoRepository;

@Service
public class TipoProductoServiceImpl implements TipoProductoService {

    private final TipoProductoDAO tipoProductoDAO;
    private final ProductoRepository productoRepository;

    public TipoProductoServiceImpl(TipoProductoDAO tipoProductoDAO, ProductoRepository productoRepository) {
        this.tipoProductoDAO = tipoProductoDAO;
        this.productoRepository = productoRepository;
    }

    @Override
    public TipoProducto crearTipoProducto(TipoProducto tipoProducto) {
        return tipoProductoDAO.crearTipoProducto(tipoProducto);
    }

    @Override
    public List<TipoProducto> listaTipoProducto() {
        return tipoProductoDAO.listaTipoProducto();
    }

   @Override
    public TipoProducto findById(int id) {
        return tipoProductoDAO.findById(id);
    }


    @Override
    public void cambiarEstado(int id, boolean activo) {
        TipoProducto tipoProducto=tipoProductoDAO.findById(id);
        if (tipoProducto!=null) {
            //Cambiar estado de la categoria
            tipoProducto.setActivo(activo);
            tipoProductoDAO.updatetipoProducto(tipoProducto);

            //Cambiar estado de los productos con esa misma categoria
            productoRepository.cambiarEstadoPorCategoria(id, activo);
        }
    }

    @Override
    public boolean existePorNombre(String nombre) {
        return tipoProductoDAO.existePorNombre(nombre);
    }

    @Override
    public void updatetipoProducto(TipoProducto tipoProducto) {
        tipoProductoDAO.updatetipoProducto(tipoProducto);
    }

    @Override
    public List<TipoProducto> mostrarCatalogo() {
        return tipoProductoDAO.mostrarCatalogo();
    }
}