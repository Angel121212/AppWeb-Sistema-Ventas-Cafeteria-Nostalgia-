package com.example.demo.tipoProducto;


import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/tipoproducto")
public class TipoProductoController {


	private final TipoProductoService tipoProductoService;


	public TipoProductoController(TipoProductoService tipoProductoService) {
		this.tipoProductoService = tipoProductoService;
	}

	 // Mostrar formulario
    @GetMapping("/crear")
    public String mostrarFormulario(Model model) {
        model.addAttribute("tipoProducto", new TipoProducto());
        model.addAttribute("listaTipos", tipoProductoService.listaTipoProducto());
        return "tipoproducto/crear";
	}


    // Guardar producto
    @PostMapping("/crear")
	public String guardarTipoProducto(TipoProducto tipoProducto, Model model) {
		boolean existe = tipoProductoService.existePorNombre(tipoProducto.getNombre());
		if(existe) {
			model.addAttribute("error", "Ya existe un tipo de producto con ese nombre.");
			model.addAttribute("tipoProducto", new TipoProducto());
			model.addAttribute("listaTipos", tipoProductoService.listaTipoProducto());
			return "tipoproducto/crear";
		}

		tipoProductoService.crearTipoProducto(tipoProducto); // guardar solo si no existe
		model.addAttribute("listaTipos", tipoProductoService.listaTipoProducto());
		model.addAttribute("tipoProducto", new TipoProducto());
		return "tipoproducto/catalogoTipo";
	}

	@GetMapping("/editar/{id}")
	public String editartipoProducto(@PathVariable("id") int id, Model model) {
		TipoProducto tipoProducto = tipoProductoService.findById(id); // buscar producto en BD
		model.addAttribute("tipoProducto", tipoProducto); 
		model.addAttribute("listaTipos", tipoProductoService.listaTipoProducto()); // tabla
		return "tipoproducto/crear"; // volvemos a la misma vista
	}
	

    @PostMapping("/actualizar")
	@ResponseBody
	public ResponseEntity<?> actualizarTipoProducto(@RequestBody TipoProducto tipoProducto) {
		try {
			tipoProductoService.updatetipoProducto(tipoProducto);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			e.printStackTrace();  // aquí verás la causa exacta en consola
			return ResponseEntity.status(500).body("Error: " + e.getMessage());
		}
	}

	//Deshabilitar
	@PostMapping("/deshabilitar")
	public String deshabilitarTipoProducto(@RequestParam("id") Integer id, Model model) {
		tipoProductoService.cambiarEstado(id, false);
		model.addAttribute("listaTipos", tipoProductoService.listaTipoProducto());
		model.addAttribute("tipoProducto", new TipoProducto());
		return "tipoproducto/crear";
	}

	//Habilitar
	@PostMapping("/habilitar")
	public String habilitarTipoProducto(@RequestParam("id") Integer id, Model model) {
		tipoProductoService.cambiarEstado(id, true);
		model.addAttribute("listaTipos", tipoProductoService.listaTipoProducto());
		model.addAttribute("tipoProducto", new TipoProducto());
		return "tipoproducto/crear";
	}
	
	@GetMapping("/catalogo")
    public String mostrarCatalogo(Model model) {
        model.addAttribute("listaTipos", tipoProductoService.listaTipoProducto());
        return "tipoproducto/catalogoTipo";
    }
	
}
