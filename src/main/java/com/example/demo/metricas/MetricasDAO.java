package com.example.demo.metricas;

import java.util.List;
import java.util.Map;

public interface MetricasDAO {
    List<Map<String, Object>> obtenerVentasMensuales(int año);
    List<Map<String, Object>> obtenerProductosPopulares(int mesInicio, int mesFin, int limite);
    List<Map<String, Object>> obtenerComparativaProductos(int año);
}