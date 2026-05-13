<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">


        <head>
            
            <style>
                /* ============================ */
                /* ENCABEZADO */
                /* ============================ */
                header.encabezado {
                    position: sticky;
                    top: 0;
                    z-index: 999;
                    background: var(--principal);
                    border-bottom: 3px solid rgba(0, 0, 0, 0.4);
                }

                .contenedor {
                    max-width: 1500px;
                    margin: 0 auto;
                    padding: 18px 22px;
                    display: flex;
                    align-items: center;
                    gap: 12px
                }

                .marca {
                    font-family: "Playfair Display", serif;
                    font-weight: 700;
                    color: var(--blanco);
                    font-size: 18px;
                }

                nav.navegacion {
                    margin-left: auto
                }

                nav.navegacion ul {
                    display: flex;
                    gap: 22px;
                    list-style: none;
                    margin: 0;
                    padding: 0;
                }

                nav.navegacion a {
                    color: var(--blanco);
                    font-size: 13px;
                    text-transform: uppercase;
                    letter-spacing: .08em;
                    opacity: .95;
                }

                nav.navegacion a:hover {
                    opacity: 1;
                    color: var(--acento)
                }


                .usuario-icono,
                .carrito-icono {
                    margin-left: 50px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .usuario-icono:hover
                .carrito-icono:hover {
                    cursor: pointer;
                    color: var(--acento);
                    opacity: 0.8;
                }
            </style>
        </head>
        
        <!-- ENCABEZADO -->
        <header class="encabezado">
        <div class="contenedor">
            <a href="/principal/index" class="marca">Cafeteria Nostalgia</a>
            <nav class="navegacion">
                <ul>
                    <li><a href="/principal/index#productos">Cafés</a></li>
                    <li><a href="/principal/index#productos">Postres</a></li>
                    <li><a href="/principal/servicios">Servicios</a></li>
                    <li><a href="/principal/nosotros">Sobre Nosotros</a></li>
                    <li><a href="/principal/contacto">Contáctenos</a></li>
                    <li><a href="/principal/productos">Productos</a></li>
                    <c:if test="${sessionScope.usuarioLogueado.rol == 1}">
                        <li><a href="/principal/gestion">Gestión</a></li>
                    </c:if>
                </ul>
            </nav>
            <div class="carrito-icono">
                <c:if test="${sessionScope.usuarioLogueado.rol == null}">
                    <a class="enlace-carrito" href="/principal/login"><svg xmlns="http://www.w3.org/2000/svg" height="20px" fill="currentColor" 
                        viewBox="0 0 16 16">
                        <path 
                            d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                        </svg></a>
                </c:if>
                <c:if test="${sessionScope.usuarioLogueado.rol == 0 || sessionScope.usuarioLogueado.rol == 1}">
                    <a class="enlace-carrito" href="/principal/carrito"><svg xmlns="http://www.w3.org/2000/svg" height="20px" fill="currentColor" 
                        viewBox="0 0 16 16">
                        <path 
                            d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                        </svg></a>
                </c:if>
            </div>
            <div class="usuario-icono">
                <c:if test="${sessionScope.usuarioLogueado == null}">
                    <a class="boton-secundario" href="/principal/login"><svg xmlns="http://www.w3.org/2000/svg" height="24px"
                            viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                            <path
                                d="M234-276q51-39 114-61.5T480-360q69 0 132 22.5T726-276q35-41 54.5-93T800-480q0-133-93.5-226.5T480-800q-133 0-226.5 93.5T160-480q0 59 19.5 111t54.5 93Zm246-164q-59 0-99.5-40.5T340-580q0-59 40.5-99.5T480-720q59 0 99.5 40.5T620-580q0 59-40.5 99.5T480-440Zm0 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q53 0 100-15.5t86-44.5q-39-29-86-44.5T480-280q-53 0-100 15.5T294-220q39 29 86 44.5T480-160Zm0-360q26 0 43-17t17-43q0-26-17-43t-43-17q-26 0-43 17t-17 43q0 26 17 43t43 17Zm0-60Zm0 360Z" />
                            </svg></a>
                </c:if>
                <c:if test="${sessionScope.usuarioLogueado.rol == 0 || sessionScope.usuarioLogueado.rol == 1}">
                    <a class="boton-secundario" href="/principal/panelUsuario"><svg xmlns="http://www.w3.org/2000/svg" height="24px"
                            viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                            <path
                                d="M234-276q51-39 114-61.5T480-360q69 0 132 22.5T726-276q35-41 54.5-93T800-480q0-133-93.5-226.5T480-800q-133 0-226.5 93.5T160-480q0 59 19.5 111t54.5 93Zm246-164q-59 0-99.5-40.5T340-580q0-59 40.5-99.5T480-720q59 0 99.5 40.5T620-580q0 59-40.5 99.5T480-440Zm0 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q53 0 100-15.5t86-44.5q-39-29-86-44.5T480-280q-53 0-100 15.5T294-220q39 29 86 44.5T480-160Zm0-360q26 0 43-17t17-43q0-26-17-43t-43-17q-26 0-43 17t-17 43q0 26 17 43t43 17Zm0-60Zm0 360Z" />
                            </svg>
                    </a>
                </c:if>
            </div>
            

        </div>

    </header>