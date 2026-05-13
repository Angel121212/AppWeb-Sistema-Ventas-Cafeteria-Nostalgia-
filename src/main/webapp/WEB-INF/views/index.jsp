<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Cafeteria Nostalgia — Inicio</title>

            <!-- Tipografías (usa Playfair Display para títulos y Poppins para textos) -->
            <link
                href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">     
   </head>

        <body>

            <!-- ENCABEZADO -->
            <%@ include file="header.jsp" %>

                <!-- HERO -->
                <section class="hero" id="inicio">
                    <div class="contenedor">
                        <div class="hero-izq-container">
                            <div class="hero-izq">
                                <h1>Bienvenidos a Café Delicioso</h1>
                            </div>
                            <div class="hero-izq-text">
                                <p>Tu rincón perfecto para el aroma del café recién molido.</p>
                                <a class="boton-principal" href="/principal/servicios">MÁS INFORMACIÓN</a>
                            </div>
                        </div>
                        <div class="hero-der">
                            <div class="imagen-hero">
                                <img src="https://images.cdn-files-a.com/ready_uploads/media/81214/800_5ce57c3f1aac2.jpg"
                                    alt="Tazas de café">
                            </div>
                        </div>
                    </div>
                </section>

                <!-- EXPERIENCIA -->
                <section class="experiencia">
                    <div class="izq">
                        <h2>Experiencia Única del Café</h2>
                        <p>Café artesanal para despertar tus sentidos.</p>
                    </div>
                    <div class="der">
                        <img src="https://images.cdn-files-a.com/ready_uploads/media/6544699/2000_5f638b88345f2.jpg"
                            alt="Interior cafetería">
                    </div>
                </section>

                <!-- PRODUCTOS -->
                <section class="productos" id="productos">
                    <div class="titulo">PRODUCTOS</div>
                    <div class="linea"></div>
                    <div class="rejilla-productos">
                        <div class="tarjeta-producto">
                            <a href="/producto/catalogo">

                                <img class="producto-1"
                                    src="https://files.cdn-files-a.com/uploads/11164728/800_68b11f2733afc.png"
                                    alt="Cafés">
                                <div class="overlay">CAFÉS<br><small>1 PRODUCTO</small></div>
                            </a>

                        </div>
                        <div class="tarjeta-producto">
                            <a href="/producto/catalogo"><img class="producto-2"
                                    src="https://files.cdn-files-a.com/uploads/11164728/800_68b11ec5abcaf.png"
                                    alt="Postres">
                                <div class="overlay">POSTRES<br><small>1 PRODUCTO</small></div>
                            </a>
                        </div>
                    </div>
                </section>

                <!-- PIE -->
                <%@ include file="footer.jsp" %>

        </body>

        </html>