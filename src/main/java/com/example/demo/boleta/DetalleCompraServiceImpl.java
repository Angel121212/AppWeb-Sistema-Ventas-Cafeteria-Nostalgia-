package com.example.demo.boleta;

import org.springframework.stereotype.Service;

@Service
public class DetalleCompraServiceImpl implements DetalleCompraService {
    
    private final DetalleCompraDAO detalleCompraDAO;

    public DetalleCompraServiceImpl(DetalleCompraDAO detalleCompraDAO) {
        this.detalleCompraDAO = detalleCompraDAO;
    }

    @Override
    public void crearDetalleCompra(DetalleCompra detalleCompra) {
        detalleCompraDAO.crearDetalleCompra(detalleCompra);
    }
}
