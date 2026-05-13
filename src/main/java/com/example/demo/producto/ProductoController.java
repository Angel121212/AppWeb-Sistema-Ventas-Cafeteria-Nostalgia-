package com.example.demo.producto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.tipoProducto.TipoProductoService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/producto")
public class ProductoController {

    private final TipoProductoService tipoProductoService;
    private final ProductoService productoService;


    public ProductoController(TipoProductoService tipoProductoService, ProductoService productoService) {
        this.tipoProductoService = tipoProductoService;
        this.productoService = productoService;
    }

    // MOSTRAR FORMULARIO AL NACER EN /producto/anadir (GET)
    @GetMapping("/anadir")
    public String mostrarFormularioCrear(Model model) {
        // Lista de productos para mostrar en la misma página
        model.addAttribute("productos", productoService.listaProducto());
        // Lista de categorías para el select
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto());
        // Objeto vacío para el formulario
        model.addAttribute("producto", new Producto());
        return "producto/anadir";
    }

    // AÑADIR PRODUCTO
    @PostMapping("/anadir")
    public String CrearProducto(@ModelAttribute("producto") Producto producto, Model model){
        // Asegurar fecha de creación (campo NOT NULL en schema)
        if (producto.getFechaCreacion() == null) {
            producto.setFechaCreacion(LocalDate.now());
        }
        // Si el producto ya tiene id, actualizar en lugar de crear
        if (producto.getId() != 0) {
            productoService.updateProducto(producto);
        } else {
            productoService.CrearProducto(producto);
        }
        // recargar datos para la vista: la lista de productos y las categorías
        model.addAttribute("listaProductos", productoService.listaProducto());
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto());
        model.addAttribute("producto", new Producto());
        return "producto/catalogoProducto"; // mostrar JSP directamente
    }

    // MOSTRAR FORMULARIO DE EDICIÓN (rellenar formulario con datos existentes)
    @GetMapping("/editar/{id}")
    public String editarProducto(@PathVariable("id") int id, Model model) {
        Producto producto = productoService.findById(id); // buscar producto en BD
        model.addAttribute("producto", producto); // lo cargamos al form
        model.addAttribute("productos", productoService.listaProducto()); // tabla
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto()); // categorías
        return "producto/anadir"; // volvemos a la misma vista
    }

    // DESHABILITAR PRODUCTO
    @PostMapping("/deshabilitar")
    public String deshabilitarProducto(@RequestParam("id") Integer id, Model model) {
        productoService.cambiarEstado(id,false);
        model.addAttribute("productos", productoService.listaProducto());
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto());
        model.addAttribute("producto", new Producto());
        return "producto/anadir";
    }

    // HABILITAR PRODUCTO
    @PostMapping("/habilitar")
    public String habilitarProducto(@RequestParam("id") Integer id, Model model) {
        productoService.cambiarEstado(id,true);
        model.addAttribute("productos", productoService.listaProducto());
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto());
        model.addAttribute("producto", new Producto());
        return "producto/anadir";
    }


    @PostMapping("/actualizar")
    @ResponseBody
    public ResponseEntity<String> actualizarProducto(@RequestBody Producto producto) {
        try {
            productoService.updateProducto(producto);
            return ResponseEntity.ok("Producto actualizado");
        } catch (Exception e) {
            e.printStackTrace(); // para depurar
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al actualizar");
        }
    }   

    @GetMapping("/catalogo")
    public String mostrarCatalogo(Model model) {
        model.addAttribute("listaProductos", productoService.listaProducto());
        return "producto/catalogoProducto";
    }
    
    @SuppressWarnings("unchecked")
    @PostMapping("/agregarCarrito")
    public String agregarCarrito(@RequestParam("id") Integer id, HttpSession session) {
        // Obtener el producto de la base
        Producto producto = productoService.findById(id);
        if (producto == null || !producto.isActivo()) {
            return "redirect:/producto/catalogo"; // si no existe o está deshabilitado
        }

        // Obtener carrito de sesión o crear uno nuevo
        List<ProductoCarrito> carrito = (List<ProductoCarrito>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        // Revisar si ya existe en carrito
        boolean existe = false;
        for (ProductoCarrito item : carrito) {
            if (item.getId().equals(producto.getId())) {
                item.setCantidad(item.getCantidad() + 1);
                existe = true;
                break;
            }
        }
        if (!existe) {
            carrito.add(new ProductoCarrito(producto.getId(), producto.getNombre(), producto.getPrecio(), 1));
        }

        session.setAttribute("carrito", carrito);
        return "redirect:/producto/catalogo";
    }
    
    @SuppressWarnings("unchecked")
    @GetMapping("/verCarrito")
    public String verCarrito(Model model, HttpSession session) throws Exception{
        List<ProductoCarrito> carrito = (List<ProductoCarrito>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new ArrayList<>();
        }
        String carritoJson = new ObjectMapper().writeValueAsString(carrito);

        model.addAttribute("carrito", carrito);
        model.addAttribute("carritoJson", carritoJson);
        return "producto/carrito"; // JSP que crearemos para mostrar carrito
    }

    @SuppressWarnings("unchecked")
    @PostMapping("/eliminarCarrito")
    public String eliminarDelCarrito(@RequestParam("id") Integer id, HttpSession session) {
        List<ProductoCarrito> carrito = (List<ProductoCarrito>) session.getAttribute("carrito");
        if (carrito != null) {
            carrito.removeIf(item -> item.getId().equals(id));
            session.setAttribute("carrito", carrito);
        }
        return "redirect:/principal/carrito";
    }

     
}
