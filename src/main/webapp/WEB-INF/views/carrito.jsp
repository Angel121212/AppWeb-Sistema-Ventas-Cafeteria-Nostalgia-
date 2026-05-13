<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Carrito</title>
            <link
                href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap"
                rel="stylesheet">
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/carrito.css">
        </head>

        <body>

            <!-- ENCABEZADO -->
            <%@ include file="header.jsp" %>


                <!-- Detalles de compra -->
                <div class="contenedor-compra-envio">
                    <div class="contenedor-lateral">
                        <main class="carrito-placeholder">
                            <div id="detalle-carrito" class="detalle-carrito">
                                <h2>Productos en tu carrito</h2>
                                <c:if test="${empty carrito}">
                                    <p>Tu carrito está vacío</p>
                                </c:if>
                                <c:forEach var="item" items="${carrito}">
                                    <div>
                                        <p>${item.nombre} x ${item.cantidad} - S/${item.precio * item.cantidad}</p>
                                        <form action="/producto/eliminarCarrito" method="post" style="display:inline">
                                            <input type="hidden" name="id" value="${item.id}" />
                                            <button type="submit" class="btn-secondary">Eliminar</button>
                                        </form>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="resumen-compra" class="resumen-compra">
                                <h2>Resumen de compra</h2>
                                <p>
                                    Total: S$
                                    <c:set var="total" value="0" />
                                    <c:forEach var="item" items="${carrito}">
                                        <c:set var="total" value="${total + (item.precio * item.cantidad)}" />
                                    </c:forEach>
                                    ${total}
                                </p>
                                <form id="formCompra" action="/compra/crear" method="post">
                                    <input type="hidden" id="pagoInput" name="pago">

                                    <!-- LISTA DE PRODUCTOS DEL CARRITO -->
                                    <c:forEach var="item" items="${carrito}">
                                        <input type="hidden" name="productoId" value="${item.id}">
                                        <input type="hidden" name="cantidad" value="${item.cantidad}">
                                        <input type="hidden" name="subtotal" value="${item.precio * item.cantidad}">
                                    </c:forEach>

                                    <!-- TOTAL DE LA COMPRA -->
                                    <input type="hidden" name="total" value="${total}">
                                    <input type="hidden" name="usuarioId" value="${usuario.id}">

                                    <button
                                        type="button"
                                        onclick="finalizarPedido()"
                                        id="finalizarPedidoBtn"
                                        class="btn btn-primary mt-3"
                                        >Finalizar pedido
                                    </button>
                                </form>
                            </div>
                        </main>
                    </div>
                </div>



                <!-- Fondo Oscuro -->
                <div id="overlay" class="overlay"></div>

                <!-- POPUP 1: Gracias -->
                <div id="popup-gracias" class="popup">
                    <h3>¡Gracias! Estamos Procesando tu compra</h3>
                </div>

                <!-- POPUP 2: Formulario -->
                <div id="popup-form" class="popup">
                    <h3>Completa tus datos</h3>

                    <label>Método de Pago:</label>

                    <select id="metodo-pago" onchange="cambiarQR()">
                        <option value="">Seleccione...</option>
                        <option value="yape">Yape</option>
                        <option value="plin">Plin</option>
                    </select>

                    <!-- QR -->
                    <img id="qr-pago" src="" alt="QR Pago">

                    <button onclick="boletaVirtual()">Ver Boleta</button>
                </div>

                <!-- POPUP 3: Ticket Final -->
                <div id="popup-ticket" class="popup">
                    <h3>Ticket Final</h3>

                    <h3>Productos Comprados</h3>
                    <ul style="text-align:left; padding-left:0; list-style:none; color:#111;">
                        <c:forEach var="item" items="${carrito}">
                            <li>
                                <strong>${item.nombre}</strong> —
                                Cantidad: ${item.cantidad} —
                                S/ ${item.precio * item.cantidad}
                            </li>
                        </c:forEach>
                    </ul>

                    <h3>Total a pagar: S/ ${total}</h3>
                </div>

                <!-- PIE -->
                <%@ include file="footer.jsp" %>

                <!--Variable segura para saber si el carrito esta vacio-->
                <c:choose>
                    <c:when test="${empty carrito}">
                        <c:set var="carritoVacio" value="true"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="carritoVacio" value="false"/>
                    </c:otherwise>
                </c:choose>
        <script>
            const carritoVacio = "${carritoVacio}" === "true";
            let total = Number("${total}"); // ← SEGURO Y NO ROMPE EL JS

            
            function finalizarPedido() {
                if (carritoVacio) {
                    alert("Tu carrito está vacío. Agrega productos antes de continuar.");
                    return; //Detiene la ejecución
                }
                document.getElementById("overlay").style.display = "block";
                document.getElementById("popup-gracias").style.display = "block";

                setTimeout(() => {
                    document.getElementById("popup-gracias").style.display = "none";
                    document.getElementById("popup-form").style.display = "block";
                }, 1800);
            }

            function cambiarQR() {
                const metodo = document.getElementById("metodo-pago").value;
                const qr = document.getElementById("qr-pago");

                //Guardar el metodo en el input oculto
                document.getElementById("pagoInput").value = metodo;

                if (metodo === "yape") {
                    qr.src = "https://media-public.canva.com/kfFBA/MAGnKRkfFBA/1/tl.png";
                    qr.style.display = "block";
                } else if (metodo === "plin") {
                    qr.src = "https://media-public.canva.com/kfFBA/MAGnKRkfFBA/1/tl.png";
                    qr.style.display = "block";
                } else {
                    qr.style.display = "none";
                }
            }

            //Muestra un pop-up de la boleta
            function boletaVirtual() {

                const metodo = document.getElementById("metodo-pago").value;

                // VALIDACIÓN BÁSICA PARA EVITAR QUE NO PASE NADA
                if (!metodo) {
                    alert("Por favor complete todos los campos.");
                    return;
                }

                // OCULTAR FORMULARIO Y MOSTRAR TICKET
                document.getElementById("popup-form").style.display = "none";
                document.getElementById("popup-ticket").style.display = "block";

                // CERRAR TODO A LOS 10 SEGUNDOS
                setTimeout(() => {
                    document.getElementById("popup-ticket").style.display = "none";
                    document.getElementById("overlay").style.display = "none";
                }, 10000);

                // ENVIAR DATOS A LA BASE DE DATOS Y GUARDAR BOLETA
                setTimeout(() => {
                    document.querySelector('form[action="/compra/crear"]').submit();
                }, 10500); // un poco después del cierre
            }
        </script>
</html>