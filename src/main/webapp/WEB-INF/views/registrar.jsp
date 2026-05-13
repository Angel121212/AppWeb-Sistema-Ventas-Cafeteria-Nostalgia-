<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registrar.css">
</head>

<body>

    
    <div class="formulario">
        <h1>Registro de usuario</h1>   
        <c:if test="${not empty error}">
            <div style="color: red; text-align: center;">${error}</div>
        </c:if> 
        <form:form action="/usuario/registrar" method="post" modelAttribute="usuario">
                <div class="username">
                    <form:input path="nombre" id="nombre" type="text" placeholder="Nombre de Usuario" required="true"/>
                </div>
                <div class="email">
                    <form:input path="email" id="email" type="text"  placeholder="Correo electrónico" required="true"/>
                </div>
                <div class="password">
                    <form:input path="contrasena" id="contrasena" type="password" placeholder="Contraseña" required="true"/>
                </div>    
                <div class="password">
                    <form:input path="confirmarContrasena" type="password" id="confirmarContrasena" placeholder="Confirmar contraseña" required="true"/>
                </div>    
            <input type="submit" value="Iniciar">
        </form:form>
    </div>
    <a class="cerrar" href="/principal/index">
        <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="#000000">
            <path
                d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
        </svg>
    </a>
</body>

</html>