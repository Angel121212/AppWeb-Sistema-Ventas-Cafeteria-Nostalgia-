package com.example.demo.usuario;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
    private final UsuarioService usuarioService;


    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping("/lista")
    public String mostrarLista(Model model) {
        model.addAttribute("usuarios", usuarioService.listaClientes());
        return "usuarios";
    }

    @GetMapping("/registrar")
    public String mostrarFormulario(Model model){
        model.addAttribute("usuario", new Usuario());
        return "registrar";
    }

    @PostMapping("/registrar")
    public String crearUsuario(@ModelAttribute("usuario") Usuario usuario, Model model){
        // Validar que las contraseñas coincidan
        if (!usuario.getContrasena().equals(usuario.getConfirmarContrasena())) {
            model.addAttribute("error", "Las contraseñas no coinciden");
            return "registrar"; // vuelve al formulario con el error
        }

        // Validar longitud mínima
        if (usuario.getContrasena().length() < 6) {
            model.addAttribute("error", "La contraseña debe tener al menos 6 caracteres");
            return "registrar";
        }
        usuario.setFechaCreacion(LocalDate.now()); //Establece fecha de creacion actual
        usuarioService.crearUsuario(usuario); //Guarda el usuario en la base de datos
        return "redirect:/principal/login"; //Redirige al login despues de registrarse
    }
    
    @GetMapping("/login")
    public String mostrarLogin(Model model){
        model.addAttribute("usuario", new Usuario());
        return "login";
    }

    @PostMapping("/login")
    public String loginUsuario(@ModelAttribute("usuario") Usuario usuario, Model model, HttpSession session){
        Usuario usuarioDB = usuarioService.buscarPorEmail(usuario.getEmail()); //Busca el usuario por email
        //validar si el usuario existe
        if (usuarioDB == null) {
            model.addAttribute("error", "No existe un usuario con ese correo");
            return "login";
        }
        //valida si la contraseña es correcta
        if (!usuarioDB.getContrasena().equals(usuario.getContrasena())) {
            model.addAttribute("error", "Contraseña incorrecta");
            return "login";
        }
        //valida si el usuario esta inactivo
        if (!usuarioDB.isActivo()){
            model.addAttribute("error", "Usuario deshabilitado");
            return "login";
        }

        session.setAttribute("usuarioLogueado", usuarioDB); //Guarda el usuario en la sesion
        
        return "redirect:/principal/index"; //Redirige al la pagina principal despues de iniciar sesion
    }

    @GetMapping("/logout")
    public String logoutUsuario(HttpSession session){
        session.invalidate(); //Invalida la sesion actual
        return "redirect:/principal/index";
    }

    //Deshabilitar
	@PostMapping("/deshabilitar")
	public String deshabilitarUsuario(@RequestParam("id") Integer id, HttpSession session, Model model) {
        usuarioService.cambiarEstado(id, false);
        Usuario usuarioLogueado =(Usuario) session.getAttribute("usuarioLogueado");

        if(usuarioLogueado.getRol() == 1){
            model.addAttribute("usuarios", usuarioService.listaClientes());
            model.addAttribute("usuario", new Usuario());
            return "usuarios";
        }

        if(usuarioLogueado.getRol() == 0){
            session.invalidate();
            return "redirect:/principal/index";
        }
        // Cualquier otro caso → redirigir al index
        return "redirect:/principal/index";
        
	}

    //Habilitar
	@PostMapping("/habilitar")
	public String habilitarUsuario(@RequestParam("id") Integer id, Model model) {
		usuarioService.cambiarEstado(id, true);
		model.addAttribute("usuarios", usuarioService.listaClientes());
		model.addAttribute("usuario", new Usuario());
		return "usuarios";
	}

    @PostMapping("/actualizar")
    public String actualizarUsuario(@ModelAttribute Usuario usuario, HttpSession session) {
        usuarioService.updateUsuario(usuario);
        session.setAttribute("usuarioLogueado", usuario);
        return "redirect:/principal/panelUsuario";
    }  
    
}
