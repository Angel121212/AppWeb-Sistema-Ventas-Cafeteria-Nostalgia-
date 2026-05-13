package com.example.demo.usuario;
import java.util.List;
import org.springframework.stereotype.Service;


@Service
public class UsuarioServiceImpl implements UsuarioService {
    
    private final UsuarioDAO clienteDAO;

    public UsuarioServiceImpl(UsuarioDAO clienteDAO) {
        this.clienteDAO = clienteDAO;
    }

    @Override
    public List<Usuario> listaClientes() {
        return clienteDAO.listaClientes();
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        clienteDAO.crearUsuario(usuario);
    }

    @Override
    public Usuario loginUsuario(Usuario usuario) { 
        clienteDAO.loginUsuario(usuario);
        return usuario;
    }

    @Override
    public Usuario buscarPorEmail(String email) {
        return clienteDAO.buscarPorEmail(email);
    }

    @Override
    public void cambiarEstado(int id, boolean activo) {
        Usuario cliente=clienteDAO.findById(id);
        if (cliente!=null) {
            //Cambiar estado de la categoria
            cliente.setActivo(activo);
            clienteDAO.updateUsuario(cliente);
        }
    }

    @Override
    public void updateUsuario(Usuario usuario) {
        clienteDAO.updateUsuario(usuario);
    }

    @Override
    public Usuario findById (int id) {
         return clienteDAO.findById(id);
    }

}
