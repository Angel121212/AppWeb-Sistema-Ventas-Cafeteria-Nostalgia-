package com.example.demo.compra;

import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class CompraServiceImpl implements CompraService {

    private final CompraDAO compraDAO;

    public CompraServiceImpl(CompraDAO compraDAO) {
        this.compraDAO = compraDAO;
    }

    @Override
    public List<Compra> listaCompra() {
        return compraDAO.listaCompra();
    }

    @Override
    public Compra crearCompra(Compra compra) {
        return compraDAO.crearCompra(compra);
    }
}
