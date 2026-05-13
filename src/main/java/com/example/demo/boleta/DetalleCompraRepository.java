package com.example.demo.boleta;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.compra.Compra;
import com.example.demo.producto.Producto;

import org.springframework.jdbc.core.RowMapper;
 
@Repository
public class DetalleCompraRepository implements DetalleCompraDAO{
    
    private final JdbcTemplate jdbcTemplate;

    public DetalleCompraRepository(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @SuppressWarnings("unused")
    private final RowMapper<DetalleCompra> detalleRowMapper = (rs, rowNum) -> {
        DetalleCompra detalle = new DetalleCompra();

        Compra compra =new Compra();
        compra.setId(rs.getInt("compra_id"));
        detalle.setCompra(compra);

        Producto producto = new Producto();
        producto.setId(rs.getInt("producto_id"));
        detalle.setProducto(producto);
        
        detalle.setCantidad(rs.getInt("cantidad"));
        detalle.setSubtotal(rs.getDouble("subtotal"));
        return detalle;
    };

    @Override
    public void crearDetalleCompra(DetalleCompra detalle){
        String sql= "INSERT INTO DetalleCompra (compra_id, producto_id, cantidad,subtotal) VALUES (?,?,?,?)";
        jdbcTemplate.update(sql,
        detalle.getCompra().getId(),
        detalle.getProducto().getId(),
        detalle.getCantidad(),
        detalle.getSubtotal()
        );
    }
}
