<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Contacto</title>
            <!-- Tipografías (usa Playfair Display para títulos y Poppins para textos) -->
            <link
                href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap"
                rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
                crossorigin="anonymous">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contacto.css">

        </head>

        <body>
            <!-- ENCABEZADO -->
            <%@ include file="header.jsp" %>
                <section class="carrusel">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"
                        data-bs-interval="10000">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../../MEDIA/IMAGES/1.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../../MEDIA/IMAGES/2.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../../MEDIA/IMAGES/3.jpg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </section>


                <section class="contenido-principal">
                    <div class="contenido-centro">
                        <div class="marca">
                            <h1>Bienvenido a la Cafetería Nostalgia</h1>
                        </div>
                        <p>Tu rincón perfecto para el aroma del café recién molido.</p>
                    </div>

                    <!-- Página contacto -->
                    <div class="formulario-contacto">
                        <h2>Contáctanos</h2>
                        <form>
                            <label for="nombre">Nombre completo:</label>
                            <input type="text" id="nombre" name="nombre" placeholder="Tu nombre" required>

                            <label for="email">Correo electrónico:</label>
                            <input type="email" id="email" name="email" placeholder="Tu email" required>

                            <label for="asunto">Asunto:</label>
                            <input type="text" id="asunto" name="asunto" placeholder="Asunto del mensaje" required>

                            <label for="mensaje">Mensaje:</label>
                            <textarea id="mensaje" name="mensaje" rows="4" placeholder="Escribe tu mensaje aquí..."
                                required></textarea>

                            <button type="submit">Enviar mensaje</button>
                        </form>
                    </div>
                </section>

                <!-- PIE -->
                <%@ include file="footer.jsp" %>

        </body>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
            crossorigin="anonymous"></script>

        </html>