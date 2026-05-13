<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <head>
            <style>
                /* ============================ */
                /* PIE DE PÁGINA */
                /* ============================ */
                footer.pie {
                    background: var(--principal);
                    color: var(--secundario);
                    padding: 22px 22px;
                }
                
                .pie-interno {
                    max-width: var(--maxw);
                    margin: 0 auto;
                    display: flex;
                    justify-content: space-between;
                }

                .pie-izq {
                    font-family: "Playfair Display", serif;
                    color: var(--blanco)
                }

                .pie-izq small {
                    display: block;
                    color: var(--secundario);
                    margin-top: 8px;
                }

                .pie-der nav {
                    display: flex;
                    gap: 18px;
                }

                .pie-der a {
                    color: var(--blanco);
                    text-transform: uppercase;
                    font-size: 12px;
                    letter-spacing: .08em
                }

                .pie-der a:hover {
                    color: var(--acento)
                }
                
            </style>
        </head>
        <footer class="pie">
        <div class="pie-interno">
            <div class="pie-izq">
                <div style="font-size:18px; font-weight:700">Cafeteria Nostalgia</div>
                <small>Copyright © 2025 Todos los derechos reservados</small>
                <small>Desarrollado por UTPSoft - Desarrolladores
                    Unidos</small>
                    <a href="/principal/terminos">Términos y Condiciones</a>
            </div>
            <div class="pie-der">
                <nav>
                    <a href="/principal/index#inicio">Inicio</a>
                    <a href="/principal/index#productos">Cafés</a>
                    <a href="/principal/index#productos">Postres</a>
                    <a href="/principal/servicios">Servicios</a>
                    <a href="/principal/nosotros">Sobre Nosotros</a>
                    <a href="/principal/contacto">Contáctenos</a>
                    <a href="/principal/productos">Productos</a>
                    <c:if test="${sessionScope.usuarioLogueado.rol == 1}">
                        <a href="/principal/gestion">Gestión</a>
                    </c:if>
                </nav>
            </div>
        </div>
    </footer>