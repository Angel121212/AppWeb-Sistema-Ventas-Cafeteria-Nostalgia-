<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Cafeteria Nostalgia — Términos y Condiciones</title>

    <!-- Tipografías (usa Playfair Display para títulos y Poppins para textos) -->
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/terminos.css">
</head>

<body>

    <!-- ENCABEZADO -->
              <%@ include file="header.jsp" %>


    <!-- SECCIÓN TÉRMINOS -->
    <section class="terminos">
        <div class="contenedor-terminos">
            <h2 class="titulo-terminos">Términos y Condiciones</h2>
            <p class="descripcion-terminos">
                Aquí podrás descargar los términos y condiciones de Cafetería Nostalgia
                en el formato que prefieras. Revisa el documento para conocer más
                sobre nuestras políticas y servicios.
            </p>

            <div class="bloques-descarga">
                <a href="${pageContext.request.contextPath}/documento/Términos y Condiciones.docx" 
                    class="bloque-descarga docs" download>
                    <span>Descargar en Word</span>
                </a>
                <a href="${pageContext.request.contextPath}/documento/Términos y Condiciones.pdf" 
                    class="bloque-descarga pdf" download>
                    <span>Descargar en PDF</span>
                </a>
            </div>
        </div>
    </section>





                <!-- PIE -->
                <%@ include file="footer.jsp" %>


</body>

</html>