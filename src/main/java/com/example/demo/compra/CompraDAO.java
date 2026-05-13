package com.example.demo.compra;

import java.util.List;

public interface CompraDAO {

    List<Compra> listaCompra();
    Compra crearCompra(Compra compra);
}
