<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

    String error = (String) request.getAttribute("error");

    String exito = (String) request.getAttribute("exito");

    String email = request.getAttribute("email") == null ? "" : (String) request.getAttribute("email");

%>

<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">



    <title>Iniciar sesión | VitaLete</title>



    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos/InicioSesions.css">

    <style>

        .msg { padding: 10px 12px; border-radius: 8px; margin: 0 0 14px; font-size: 14px; text-align: left; }

        .msg.ok  { background: #e6f7ec; border: 1px solid #2e9e5b; color: #1d6b3c; }

        .msg.err { background: #fdeaea; border: 1px solid #d64545; color: #a12626; }

    </style>

</head>



<body>

    <main class="login">

        <h1>¡Bienvenido a VitaLete!</h1>

        <p>Ingresá a tu cuenta para continuar.</p>



        <% if (exito != null) { %>

            <div class="msg ok"><%= exito %></div>

        <% } %>

        <% if (error != null) { %>

            <div class="msg err"><%= error %></div>

        <% } %>



        <form action="${pageContext.request.contextPath}/login" method="post">

            <label for="usuario">Correo electrónico</label>

            <input type="email" id="usuario"

                   name="email" value="<%= email %>" required>



            <label for="clave">Contraseña</label>

            <input type="password" id="clave"

                   name="password" required>



            <button type="submit">

                Iniciar sesión

            </button>

        </form>



        <a class="volver" href="${pageContext.request.contextPath}/vistas/Inicio.jsp">

            ← Volver al inicio

        </a>

    </main>

</body>

</html>