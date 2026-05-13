<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CRUD Usuarios</title>
           <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usuarios.css">
        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="/WEB-INF/views/header.jsp" %>

                <main>
                    <h2>Lista de Usuarios</h2>
                        <div id="usuario-detalle" style="margin-top: 15px;">
                        <table border="1" style="width:100%; border-collapse: collapse; text-align:center;">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Fecha de Registro</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${usuarios}">
                                    <tr id="row-${u.id}" class="${!u.activo ? 'deshabilitado' : ''}">
                                        <td>${u.id}</td>
                                        <td>${u.nombre}</td>
                                        <td>${u.email}</td>
                                        <td>${u.fechaCreacion}</td>
                                        <td>${u.rol}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${u.activo}">
                                                    <form action="/usuario/deshabilitar" method="post" style="display:inline">
                                                        <input type="hidden" name="id" value="${u.id}" />
                                                        <button type="submit" class="btn delete" onclick="return confirm('¿Seguro que deseas deshabilitar este usuario?');">Eliminar</button>
                                                    </form>
                                                </c:when>
                                                <c:otherwise>
                                                    <form action="/usuario/habilitar" method="post" style="display:inline">
                                                        <input type="hidden" name="id" value="${u.id}"/>
                                                        <button type="submit" class="btn habilitar">Habilitar</button>
                                                    </form>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        </div>
                </main>

        <!-- PIE -->
        <%@ include file="/WEB-INF/views/footer.jsp" %>

        </html>