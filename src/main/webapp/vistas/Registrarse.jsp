<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%

    String error = (String) request.getAttribute("error");



    String nombre = request.getAttribute("nombre") == null

            ? "" : (String) request.getAttribute("nombre");



    String apellido = request.getAttribute("apellido") == null

            ? "" : (String) request.getAttribute("apellido");



    String email = request.getAttribute("email") == null

            ? "" : (String) request.getAttribute("email");

%>



<!DOCTYPE html>

<html lang="es">



<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">



<title>Registrarse | VitaLete</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/Registrarses.css">

</head>



<body>



	<main class="registro">



		<h1>¡Unite a VitaLete!</h1>



		<p class="descripcion">Creá tu cuenta para comenzar a cuidar tu
			bienestar.</p>



		<% if (error != null) { %>

		<div class="msg err">

			<%= error %>

		</div>

		<% } %>



		<form action="${pageContext.request.contextPath}/Registrosv"
			method="post">



			<label for="nombre">Nombre</label> <input type="text" id="nombre"
				name="nombre" placeholder="Ingresá tu nombre" value="<%= nombre %>"
				required> <label for="apellido">Apellido</label> <input
				type="text" id="apellido" name="apellido"
				placeholder="Ingresá tu apellido" value="<%= apellido %>" required>



			<label for="email">Correo electrónico</label> <input type="email"
				id="email" name="email" placeholder="ejemplo@gmail.com"
				value="<%= email %>" required> <label for="password">Contraseña</label>



			<input type="password" id="password" name="password"
				placeholder="Creá una contraseña" minlength="8" required> <label
				for="confirmar">Confirmar contraseña</label> <input type="password"
				id="confirmar" name="confirmar" placeholder="Repetí tu contraseña"
				required>



			<button type="submit">Crear cuenta</button>



		</form>



		<p class="cuenta">

			¿Ya tenés una cuenta? <a
				href="${pageContext.request.contextPath}/vistas/inicioSesion.jsp">

				Iniciá sesión </a>

		</p>



		<a class="volver"
			href="${pageContext.request.contextPath}/vistas/Inicio.jsp"> ←
			Volver al inicio </a>



	</main>



	<script>

        document.querySelector("form").addEventListener("submit", function(e) {



            const password = document.getElementById("password").value;

            const confirmar = document.getElementById("confirmar").value;



            if (password !== confirmar) {

                e.preventDefault();

                alert("Las contraseñas no coinciden.");

            }



        });

    </script>



</body>

</html>