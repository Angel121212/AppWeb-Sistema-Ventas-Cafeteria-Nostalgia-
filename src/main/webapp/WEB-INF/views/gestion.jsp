<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Gestión</title>
            <link
                href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap"
                rel="stylesheet">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gestion.css">
        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="header.jsp" %>

                <main class="container">
                    <section id="ventas" class="card">
                    <h2>Gestión de Ventas</h2>
                    <p class="muted">Historial de ventas</p>

                    <div class="card half">
                        <!-- Botón desplegable -->
                        <a href="/compra/lista"><button class="btn btn-primary" type="button">Ver Detalle de Ventas</button></a>
                    </div>
                    
                    <!-- Resumen de Ventas -->
                    <p class="muted">Resumen de ventas</p>
                    <div class="card half">
                        <!-- Botón para desplegar -->
                        <button class="btn btn-primary" onclick="toggleResumen()">Ver Resumen de Ventas</button>

                        <!-- Resumen oculto -->
                        <a>
                            <div id="resumen-ventas" class="card small" style="display: none; margin-top: 10px;">
                                <p><strong>Total de Ventas:</strong> <span>${totalVentas}</span></p>
                                <p><strong>Monto Total Vendido:</strong> S/. <span id="res-monto">${montoTotal}</span></p>
                                <p><strong>Clientes Atendidos:</strong> <span id="res-clientes">${clientesAtendidos}</span></p>
                            </div>
                        </a>
                    </div>
                    </section>


                    <section id="usuario" class="card">
                    <h2>Gestión de Usuarios</h2>
                    <p class="muted">Usuarios Registrados</p>

                    <div class="card half">
                        <!-- Botón desplegable -->
                        <a href="/usuario/lista"><button class="btn btn-primary" type="button">Ver Usuarios Registrados</button></a>
                    </div>
                    </section>

                    <section id="CRUD" class="card">
                    <h2>Añadir nuevo producto / tipo de producto</h2>

                    <div class="card half">
                        <a href="/tipoproducto/crear"><button class="btn btn-primary" type="button">Crear Tipo de Producto</button></a>
                        <a href="/producto/anadir"><button class="btn btn-primary" type="button">Crear Producto</button></a>
                    </div>
                    </section>
                    
                    <section id="metricas" class="card">
                    <h2>Metricas</h2>
                    <p class="muted">Estadísticas mensuales</p>

                    <div class="card half">
                        <a href="/principal/metricas"><button class="btn btn-primary" type="button">Ver Metricas</button></a>
                    </div>
                    </section>

                </main>


                <!-- PIE -->
                <%@ include file="footer.jsp" %>

                <script>
                    let ventas = [];

                    function toggleResumen() {
                    const resumen = document.getElementById("resumen-ventas");
                    resumen.style.display = resumen.style.display === "none" ? "block" : "none";
                    }

                    function actualizarResumen() {
                    let totalVentas = ventas.length;
                    let montoTotal = ventas.reduce((sum, v) => sum + v.total, 0);
                    let clientes = new Set(ventas.map(v => v.cliente)).size;
                    }
                </script>

        </body>
        

        </html>