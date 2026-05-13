<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cafetería Nostalgia</title>

 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/publicidad.css">
</head>

<body>
            <%@ include file="header.jsp" %>

  <!-- Hero principal -->
  <section class="hero">
    <h2>Un café, mil recuerdos ☕✨</h2>
    <p>Descubre la experiencia única de Cafetería Nostalgia, donde cada taza cuenta una historia.</p>
    <a href="/principal/contacto"><button>Visítanos Hoy</button></a>
  </section>

  <!-- Galería de publicidad -->
  <section class="publicidad">
    <h2>Nuestro ambiente y sabores</h2>
    <div class="galeria">
      <img src="../../MEDIA/IMAGES/mocca.jpg" alt="Café mocca">
      <img src="../../MEDIA/IMAGES/capuchino.jpeg" alt="Capuchino con arte latte">
      <img src="../../MEDIA/IMAGES/latte.jpeg" alt="Latte servido con espuma cremosa">
    </div>
    <p>Vive la experiencia de una cafetería acogedora, con un aroma que despierta la nostalgia de buenos momentos.</p>
  </section>

  
                <!-- PIE -->
                <%@ include file="footer.jsp" %>

</body>

</html>