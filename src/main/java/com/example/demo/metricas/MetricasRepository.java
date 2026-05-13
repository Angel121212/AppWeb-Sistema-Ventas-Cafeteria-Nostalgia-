package com.example.demo.metricas;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MetricasRepository implements MetricasDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public List<Map<String, Object>> obtenerVentasMensuales(int año) {
        String sql = "SELECT EXTRACT(MONTH FROM fechaCreacion) as mes, SUM(total) as total " +
                    "FROM Compra " +
                    "WHERE EXTRACT(YEAR FROM fechaCreacion) = ? " +
                    "GROUP BY EXTRACT(MONTH FROM fechaCreacion) " +
                    "ORDER BY mes";
        
        try {
            return jdbcTemplate.queryForList(sql, año);
        } catch (DataAccessException e) {
            System.err.println("Error al obtener ventas mensuales: " + e.getMessage());
            throw new RuntimeException("Error al cargar ventas mensuales: " + e.getMessage(), e);
        }
    }
    
    @Override
    public List<Map<String, Object>> obtenerProductosPopulares(int mesInicio, int mesFin, int limite) {
        String sql = "SELECT p.nombre, SUM(dc.cantidad) as total_vendido " +
                    "FROM DetalleCompra dc " +
                    "JOIN Producto p ON dc.producto_id = p.id " +
                    "JOIN Compra c ON dc.compra_id = c.id " +
                    "WHERE EXTRACT(MONTH FROM c.fechaCreacion) BETWEEN ? AND ? " +
                    "GROUP BY p.nombre " +
                    "ORDER BY total_vendido DESC " +
                    "LIMIT ?";
        
        try {
            return jdbcTemplate.queryForList(sql, mesInicio, mesFin, limite);
        } catch (DataAccessException e) {
            System.err.println("Error al obtener productos populares: " + e.getMessage());
            throw new RuntimeException("Error al cargar productos populares: " + e.getMessage(), e);
        }
    }
    
    @Override
    public List<Map<String, Object>> obtenerComparativaProductos(int año) {
        String sql = "SELECT " +
                    "EXTRACT(MONTH FROM c.fechaCreacion) as mes, " +
                    "SUM(CASE WHEN p.categoria_id = 1 THEN dc.cantidad ELSE 0 END) as cafes, " +
                    "SUM(CASE WHEN p.categoria_id IN (2, 3) THEN dc.cantidad ELSE 0 END) as tortas " +
                    "FROM DetalleCompra dc " +
                    "JOIN Producto p ON dc.producto_id = p.id " +
                    "JOIN Compra c ON dc.compra_id = c.id " +
                    "WHERE EXTRACT(YEAR FROM c.fechaCreacion) = ? " +
                    "GROUP BY EXTRACT(MONTH FROM c.fechaCreacion) " +
                    "ORDER BY mes";
        
        try {
            return jdbcTemplate.queryForList(sql, año);
        } catch (DataAccessException e) {
            System.err.println("Error al obtener comparativa: " + e.getMessage());
            throw new RuntimeException("Error al cargar comparativa de productos: " + e.getMessage(), e);
        }
    }
}