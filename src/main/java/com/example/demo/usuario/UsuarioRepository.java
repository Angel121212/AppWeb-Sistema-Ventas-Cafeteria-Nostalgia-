package com.example.demo.usuario;

import org.springframework.jdbc.core.RowMapper;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;



@Repository
public class UsuarioRepository implements UsuarioDAO {
    private final JdbcTemplate jdbcTemplate;

    public UsuarioRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Usuario> UsuariorowMapper = (rs, rowNum) -> {
        Usuario u = new Usuario(
            rs.getInt("id"),
            rs.getString("nombre"),
            rs.getString("email"),
            rs.getString("contrasena"),
            rs.getDate("fechaCreacion") != null ? rs.getDate("fechaCreacion").toLocalDate() : null,
            rs.getInt("rol")
        );
        u.setActivo(rs.getBoolean("activo"));
        return u;
    };

    @Override
    public List<Usuario> listaClientes() {
        String sql = "SELECT u.id as id, u.nombre as nombre, u.email as email, u.contrasena as contrasena, u.fechaCreacion as fechaCreacion, u.rol as rol, u.activo as activo " +
                     "FROM Usuario u ";
        return jdbcTemplate.query(sql, UsuariorowMapper);
    }

    @Override
    public void crearUsuario(Usuario usuario) {
        String sql = "INSERT INTO Usuario (nombre, email, contrasena, fechaCreacion, rol, activo) VALUES (?, ?, ?, ?, 1, ?)";
        jdbcTemplate.update(sql, usuario.getNombre(), usuario.getEmail(), usuario.getContrasena(), java.sql.Date.valueOf(usuario.getFechaCreacion()), usuario.isActivo());
    }

    @Override
    public void updateUsuario(Usuario usuario) {
        String sql = "UPDATE Usuario SET nombre=?, email=?, contrasena=?, activo=? WHERE id=?";
        jdbcTemplate.update(sql,
            usuario.getNombre(),
            usuario.getEmail(),
            usuario.getContrasena(),
            usuario.isActivo(),
            usuario.getId()
        );
    }

    @Override
    public Usuario loginUsuario(Usuario usuario) { 
        String sql = "SELECT u.id as id, u.nombre as nombre, u.email as email, u.contrasena as contrasena, u.fechaCreacion as fechaCreacion, u.rol as rol, u.activo as activo " +
                    "FROM Usuario u " +
                    "WHERE u.email = ? AND u.contrasena = ?";
        List<Usuario> usuarios = jdbcTemplate.query(sql, UsuariorowMapper, usuario.getEmail(), usuario.getContrasena(), usuario.isActivo());
        return usuarios.isEmpty() ? null : usuarios.get(0);
    }

    @Override
    public Usuario buscarPorEmail(String email) {
        String sql = "SELECT * FROM Usuario where email = ?";
        List<Usuario> usuarios = jdbcTemplate.query(sql, UsuariorowMapper, email);
        return usuarios.isEmpty() ? null : usuarios.get(0); 
    }

    @Override
    public Usuario findById (int id) {
        String sql = "SELECT u.id as id, u.nombre as nombre, u.email as email, u.contrasena as contrasena, u.fechaCreacion as fechaCreacion, u.rol as rol, u.activo as activo " +
                    "FROM Usuario u " +
                    "WHERE u.id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, UsuariorowMapper, id);
        } catch (Exception e) {
            return null; // si no existe
        }
    }

    @Override
    public void cambiarEstado(int id, boolean activo) {
        String sql = "Update Usuario SET activo = ? WHERE id = ?";
        jdbcTemplate.update(sql, activo,  id);
    }
}
