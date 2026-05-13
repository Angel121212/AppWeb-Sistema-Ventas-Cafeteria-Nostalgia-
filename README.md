# Sistema de Gestión de Ventas y Facturación - Cafetería Nostalgia

Sistema de información web diseñado para la automatización de procesos comerciales en establecimientos gastronómicos. La plataforma permite la administración centralizada de inventarios, el procesamiento de transacciones en tiempo real y la generación de comprobantes de pago electrónicos.

## 🏗️ Arquitectura del Sistema

La aplicación está construida bajo el patrón de arquitectura **Model-View-Controller (MVC)**, lo que permite una separación clara entre la lógica de negocio, el manejo de datos y la interfaz de usuario, facilitando la escalabilidad y el mantenimiento.

---

## 📱 Interfaces y Módulos del Sistema

### 1. Experiencia del Cliente y Catálogo
Módulos orientados al usuario final para la interacción con la marca y exploración de productos.

* **Panel Principal:** Visualización dinámica de la oferta comercial.
    ![Panel Principal](readme_imgs/index_1.png)
    ![Panel Principal](readme_imgs/index_2.png)
    ![Panel Principal](readme_imgs/index_3.png)

* **Servicios:** Detalle de las prestaciones adicionales de la cafetería.
    ![Vista Servicios](readme_imgs/services_1.png)
    ![Vista Servicios](readme_imgs/services_2.png)

* **Sobre Nosotros:** Información institucional y valores de la empresa.
    ![Vista Sobre Nosotros](readme_imgs/about_1.png)
    ![Vista Sobre Nosotros](readme_imgs/about_2.png)

* **Publicidad y Contacto:** Vitrina de productos destacados y canales de comunicación.
    ![Vista Publicidad](readme_imgs/advertising.png)
    ![Vista Contacto](readme_imgs/contact_1.png)
    ![Vista Contacto](readme_imgs/contact_2.png)

### 2. Gestión de Ventas y Checkout
Flujo transaccional que gestiona desde la selección del producto hasta la emisión del comprobante.
* **Funcionalidad:** Validación de stock, cálculo de importes y pasarela de simulación de pago.
    ![Carrito de Compras-paso1](readme_imgs/shopping_car.png)
    ![Carrito de Compras-paso2](readme_imgs/payment_method.png)
    ![Carrito de Compras-paso3](readme_imgs/ticket.png)

### 3. Seguridad y Perfiles de Usuario
Sistema de gestión de identidad y acceso (IAM).
* **Autenticación:** Control de acceso basado en roles (Administrador/Cliente).
    ![Autenticación](readme_imgs/sign_in.png)
    ![Crear Cuenta](readme_imgs/sign_up.png)
* **Panel de Usuario:** Gestión de datos personales y preferencias.
    ![Vista Panel Perfil](readme_imgs/user_panel.png)

### 4. Módulo Administrativo y Backoffice
Herramientas de gestión exclusivas para el personal autorizado.

* **Panel de Control:** Acceso centralizado a las herramientas de gestión.
    ![Interfaz Admin](readme_imgs/admin_menu_1.png)
    ![Interfaz Admin](readme_imgs/admin_menu_2.png)

* **Mantenimiento de Inventario (CRUD):** Control total sobre productos y categorías.
    ![Gestión de Productos](readme_imgs/admin_add_type_product.png)
    ![Gestión de Productos](readme_imgs/admin_add_product.png)

* **Monitoreo de Operaciones:** Listado detallado de usuarios registrados y transacciones ejecutadas.
    ![Gestión de Users](readme_imgs/admin_user_list.png)
    ![Gestión de Ventas](readme_imgs/admin_sales_list.png)

### 5. Analítica y Persistencia de Datos
* **Métricas:** Dashboard estratégico para el análisis del rendimiento comercial.
    ![Métricas](readme_imgs/admin_metrics_1.png)

* **Persistencia (H2/MySQL):** Interfaz de consola para la verificación de integridad de datos en la capa de persistencia.
    ![Base Datos](readme_imgs/admin_db_credentials.png)
    ![Base Datos](readme_imgs/admin_db.png)

---

## Especificaciones Técnicas

* **Backend:** Java 17, Spring Framework (Spring Boot, Spring MVC, Spring Data JPA).
* **Frontend:** JavaServer Pages (JSP), JSTL, Bootstrap, CSS3, HTML5.
* **Gestión de Datos:** MySQL Server 8.0 / H2 Database (Runtime).
* **Servidor de Aplicaciones:** Apache Tomcat (Embebido).
* **Gestión de Dependencias:** Maven.

## Estructura de Capas

1.  **Controller:** Orquestación de peticiones HTTP y mapeo de rutas.
2.  **Service:** Implementación de reglas de negocio y lógica transaccional.
3.  **Repository / DAO:** Interfaz de comunicación con la base de datos (Spring Data JPA).
4.  **Model / Entity:** Definición de los objetos de negocio y mapeo relacional.

---

## Instrucciones de Despliegue

1.  **Clonación del Repositorio:**
    ```bash
    git clone https://github.com/Angel121212/AppWeb-Sistema-Ventas-Cafeteria-Nostalgia-.git
    ```
2.  **Configuración:** Ajustar credenciales en el archivo `src/main/resources/application.properties`.
3.  **Ejecución desde Terminal:**
    ```bash
    mvn spring-boot:run
    ```

### Puntos de Acceso (Una vez ejecutado)

* **Aplicación Web:** [http://localhost:8080/principal/index](http://localhost:8080/principal/index)
* **Consola de Base de Datos (H2):** [http://localhost:8080/h2-console](http://localhost:8080/h2-console)
    * *Nota: Asegúrate de usar los datos de conexión definidos en tu archivo de propiedades.*

