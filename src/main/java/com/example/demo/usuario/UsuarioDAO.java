package com.example.demo.usuario;

import java.util.List;

public interface UsuarioDAO {
    
    public List<Usuario> listaClientes();
    void crearUsuario(Usuario usuario);
    Usuario loginUsuario(Usuario usuario);
    Usuario buscarPorEmail(String email);
    void updateUsuario(Usuario usuario);
    Usuario findById(int id);
    void cambiarEstado(int id, boolean activo);

}
