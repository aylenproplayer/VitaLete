package com.app;



import java.io.IOException;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.SQLException;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;



@WebServlet({"/registro", "/RegistroServlet", "/RegistroSv", "/Registrosv"})

public class Registrosv extends HttpServlet {



    private static final long serialVersionUID = 1L;



    private static final String VISTA_REGISTRO =

            "/vistas/Registrarse.jsp";



    private static final String VISTA_LOGIN =

            "/vistas/inicioSesion.jsp";



    @Override

    protected void doGet(HttpServletRequest request,

                         HttpServletResponse response)

            throws ServletException, IOException {



        request.getRequestDispatcher(VISTA_REGISTRO)

               .forward(request, response);

    }



    @Override

    protected void doPost(HttpServletRequest request,

                          HttpServletResponse response)

            throws ServletException, IOException {



        request.setCharacterEncoding("UTF-8");



        // Recibir los datos del formulario

        String nombre = request.getParameter("nombre");

        String apellido = request.getParameter("apellido");

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        String confirmar = request.getParameter("confirmar");



        // Comprobar que no falte ningún dato

        if (vacio(nombre) || vacio(apellido) ||

            vacio(email) || vacio(password) ||

            vacio(confirmar)) {



            volverConError(request, response,

                    "Completá todos los campos.");

            return;

        }



        // Validar correo electrónico

        if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {



            volverConError(request, response,

                    "El correo electrónico no es válido.");

            return;

        }



        // Validar contraseña

        if (password.length() < 8) {



            volverConError(request, response,

                    "La contraseña debe tener al menos 8 caracteres.");

            return;

        }



        // Comprobar que las contraseñas coincidan

        if (!password.equals(confirmar)) {



            volverConError(request, response,

                    "Las contraseñas no coinciden.");

            return;

        }



        // Consulta para insertar los datos

        String sql = "INSERT INTO usuarios " +

                     "(nombre, apellido, email, password_hash) " +

                     "VALUES (?, ?, ?, ?)";



        // Obtener conexión

        Connection conexion = ConexionBD.conectar();



        // Comprobar que la conexión exista

        if (conexion == null) {



            volverConError(request, response,

                    "No se pudo conectar con la base de datos. " +

                    "Verificá MySQL y la conexión.");

            return;

        }



        // Insertar los datos

        try (Connection con = conexion;

             PreparedStatement ps = con.prepareStatement(sql)) {



            ps.setString(1, nombre.trim());

            ps.setString(2, apellido.trim());

            ps.setString(3, email.trim().toLowerCase());

            ps.setString(4, password);



            int filas = ps.executeUpdate();



            if (filas > 0) {



                request.setAttribute("exito",

                        "¡Cuenta creada correctamente! Ya podés iniciar sesión.");



                request.getRequestDispatcher(VISTA_LOGIN)

                       .forward(request, response);

            }



        } catch (SQLException e) {



            e.printStackTrace();



            // Error por correo duplicado

            if (e.getErrorCode() == 1062) {



                volverConError(request, response,

                        "Ya existe una cuenta con ese correo.");



            } else {



                volverConError(request, response,

                        "No se pudieron guardar los datos. " +

                        "Revisá la conexión y la tabla usuarios.");

            }

        }

    }



    private boolean vacio(String texto) {

        return texto == null || texto.trim().isEmpty();

    }



    private void volverConError(HttpServletRequest request,

                                HttpServletResponse response,

                                String mensaje)

            throws ServletException, IOException {



        request.setAttribute("error", mensaje);



        request.setAttribute("nombre",

                request.getParameter("nombre"));



        request.setAttribute("apellido",

                request.getParameter("apellido"));



        request.setAttribute("email",

                request.getParameter("email"));



        request.getRequestDispatcher(VISTA_REGISTRO)

               .forward(request, response);

    }

}