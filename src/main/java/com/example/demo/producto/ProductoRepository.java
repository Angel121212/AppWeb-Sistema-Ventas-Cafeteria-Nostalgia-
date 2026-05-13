package com.example.demo.producto;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.example.demo.tipoProducto.TipoProducto;

@Repository
public class ProductoRepository implements ProductoDAO{

    
    private final JdbcTemplate jdbcTemplate;

    public ProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    private final RowMapper<Producto> ProductoRowMapper = (rs, rowNum) -> {
        // Mapeamos según el schema: Producto y su relación con Categoria
        TipoProducto categoria = new TipoProducto(
                rs.getInt("categoria_id"),
                rs.getString("nombre_categoria"),
                rs.getDate("fechaCreacion_categoria") != null 
                    ? rs.getDate("fechaCreacion_categoria").toLocalDate() 
                    : null
        );
        Producto p = new Producto(
            rs.getInt("id"),
            rs.getString("nombre"),
            rs.getDouble("precio"),
            rs.getDate("fechaCreacion") != null 
                ? rs.getDate("fechaCreacion").toLocalDate() 
                : null,
            categoria

        );
        p.setActivo(rs.getBoolean("activo"));
        return p;
    };
    
    @Override
    public List<Producto> ProductoReporte(Integer categoriaId) {
        String query = "SELECT p.id as id, p.nombre as nombre, p.precio as precio, p.fechaCreacion as fechaCreacion, p.activo as activo, " +
                " c.id as categoria_id, c.nombre as nombre_categoria, c.fechaCreacion as fechaCreacion_categoria " +
                " FROM Producto p " +
                " JOIN Categoria c ON c.id = p.categoria_id " +
                " WHERE p.categoria_id = ?";
        return jdbcTemplate.query(query, ProductoRowMapper, categoriaId);
    }
    
        @Override
        public Producto CrearProducto(Producto producto) {
            String sql = "INSERT INTO Producto (nombre, precio, fechaCreacion, categoria_id, activo) VALUES (?, ?, ?, ?, ?)";
                jdbcTemplate.update(sql, 
                producto.getNombre(), 
                producto.getPrecio(), 
                java.sql.Date.valueOf(producto.getFechaCreacion()), 
                producto.getTipoProducto().getId(), 
                producto.isActivo());
            return producto;
        }
    
        @Override
        public List<Producto> listaProducto() {
            String sql = "SELECT p.id as id, p.nombre as nombre, p.precio as precio, p.fechaCreacion as fechaCreacion, p.activo as activo, " +
                    " c.id as categoria_id, c.nombre as nombre_categoria, c.fechaCreacion as fechaCreacion_categoria " +
                    " FROM Producto p JOIN Categoria c ON c.id = p.categoria_id";
            return jdbcTemplate.query(sql, ProductoRowMapper);
        }
    
        @Override
        public void cambiarEstado(int id, boolean activo) {
            String sql = "Update Producto SET activo = ? WHERE id = ?";
            jdbcTemplate.update(sql, activo,  id);
        }

        public void cambiarEstadoPorCategoria(int categoria_id, boolean activo) {
            String sql = "Update Producto SET activo = ? WHERE categoria_id = ?";
            jdbcTemplate.update(sql, activo, categoria_id);
        }

        @Override
        public Producto findById(int id) {
            String sql = "SELECT p.id as id, p.nombre as nombre, p.precio as precio, p.fechaCreacion as fechaCreacion, p.activo as activo,  " +
                    " c.id as categoria_id, c.nombre as nombre_categoria, c.fechaCreacion as fechaCreacion_categoria " +
                    " FROM Producto p JOIN Categoria c ON c.id = p.categoria_id WHERE p.id = ?";
            try {
                return jdbcTemplate.queryForObject(sql, ProductoRowMapper, id);
            } catch (Exception e) {
                return null; // si no existe
            }
        }

        @Override
        public void updateProducto(Producto producto) {
            String sql = "UPDATE Producto SET nombre=?, precio=?, categoria_id=?, activo=? WHERE id=?";
            jdbcTemplate.update(sql,
                producto.getNombre(),
                producto.getPrecio(),
                producto.getTipoProducto().getId(),
                producto.isActivo(),
                producto.getId()
                
            );
        }

        @Override
        public List<Producto> mostrarCatalogo() {
            String sql = "SELECT p.id as id, p.nombre as nombre, p.precio as precio, p.fechaCreacion as fechaCreacion, p.activo as activo, " +
                    " c.id as categoria_id, c.nombre as nombre_categoria, c.fechaCreacion as fechaCreacion_categoria " +
                    " FROM Producto p JOIN Categoria c ON c.id = p.categoria_id";
            return jdbcTemplate.query(sql, ProductoRowMapper); 
        }
}