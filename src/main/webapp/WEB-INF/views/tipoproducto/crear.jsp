<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CRUD TipoProducto Cafetería</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/crear.css">
        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="/WEB-INF/views/header.jsp" %>

                <main>
                    <h2>Agregar Tipo de Producto</h2>
                        <form:form action="/tipoproducto/crear" method="post" modelAttribute="tipoProducto">
                            <form:input path="nombre" type="text" placeholder="Nombre del tipo producto" required="true" />
                            <form:input path="fechaCreacion" type="date" required="true" />
                            <button type="submit" class="btn-primary">Agregar Tipo Producto</button>
                        </form:form>

                            <h2>Lista de Productos</h2>
                            <table>
                            <thead>
                                <tr>
                                <th>ID</th>
                                <th>Tipo de Producto</th>
                                <th>Fecha de Creación</th>
                                <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="t" items="${listaTipos}">
                                    <tr id="row-${t.id}" class="${!t.activo ? 'deshabilitado': ''}">
                                        <td>${t.id}</td>
                                        <td>
                                            <span class="view">${t.nombre}</span>
                                            <input class="edit-input" type="text" name="nombre" value="${t.nombre}" style="display:none;" />
                                        </td>
                                        <td>
                                            <span class="view">${t.fechaCreacion}</span>
                                            <input class="edit-input" type="date" name="fechaCreacion" value="${t.fechaCreacion}" style="display:none;" />
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${t.activo}">
                                                    <button type="button" class="btn edit" onclick="editarFila('${t.id}')">Editar</button>
                                                    <button type="button" class="btn save" onclick="guardarFila('${t.id}')" style="display:none;">Guardar</button>
                                                    <form action="${pageContext.request.contextPath}/tipoproducto/deshabilitar" method="post" style="display:inline">
                                                        <input type="hidden" name="id" value="${t.id}" />
                                                        <button type="submit" class="btn delete" onclick="return confirm('¿Seguro que deseas deshabilitar este producto?');">
                                                            Eliminar
                                                        </button>
                                                    </form>
                                                </c:when>
                                                <c:otherwise>
                                                    <form action="${pageContext.request.contextPath}/tipoproducto/habilitar" method="post" style="display:inline">
                                                        <input type="hidden" name="id" value="${t.id}"/>
                                                        <button type="submit" class="btn habilitar">Habilitar</button>
                                                    </form>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                        </tbody>
                    </table>
                </main>
        </body>

        <script>
        const contextPath = '${pageContext.request.contextPath}';
        function editarFila(id) {
            const row = document.getElementById("row-" + id);
            row.querySelectorAll(".view").forEach(el => el.style.display = "none");
            row.querySelectorAll(".edit-input").forEach(el => el.style.display = "inline-block");
            row.querySelector(".edit").style.display = "none";
            row.querySelector(".save").style.display = "inline-block"; // se mostrará ahora
        }

        function guardarFila(id) {
            const row = document.getElementById("row-" + id);
            const nombre = row.querySelector("input[name='nombre']").value.trim();
            const fechaCreacion = row.querySelector("input[name='fechaCreacion']").value;

            fetch("/tipoproducto/actualizar", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    id: parseInt(id),
                    nombre: nombre,
                    fechaCreacion: fechaCreacion
                })
            }).then(r => {
                if (r.ok) {
                    row.querySelectorAll(".view")[0].textContent = nombre;
                    row.querySelectorAll(".view")[1].textContent = fechaCreacion;
                    row.querySelectorAll(".view").forEach(el => el.style.display = "inline");
                    row.querySelectorAll(".edit-input").forEach(el => el.style.display = "none");
                    row.querySelector(".edit").style.display = "inline-block";
                    row.querySelector(".save").style.display = "none";
                } else {
                    alert("Error al guardar los cambios");
                }
            }).catch(err => alert("Error al conectar con el servidor"));
        }
        </script>

        <!-- PIE -->
        <%@ include file="/WEB-INF/views/footer.jsp" %>

        </html>