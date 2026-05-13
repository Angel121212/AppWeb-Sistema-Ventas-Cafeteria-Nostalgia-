package com.example.demo.compra;

import java.util.List;

public interface CompraService {
    List<Compra> listaCompra();
    Compra crearCompra(Compra compra);
}
