<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Cafetería Nostalgia</title>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metricas.css">
    </head>


    <body>
      <%@ include file="header.jsp" %>

        <section class="metricas">
          <h2>Nuestras Métricas</h2>
          <div class="cards">

            <!-- Gráfico 1: Ventas Mensuales -->
            <div class="card">
              <h3>Ventas Mensuales 2025 (S/)</h3>
              <canvas id="graficoBarras"></canvas>
            </div>

            <!-- Gráfico 2: Productos Populares -->
            <div class="card">
              <h3>Productos Más Vendidos (Ene-Jun)</h3>
              <canvas id="graficoBarrasProductos"></canvas>
            </div>

            <!-- Gráfico 3: Comparativa -->
            <div class="card">
              <h3>Comparativa Cafés vs Tortas</h3>
              <canvas id="graficoLinea"></canvas>
            </div>
          </div>
        </section>

        <%@ include file="footer.jsp" %>

          <script>
            // Gráfico 1: Ventas Mensuales
            new Chart(document.getElementById('graficoBarras'), {
              type: 'bar',
              data: {
                labels: [<c:forEach var="venta" items="${ventasMensuales}">'${venta.mes == 1 ? "Enero" : venta.mes == 2 ? "Febrero" : venta.mes == 3 ? "Marzo" : venta.mes == 4 ? "Abril" : venta.mes == 5 ? "Mayo" : venta.mes == 6 ? "Junio" : "Mes " + venta.mes}',</c:forEach>],
                datasets: [{
                  label: 'Ventas (S/)',
                  data: [<c:forEach var="venta" items="${ventasMensuales}">${venta.total},</c:forEach>],
                  backgroundColor: '#8B4513'
                }]
              },
              options: {
                responsive: true,
                scales: {
                  y: {
                    beginAtZero: true,
                    title: { display: true, text: 'Soles (S/)' }
                  }
                }
              }
            });

            // Gráfico 2: Productos Populares
            new Chart(document.getElementById('graficoBarrasProductos'), {
              type: 'bar',
              data: {
                labels: [<c:forEach var="prod" items="${productosPopulares}">'${prod.nombre}',</c:forEach>],
                datasets: [{
                  label: 'Unidades vendidas',
                  data: [<c:forEach var="prod" items="${productosPopulares}">${prod.total_vendido},</c:forEach>],
                  backgroundColor: ['#6f4e37', '#b8860b', '#d2b48c', '#deb887', '#a0522d']
                }]
              },
              options: {
                responsive: true,
                scales: {
                  y: {
                    beginAtZero: true,
                    title: {
                      display: true,
                      text: 'Unidades vendidas'
                    }
                  }
                }
              }
            });

            // Gráfico 3: Comparativa
            new Chart(document.getElementById('graficoLinea'), {
              type: 'line',
              data: {
                labels: [<c:forEach var="comp" items="${comparativaProductos}">'${comp.mes == 1 ? "Enero" : comp.mes == 2 ? "Febrero" : comp.mes == 3 ? "Marzo" : comp.mes == 4 ? "Abril" : comp.mes == 5 ? "Mayo" : comp.mes == 6 ? "Junio" : "Mes " + comp.mes}',</c:forEach>],
                datasets: [
                  {
                    label: 'Cafés Vendidos',
                    data: [<c:forEach var="comp" items="${comparativaProductos}">${comp.cafes},</c:forEach>],
                    borderColor: '#6f4e37',
                    backgroundColor: 'rgba(111, 78, 55, 0.2)',
                    tension: 0.3,
                    fill: true
                  },
                  {
                    label: 'Tortas Vendidas',
                    data: [<c:forEach var="comp" items="${comparativaProductos}">${comp.tortas},</c:forEach>],
                    borderColor: '#d2691e',
                    backgroundColor: 'rgba(210, 105, 30, 0.2)',
                    tension: 0.3,
                    fill: true
                  }
                ]
              },
              options: {
                responsive: true,
                scales: {
                  y: { beginAtZero: true }
                }
              }
            });
          </script>
    </body>

    </html>