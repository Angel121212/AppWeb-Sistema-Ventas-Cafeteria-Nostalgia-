package com.example.demo.boleta;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/boleta")
public class DetalleCompraController {
    
    private final DetalleCompraService detalleCompraService;

    public DetalleCompraController(DetalleCompraService detalleCompraService) {
        this.detalleCompraService = detalleCompraService;
    }

    @PostMapping("/crearBoleta")
    public DetalleCompra crearDetalleCompra(@RequestBody DetalleCompra detalle){
        detalleCompraService.crearDetalleCompra(detalle);
        return detalle;
    }
}
