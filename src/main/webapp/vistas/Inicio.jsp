<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Integer usuarioId = (Integer) session.getAttribute("usuarioId");
    String usuarioNombre = (String) session.getAttribute("usuarioNombre");

    boolean sesionIniciada = usuarioId != null;
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VitaLete | Tu bienestar importa</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/estilos/Inicios.css">
</head>

<body>

    <header class="navbar">

        <div class="logo">
            <img src="${pageContext.request.contextPath}/img/VITALETE.LOGO.png"
                 alt="Logo VitaLete">
            <span>VITALETE</span>
        </div>

        <nav class="menu">

            <% if (sesionIniciada) { %>

                <span class="texto-cuenta">
                    ¡Hola, <%= usuarioNombre != null ? usuarioNombre : "usuario" %>!
                </span>

                <a class="boton-login"
                   href="${pageContext.request.contextPath}/CuentasSv">
                    Mi cuenta
                </a>

                <a class="boton-login"
                   href="${pageContext.request.contextPath}/logout">
                    Cerrar sesión
                </a>

            <% } else { %>

                <span class="texto-cuenta">¿Ya tenés cuenta?</span>

                <a class="boton-login"
                   href="${pageContext.request.contextPath}/vistas/inicioSesion.jsp">
                    Iniciar sesión
                </a>

                <a class="boton-login"
                   href="${pageContext.request.contextPath}/vistas/Registrarse.jsp">
                    Registrarse
                </a>

            <% } %>

        </nav>

    </header>

    <!-- FLECHA PARA VOLVER A BIENVENIDA -->
    <a href="${pageContext.request.contextPath}/vistas/Bienvenida.jsp"
       class="flecha-volver"
       title="Volver a bienvenida"
       aria-label="Volver a bienvenida">
        <span>←</span>
    </a>

    <main>

        <section class="hero">

            <div class="hero-contenido">

                <h1>
                    Cuidarte nunca fue
                    <span>tan sencillo.</span>
                </h1>

                <p>
                    VitaLete es una pulsera diseñada para acompañar a los adultos
                    mayores en su vida cotidiana, brindándoles seguridad,
                    asistencia y tranquilidad.
                </p>

                <div class="hero-botones">

                    <% if (sesionIniciada) { %>

                        <a class="boton-principal"
                           href="${pageContext.request.contextPath}/CuentasSv">
                            Ir a mi cuenta →
                        </a>

                    <% } else { %>

                        <a class="boton-principal"
                           href="${pageContext.request.contextPath}/vistas/Registrarse.jsp">
                            Registrate y empezá ahora →
                        </a>

                    <% } %>

                </div>

            </div>

            <div class="hero-imagen">
                <div class="imagen-circulo">
                    <img src="${pageContext.request.contextPath}/img/VITALETE.LOGO.png"
                         alt="Logo de VitaLete">
                </div>

                <div class="mensaje-flotante">
                    <span class="punto-verde"></span>
                    <span>Siempre acompañándote</span>
                </div>
            </div>

        </section>

        <section class="funciones" id="funciones">

            <div class="encabezado-seccion">

                <span class="etiqueta">SENTITE CUIDADO ESTANDO SOLO/A</span>

                <h2>Nuestra pulsera tiene tres botones esenciales.</h2>

                <p>
                    VitaLete está pensada para facilitar la vida cotidiana de los
                    adultos mayores y brindar tranquilidad a sus familiares.
                </p>

            </div>

            <div class="tarjetas">

                <article class="tarjeta">
                    <div class="icono icono-familiar">♡</div>
                    <h3>Contacto familiar</h3>
                    <p>
                        Con un botón, el usuario puede comunicarse rápidamente
                        con un familiar o cuidador cuando necesite ayuda.
                    </p>
                    <span class="numero">01</span>
                </article>

                <article class="tarjeta">
                    <div class="icono icono-emergencia">✚</div>
                    <h3>Llamada al 911</h3>
                    <p>
                        Cuenta con un botón de emergencia para solicitar
                        asistencia al servicio de emergencias 911.
                    </p>
                    <span class="numero">02</span>
                </article>

                <article class="tarjeta">
                    <div class="icono icono-medicamento">✓</div>
                    <h3>Confirmación de medicamentos</h3>
                    <p>
                        Permite confirmar mediante un botón si el usuario
                        tomó su medicamento correspondiente.
                    </p>
                    <span class="numero">03</span>
                </article>

            </div>

        </section>

        <section class="como-funciona">

            <div class="funciona-texto">

                <span class="etiqueta">FÁCIL DE UTILIZAR</span>

                <h2>La tranquilidad está al alcance de tu mano.</h2>

                <p>
                    Diseñamos VitaLete pensando en los adultos mayores.
                    Es más práctico utilizar botones para ellos que una
                    pantalla táctil como la de otros dispositivos.
                    Sus tres botones permiten realizar acciones importantes
                    de manera sencilla, rápida y accesible.
                </p>

            </div>

            <div class="beneficios">

                <div class="beneficio">
                    <span class="check">✓</span>
                    <div>
                        <h3>Fácil de usar</h3>
                        <p>Botones claros y funciones sencillas.</p>
                    </div>
                </div>

                <div class="beneficio">
                    <span class="check">✓</span>
                    <div>
                        <h3>Mayor seguridad</h3>
                        <p>Acceso rápido a contactos de asistencia.</p>
                    </div>
                </div>

                <div class="beneficio">
                    <span class="check">✓</span>
                    <div>
                        <h3>Control de medicamentos</h3>
                        <p>Confirmación de la toma de medicamentos.</p>
                    </div>
                </div>

            </div>

        </section>

    </main>

    <footer>
          <p>VitaLete · Independiente en cada paso, acompañado en



		cada pulso.</p>







        <span>Instituto Técnico Nuestra Señora de Fátima (A-893) · Villa Soldati, Ciudad de Buenos Aires, Argentina</span>


    </footer>

</body>
</html>