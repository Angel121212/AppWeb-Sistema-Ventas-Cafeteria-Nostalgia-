<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CatálogoProducto - Cafetería</title>
           <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/catalogoProducto.css">

        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="/WEB-INF/views/header.jsp" %>
                <main>
                    <h2>Catálogo</h2>
                    <c:if test="${sessionScope.usuarioLogueado.rol == 1}">
                        <a class="btn-primary" href="/producto/anadir">Volver a Crear Producto</a>
                    </c:if>
                    <div class="catalogo">
                        <c:forEach var="producto" items="${listaProductos}">
                            <c:if test="${producto.activo == true}">
                                <div class="card" data-categoria="${producto.tipoProducto.nombre}">
                                    <h3>${producto.nombre}</h3>
                                    <p>Precio: $${producto.precio}</p>
                                    <p>Categoría: ${producto.tipoProducto.nombre}</p>
                                    <form action="/producto/agregarCarrito" method="post">
                                        <input type="hidden" name="id" value="${producto.id}" />
                                        <c:if test="${sessionScope.usuarioLogueado.rol == null}">
                                            <button><a href="/principal/login">Comprar</a></button>
                                        </c:if>
                                        <c:if test="${sessionScope.usuarioLogueado.rol == 0 || sessionScope.usuarioLogueado.rol == 1}">
                                            <button type="submit" 
                                                    class="btn-comprar" 
                                                    data-id="${producto.id}" 
                                                    data-nombre="${producto.nombre}" 
                                                    data-precio="${producto.precio}"
                                                    onclick="alert('Agregado al carrito')">
                                                Comprar
                                            </button>
                                        </c:if>
                                    </form>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </main>
        </body>
        <!-- PIE -->
        <%@ include file="/WEB-INF/views/footer.jsp" %>
        </html>