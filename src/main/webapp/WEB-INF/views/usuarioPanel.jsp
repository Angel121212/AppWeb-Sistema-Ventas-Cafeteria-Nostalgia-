<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Usuario</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usuarioPanel.css">
</head>

<body>

    <div class="contenedor">
        <h1>Panel de Usuario</h1>

        <div class="perfil">
            <div class="perfil-info">
                <p><span>Nombre:</span> ${usuario.nombre}</p>
                <p><span>Email:</span> ${usuario.email}</p>
            </div>
        </div>

        <!-- FORMULARIO PARA EDITAR -->
        <form:form action="/usuario/actualizar" method="post" modelAttribute="usuario">

            <!-- ID obligatorio -->
            <form:hidden path="id"/>

            <div class="campo">
                <label>Nombre</label>
                <form:input path="nombre" cssClass="edit-input"/>
            </div>

            <div class="campo">
                <label>Email</label>
                <form:input path="email" cssClass="edit-input"/>
            </div>

            <div class="campo">
                <label>Contraseña</label>
                <form:password path="contrasena" cssClass="edit-input"/>
            </div>

            <button type="submit" class="btn-guardar">Guardar cambios</button>
        </form:form>

        <br>

        <!-- DESHABILITAR CUENTA -->
        <form action="/usuario/deshabilitar" method="post">
            <input type="hidden" name="id" value="${usuario.id}">
            <button type="submit" class="btn-guardar"
                onclick="return confirm('¿Seguro que deseas deshabilitar tu cuenta?');">
                Eliminar Cuenta
            </button>
        </form>

        <!--CERRAR SESION-->>
        <form action="/usuario/logout" method="get">
            <input type="hidden" name="id" value="${usuario.id}">
            <button type="submit" class="btn-guardar">
                Cerrar Sesión
            </button>
        </form>

    </div>

    <a class="cerrar" href="/principal/index">
        <svg xmlns="http://www.w3.org/2000/svg" height="40px"
            viewBox="0 -960 960 960" width="40px" fill="#000000">
            <path d="m256-200-56-56 224-224-224-224 56-56 
                     224 224 224-224 56 56-224 224 224 224-56 
                     56-224-224-224 224Z" />
        </svg>
    </a>

</body>
</html>
