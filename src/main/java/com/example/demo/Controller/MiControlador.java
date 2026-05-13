package com.example.demo.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.compra.Compra;
import com.example.demo.compra.CompraService;
import com.example.demo.usuario.Usuario;
import com.example.demo.usuario.UsuarioService;

import jakarta.servlet.http.HttpSession;

// Para las métricas 
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.metricas.MetricasService; 


@Controller
@RequestMapping("/principal")
public class MiControlador {
   private final CompraService compraService;
   private final UsuarioService usuarioService;

    // Inyeccion de dependencias para métricas
    @Autowired
    private MetricasService metricasService;


    // constructor 
    public MiControlador(CompraService compraService, UsuarioService usuarioService) {
        this.compraService = compraService;
        this.usuarioService = usuarioService;
    }

    //funcion para cagar los datos
    private void cargarDatosGestion(Model model) {

        List<Compra> compras = compraService.listaCompra();

        int totalVentas = compras.size();

        double montoTotal = compras.stream()
                .mapToDouble(Compra::getTotal)
                .sum();

        long clientesAtendidos = compras.stream()
                .map(c -> c.getUsuario().getId())
                .distinct()
                .count();

        model.addAttribute("compras", compras);
        model.addAttribute("totalVentas", totalVentas);
        model.addAttribute("montoTotal", montoTotal);
        model.addAttribute("clientesAtendidos", clientesAtendidos);
    }


    @GetMapping("/productos")
    public String productos(Model model) {
        return "redirect:/tipoproducto/catalogo";
    }

    @GetMapping("/contacto")
    public String contacto(Model model) {
        return "contacto";
    }


    @GetMapping("/gestion")
    public String gestion(Model model) {
        cargarDatosGestion(model);
        return "gestion";
    }

    @GetMapping("/servicios")
    public String servicios(Model model) {
        return "servicios";
    }

    @GetMapping("/nosotros")
    public String nosotros(Model model) {
        return "nosotros";
    }
    
    @GetMapping("/metricas")
    public String metricas(Model model) {

        Map<String, Object> metricas = metricasService.obtenerMetricasCompletas();
    
        model.addAttribute("ventasMensuales", metricas.get("ventasMensuales"));
        model.addAttribute("productosPopulares", metricas.get("productosPopulares"));
        model.addAttribute("comparativaProductos", metricas.get("comparativaProductos"));

        return "metricas";
    }

    @GetMapping("/terminos")
    public String terminos(Model model) {
        return "terminos";
    }

    
    @GetMapping("/publicidad")
    public String publicidad(Model model) {
        return "publicidad";
    }

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/carrito")
    public String carrito(Model model) {
        
        return "carrito";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("usuario", new com.example.demo.usuario.Usuario());
        return "login";
    }

    @GetMapping("/registrar")
    public String registrar(Model model) {
        model.addAttribute("usuario", new com.example.demo.usuario.Usuario());
        return "registrar";
    }

    @GetMapping("/panelUsuario")
    public String panelUsuario(HttpSession session, Model model) {
        Usuario usuario =(Usuario) session.getAttribute("usuarioLogueado");
        if (usuario == null) {
            return "redirect:/principal/login";
        }
        // recargar desde la base de datos
        Usuario actualizado = usuarioService.findById(usuario.getId());
        model.addAttribute("usuario", actualizado);

        // actualizar la sesión con los datos nuevos
        session.setAttribute("usuarioLogueado", actualizado);
        return "usuarioPanel";  
    }
    
}   
