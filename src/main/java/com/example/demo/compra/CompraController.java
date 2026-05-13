package com.example.demo.compra;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.boleta.DetalleCompra;
import com.example.demo.boleta.DetalleCompraService;
import com.example.demo.producto.Producto;
import com.example.demo.producto.ProductoCarrito;
import com.example.demo.usuario.Usuario;

import jakarta.servlet.http.HttpSession;

import org.springframework.ui.Model;

import java.time.LocalDate;
import java.util.List;




@Controller
@RequestMapping("/compra")
public class CompraController {
    
    private final CompraService compraService;
    private final DetalleCompraService detalleCompraService;
    
    public CompraController(CompraService compraService, DetalleCompraService detalleCompraService) {
        this.compraService = compraService;
        this.detalleCompraService = detalleCompraService;
    }

    @GetMapping("/lista")    
    public String listarCompra(Model model) {
        List<Compra> lista = compraService.listaCompra();
        model.addAttribute("compras",lista);
        return "compras";
    }

    
    @PostMapping("/crear")
    public String crearCompra (HttpSession session, @RequestParam("pago") String pago){

        // Obtener usuario
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");

        // Obtener carrito desde sesión
        @SuppressWarnings("unchecked")
        List<ProductoCarrito> carrito = (List<ProductoCarrito>) session.getAttribute("carrito");

        if (carrito == null || carrito.isEmpty()) {
            return "redirect:/principal/carrito"; // No hay nada que comprar
        }

        // Calcular total
        double total = carrito.stream()
                .mapToDouble(i -> i.getPrecio() * i.getCantidad())
                .sum();

        
        // Crear compra
        Compra compra = new Compra();
        compra.setUsuario(usuario);
        compra.setFechaCreacion(LocalDate.now());
        compra.setPago(pago);
        compra.setTotal(total);
        
        // Guardar en base de datos
        compra = compraService.crearCompra(compra);

        for (ProductoCarrito item : carrito) {
            DetalleCompra detalle = new DetalleCompra();
            detalle.setCompra(compra);  // Relación FK correcta
            Producto p = new Producto();
                p.setId(item.getId());
                detalle.setProducto(p); // el producto asociado
            detalle.setCantidad(item.getCantidad());
            detalle.setSubtotal(item.getCantidad() * item.getPrecio());

            detalleCompraService.crearDetalleCompra(detalle); 
        }

        // Vaciar carrito
        session.removeAttribute("carrito");

        // Ir a lista de compras o a una página de gracias
        return "redirect:/principal/carrito";
    }

}



