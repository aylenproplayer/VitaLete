<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    Integer usuarioIdSesion = (Integer) session.getAttribute("usuarioId");

    if (usuarioIdSesion == null) {
        response.sendRedirect(
            request.getContextPath() + "/vistas/inicioSesion.jsp"
        );
        return;
    }

    String nombrePerfil = (String) request.getAttribute("nombrePerfil");
    String apellidoPerfil = (String) request.getAttribute("apellidoPerfil");
    String emailPerfil = (String) request.getAttribute("emailPerfil");

    if (nombrePerfil == null) nombrePerfil = "";
    if (apellidoPerfil == null) apellidoPerfil = "";
    if (emailPerfil == null) emailPerfil = "";

    String exito = (String) request.getAttribute("exito");
    String error = (String) request.getAttribute("error");

    List usuarios = (List) request.getAttribute("usuarios");
%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Mi cuenta | VitaLete</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/estilos/Cuentass.css">
</head>

<body class="cuentas-body">

	<header class="topbar">

		<a class="marca"
			href="${pageContext.request.contextPath}/vistas/Inicio.jsp">
			<img src="${pageContext.request.contextPath}/img/VITALETE.LOGO.png"
				alt="Logo VitaLete">
			<span>VITALETE</span>
		</a>

		<nav class="topbar-nav">
			<span class="saludo">Tu cuenta</span>
			<a class="btn-volver"
				href="${pageContext.request.contextPath}/vistas/Inicio.jsp">
				Volver al inicio
			</a>
		</nav>

	</header>

	<main class="contenedor">

		<section class="bienvenida">
			<h1>
				Personalizá tu <span>cuenta.</span>
			</h1>
			<p>Personalizá tu perfil y mantené tus datos actualizados.
				¡Estamos para acompañarte!</p>
		</section>

		<% if (exito != null) { %>
		<div class="mensaje mensaje-exito">
			✓ <%= exito %>
		</div>
		<% } %>

		<% if (error != null) { %>
		<div class="mensaje mensaje-error">
			⚠ <%= error %>
		</div>
		<% } %>

		<section class="perfil-card">

			<div class="perfil-encabezado">
				<div class="perfil-icono">♡</div>
				<div>
					<span class="etiqueta">TU INFORMACIÓN</span>
					<h2>Modificá tus datos</h2>
					<p>Actualizá tu información cuando lo necesites.</p>
				</div>
			</div>

			<form class="form-perfil"
				action="${pageContext.request.contextPath}/perfil" method="post">

				<div class="campo">
					<label for="nombre">Nombre</label>
					<input type="text" id="nombre" name="nombre"
						value="<%= nombrePerfil %>"
						placeholder="Ingresá tu nombre" maxlength="60" required>
				</div>

				<div class="campo">
					<label for="apellido">Apellido</label>
					<input type="text" id="apellido" name="apellido"
						value="<%= apellidoPerfil %>"
						placeholder="Ingresá tu apellido" maxlength="60" required>
				</div>

				<div class="campo campo-completo">
					<label for="email">Correo electrónico</label>
					<input type="email" id="email" name="email"
						value="<%= emailPerfil %>"
						placeholder="ejemplo@gmail.com" maxlength="120" required>
				</div>

				<div class="campo-completo">
					<button type="submit" class="btn-guardar">
						Guardar cambios <span>→</span>
					</button>
				</div>

			</form>

		</section>

		<section class="sesion-card">

			<div class="sesion-icono">↪</div>

			<div class="sesion-texto">
				<h2>¿Terminaste por hoy?</h2>
				<p>Cerrá tu sesión de forma segura.</p>
			</div>

			<a href="${pageContext.request.contextPath}/logout"
				class="btn-cerrar">Cerrar sesión</a>

		</section>

		<section class="eliminar-card">

			<div class="eliminar-icono">⚠</div>

			<div class="eliminar-texto">
				<h2>Eliminar cuenta</h2>
				<p>Esta acción borrará tu usuario de forma permanente y no se puede deshacer.</p>
			</div>

			<form action="${pageContext.request.contextPath}/BorrarCuentasv"
				method="post"
				onsubmit="return confirm('¿Estás seguro de que querés eliminar tu cuenta? Esta acción no se puede deshacer.');">
				<button type="submit" class="btn-eliminar">
					Eliminar cuenta
				</button>
			</form>

		</section>

		<section class="usuarios-seccion">

			<div class="seccion-titulo">
				<h2>Cuentas registradas</h2>
				<p>Usuarios que forman parte de VitaLete.</p>
			</div>

			<div class="tabla-card">
				<div class="tabla-scroll">
					<table class="tabla-cuentas">

						<thead>
							<tr>
								<th>ID</th>
								<th>Nombre</th>
								<th>Apellido</th>
								<th>Email</th>
								<th>Fecha de registro</th>
							</tr>
						</thead>

						<tbody>
							<% if (usuarios != null && !usuarios.isEmpty()) { %>
								<% for (Object obj : usuarios) {
									Map u = (Map) obj; %>
								<tr>
									<td><%= u.get("id") %></td>
									<td class="dato-destacado"><%= u.get("nombre") %></td>
									<td><%= u.get("apellido") %></td>
									<td><%= u.get("email") %></td>
									<td><%= u.get("fecha_registro") %></td>
								</tr>
								<% } %>
							<% } else { %>
								<tr>
									<td colspan="5" class="sin-datos">Todavía no hay usuarios registrados.</td>
								</tr>
							<% } %>
						</tbody>

					</table>
				</div>
			</div>

		</section>

	</main>

	<footer class="footer">
		<p>VitaLete · Independiente en cada paso, acompañado en cada pulso.</p>
		<span>Instituto Técnico Nuestra Señora de Fátima (A-893) · Villa Soldati, Ciudad de Buenos Aires, Argentina</span>
	</footer>

</body>

</html>