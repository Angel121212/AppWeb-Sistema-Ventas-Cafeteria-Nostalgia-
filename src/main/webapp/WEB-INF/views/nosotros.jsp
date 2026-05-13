<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/x-icon" href="favicon.ico" />
    <title>Cafeteria Nostalgia — Nosotros</title>

    <!-- Tipografías (usa Playfair Display para títulos y Poppins para textos) -->
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nosotros.css">
</head>

<body>

    <!-- ENCABEZADO -->
               <%@ include file="header.jsp" %>

    <!-- SOBRE NOSOTROS -->
    <section class="sobre" id="sobre-nosotros">
        <div class="interior">
            <img class="imagen-nosotros"
                src="https://images.cdn-files-a.com/ready_uploads/media/61358/2000_5ce4da637457e.jpg"
                alt="Sobre Nosotros">
            <div class="tarjeta">
                <h4>Sobre Nosotros</h4>
                <p>Café Delicioso es más que una cafetería; somos un espacio dedicado a aquellos apasionados por el café
                    y las conversaciones. Con granos seleccionados de las mejores regiones y un ambiente cálido, nos
                    destacamos como un lugar donde cada taza cuenta una historia.</p>
            </div>
            <div class="video">
                <iframe src="https://www.youtube.com/embed/8KLE3hUKR98?autoplay=1&mute=1&loop=1&playlist=8KLE3hUKR98"
                    title="Affogato - Postre/Bebida de café" frameborder="0"    
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>
    </section>

    <!-- NUESTRA HISTORIA -->
    <section class="historia" id="historia">
        <h3>NUESTRA HISTORIA</h3>
        <p>La Cafetería Nostalgia nació en el 2010 con la idea de ofrecer un lugar acogedor
            donde el café y la tradición se unan. Desde entonces, hemos crecido junto a nuestros clientes,
            manteniendo siempre la pasión por la calidad y la calidez en cada detalle.</p>
    </section>

    <!-- NUESTROS VALORES -->
    <section class="valores" id="valores">
        <h3>NUESTROS VALORES</h3>
        <ul>
            <li><strong>Calidad:</strong> utilizamos granos cuidadosamente seleccionados.</li>
            <li><strong>Tradición:</strong> mantenemos recetas artesanales que evocan recuerdos.</li>
            <li><strong>Innovación:</strong> combinamos lo clásico con nuevas tendencias en café.</li>
            <li><strong>Calidez:</strong> brindamos un ambiente familiar y acogedor.</li>
        </ul>
    </section>

    <!-- EQUIPO -->
    <section class="equipo" id="equipo">
        <h3>NUESTRO EQUIPO</h3>
        <div class="rejilla-equipo">
            <div class="miembro">

                <h4>Ana Martínez</h4>
                <p>Fundadora y Barista principal. Apasionada del café de origen.</p>
            </div>
            <div class="miembro">

                <h4>Carlos López</h4>
                <p>Chef pastelero. Encargado de crear postres artesanales únicos.</p>
            </div>
            <div class="miembro">

                <h4>Lucía Torres</h4>
                <p>Atención al cliente. Siempre con una sonrisa para recibirte.</p>
            </div>
        </div>
        <div class="acciones-finales">
            <a href="/principal/publicidad">
                <button class="btn btn-secondary" type="button">Publicidades</button>
            </a>
        </div>
    </section>

                <!-- PIE -->
                <%@ include file="footer.jsp" %>


</body>

</html>