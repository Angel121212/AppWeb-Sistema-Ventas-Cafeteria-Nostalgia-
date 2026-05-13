package com.example.demo.metricas;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Year;
import java.util.HashMap;
import java.util.Map;

@Service
public class MetricasServiceImpl implements MetricasService {
    
    @Autowired
    private MetricasDAO MetricasDAO;
    
    @Override
    public Map<String, Object> obtenerMetricasCompletas() {
        Map<String, Object> metricas = new HashMap<>();
        
        // Obtener datos para el año actual
        int añoActual = Year.now().getValue();
        
        metricas.put("ventasMensuales", MetricasDAO.obtenerVentasMensuales(añoActual));
        metricas.put("productosPopulares", MetricasDAO.obtenerProductosPopulares(1, 6, 5));
        metricas.put("comparativaProductos", MetricasDAO.obtenerComparativaProductos(añoActual));
        
        return metricas;
    }
}
