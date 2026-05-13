package com.example.demo.usuario;

import java.util.List;

public interface UsuarioService {
    
    public List<Usuario> listaClientes();
    void crearUsuario(Usuario usuario);
    Usuario loginUsuario(Usuario usuario);
    Usuario buscarPorEmail(String email);
    void cambiarEstado(int id, boolean activo);
    void updateUsuario(Usuario usuario);
    Usuario findById(int id);
}
