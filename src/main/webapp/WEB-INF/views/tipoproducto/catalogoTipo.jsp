<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CatálogoTipo - Cafetería</title>
            <link href="../CSS/catalogo.css" rel="stylesheet">
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/catalogoTipo.css">
        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="/WEB-INF/views/header.jsp" %>
                <main>
                    <h2>Catálogo</h2>
                    <c:if test="${sessionScope.usuarioLogueado.rol == 1}">
                        <a class="btn-primary" href="/tipoproducto/crear">Volver a Crear Tipo de Producto</a>
                    </c:if>
                    <div class="catalogo">
                        <c:forEach var="tipo" items="${listaTipos}">
                            <c:if test="${tipo.activo == true}">
                                <div class="card" data-categoria="${tipo.nombre}">
                                    <h3>${tipo.nombre}</h3>
                                    <p>Descripción del tipo de producto</p>
                                    <c:if test="${sessionScope.usuarioLogueado.rol == 0 || sessionScope.usuarioLogueado.rol == 1 || sessionScope.usuarioLogueado.rol == null}">
                                        <button><a href="/producto/catalogo">Ver Productos</a></button>
                                    </c:if>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </main>
        </body>
        <!-- PIE -->
        <%@ include file="/WEB-INF/views/footer.jsp" %>

        </html>