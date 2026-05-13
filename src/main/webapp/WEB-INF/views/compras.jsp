<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CRUD Compras</title>
                       <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/compras.css">

        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="/WEB-INF/views/header.jsp" %>

                <main>
                    <h2>Lista de Ventas</h2>
                        <div id="usuario-detalle" style="margin-top: 15px;">
                        <table border="1" style="width:100%; border-collapse: collapse; text-align:center;">
                            <thead>
                            <tr>
                                <th>Cliente</th>
                                <th>Total(S/.)</th>
                                <th>Fecha</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${compras}">
                                    <tr id="row-${c.id}">
                                        <td>${c.usuario.nombre}</td>
                                        <td>${c.total}</td>
                                        <td>${c.fechaCreacion}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        </div>
                </main>

        <!-- PIE -->
        <%@ include file="/WEB-INF/views/footer.jsp" %>

        </html>