<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>CRUD Producto Cafetería</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/anadir.css">
        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="/WEB-INF/views/header.jsp" %>

                <main>
                    <h2>Agregar Producto</h2>
                    <form:form action="/producto/anadir" method="post" modelAttribute="producto">
                        <form:input path="nombre" id="nombre" type="text" placeholder="Nombre del producto" required="true" />
                        <form:input path="precio" id="precio" type="number" placeholder="Precio (S/.)" required="true" />
                        <form:select path="tipoProducto.id" id="categoria" required="true">
                            <option value="">Categoría</option>
                            <form:options items="${categorias}" itemValue="id" itemLabel="nombre"/>
                        </form:select>
                        <button type="submit">Agregar Producto</button>
                    </form:form>

                    <h2>Lista de Productos</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th>Categoría</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${productos}">
                                <tr id="row-${p.id}" class="${!p.activo ? 'deshabilitado' : ''}">
                                    <td>${p.id}</td>
                                    <td>
                                        <span class="view">${p.nombre}</span>
                                        <input class="edit-input" type="text" name="nombre" value="${p.nombre}" style="display:none;" />
                                    </td>
                                    <td>
                                        <span class="view">${p.precio}</span>
                                        <input class="edit-input" type="number" name="precio" step="0.01" value="${p.precio}" style="display:none;" />
                                    </td>
                                    <td>
                                        <span class="view">${p.tipoProducto.nombre}</span>
                                        <select class="edit-input" name="tipoProducto.id" style="display:none;">
                                            <c:forEach var="cat" items="${categorias}">
                                                <option value="${cat.id}" ${cat.id == p.tipoProducto.id ? 'selected' : ''}>${cat.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p.activo}">
                                                <button type="button" class="btn edit" onclick="editarFila('${p.id}')">Editar</button>
                                                <button type="button" class="btn save" onclick="guardarFila('${p.id}')" style="display:none;">Guardar</button>
                                                <form action="/producto/deshabilitar" method="post" style="display:inline">
                                                    <input type="hidden" name="id" value="${p.id}" />
                                                    <button type="submit" class="btn delete" onclick="return confirm('¿Seguro que deseas deshabilitar este producto?');">Eliminar</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <form action="/producto/habilitar" method="post" style="display:inline">
                                                    <input type="hidden" name="id" value="${p.id}"/>
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
            function editarFila(id) {
            const row = document.getElementById("row-" + id);

            // Mostrar los inputs y ocultar los spans
            row.querySelectorAll(".view").forEach(el => el.style.display = "none");
            row.querySelectorAll(".edit-input").forEach(el => el.style.display = "inline-block");

            // Mostrar botón Guardar y ocultar Editar
            row.querySelector(".edit").style.display = "none";
            row.querySelector(".save").style.display = "inline-block";
        }

        function guardarFila(id) {
            const row = document.getElementById("row-" + id);

            // Tomar valores de los inputs
            const nombre = row.querySelector("input[name='nombre']").value;
            const precio = row.querySelector("input[name='precio']").value;
            const tipoId = row.querySelector("select[name='tipoProducto.id']").value;

            // Enviar datos al backend
            fetch("/producto/actualizar", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    id: parseInt(id),
                    nombre: nombre,
                    precio: parseFloat(precio),
                    tipoProducto: { id: parseInt(tipoId) }
                })
            }).then(r => {
                if (r.ok) {
                    // Actualizar la vista en la tabla
                    const cells = row.children;
                    cells[1].querySelector(".view").textContent = nombre;
                    cells[2].querySelector(".view").textContent = precio;
                    cells[3].querySelector(".view").textContent = row.querySelector("select[name='tipoProducto.id'] option:checked").text;

                    // Volver a modo vista
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