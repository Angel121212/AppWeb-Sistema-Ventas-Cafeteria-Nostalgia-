package com.example.demo.tipoProducto;

import java.util.List;
import java.sql.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TipoProductoRepository implements TipoProductoDAO {

    private final JdbcTemplate jdbcTemplate;

    public TipoProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<TipoProducto> tipoProductoRowMapper = (rs, rowNum) -> {
        TipoProducto t = new TipoProducto();
        t.setId(rs.getInt("id"));
        t.setNombre(rs.getString("nombre"));
        t.setFechaCreacion(rs.getDate("fechaCreacion") != null
                ? rs.getDate("fechaCreacion").toLocalDate()
                : null);
        t.setActivo(rs.getBoolean("activo"));
        return t;
    };

    @Override
    public TipoProducto crearTipoProducto(TipoProducto tipoProducto) {
        String sql = "INSERT INTO Categoria (nombre, fechaCreacion, activo) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, tipoProducto.getNombre(), Date.valueOf(tipoProducto.getFechaCreacion()),
                tipoProducto.isActivo());
        return tipoProducto;
    }

    @Override
    public List<TipoProducto> listaTipoProducto() {
        String sql = "SELECT id, nombre, fechaCreacion, activo FROM Categoria";
        return jdbcTemplate.query(sql, tipoProductoRowMapper);
    }

    @Override
    public TipoProducto findById(int id) {
        String sql = "SELECT id, nombre, fechaCreacion, activo FROM Categoria WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, tipoProductoRowMapper, id);
        } catch (Exception e) {
            return null; // si no existe
        }
    }

    @Override
    public void cambiarEstado(int id, boolean activo) {
        String sql = "UPDATE Categoria SET activo = ? WHERE id = ?";
        jdbcTemplate.update(sql, activo, id);
    }

    @Override
    public boolean existePorNombre(String nombre) {
        String sql = "SELECT COUNT(*) FROM Categoria WHERE nombre = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, nombre);
        return count != null && count > 0;
    }

    @Override
    public void updatetipoProducto(TipoProducto tipoProducto) {
        String sql = "UPDATE Categoria SET nombre = ?, fechaCreacion = ?, activo = ? WHERE id = ?";
        // Convertir LocalDate a java.sql.Date solo si no es null
        java.sql.Date fecha = tipoProducto.getFechaCreacion() != null
                ? java.sql.Date.valueOf(tipoProducto.getFechaCreacion())
                : null;
        jdbcTemplate.update(sql,
                tipoProducto.getNombre(),
                fecha,
                tipoProducto.isActivo(),
                tipoProducto.getId());
    }

    @Override
    public List<TipoProducto> mostrarCatalogo() {
        String sql = "SELECT id, nombre, fechaCreacion, activo FROM Categoria";
        return jdbcTemplate.query(sql, tipoProductoRowMapper);
    }
}
