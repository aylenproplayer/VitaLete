package com.app;



import java.io.IOException;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;



@WebServlet("/login")

public class LoginSv extends HttpServlet {



    private static final long serialVersionUID = 1L;



    private static final String VISTA_LOGIN =

        "/vistas/inicioSesion.jsp";



    @Override

    protected void doPost(HttpServletRequest request,

                          HttpServletResponse response)

            throws ServletException, IOException {



        request.setCharacterEncoding("UTF-8");



        String email = leer(request, "email", "usuario");

        String password = leer(request, "password", "clave");



        if (email == null || email.trim().isEmpty()

                || password == null || password.isEmpty()) {



            volverConError(request, response,

                "Ingresá tu correo y contraseña.");

            return;

        }



        String sql =

            "SELECT id, nombre, password_hash FROM usuarios WHERE email = ?";



        try (Connection con = ConexionBD.conectar()) {



            if (con == null) {

                volverConError(request, response,

                    "No se pudo conectar con la base de datos.");

                return;

            }



            try (PreparedStatement ps = con.prepareStatement(sql)) {



                ps.setString(1, email.trim().toLowerCase());



                try (ResultSet rs = ps.executeQuery()) {



                    if (rs.next()

                            && password.equals(rs.getString("password_hash"))) {



                        HttpSession sesion = request.getSession(true);



                        sesion.setAttribute("usuarioId", rs.getInt("id"));

                        sesion.setAttribute("usuarioNombre", rs.getString("nombre"));



                        response.sendRedirect(

                            request.getContextPath() + "/CuentasSv"

                        );



                    } else {



                        volverConError(request, response,

                            "Correo o contraseña incorrectos.");

                    }

                }

            }



        } catch (SQLException e) {



            e.printStackTrace();



            volverConError(request, response,

                "Error en el servidor. Probá de nuevo más tarde.");

        }

    }



    private String leer(HttpServletRequest request,

                        String nuevo,

                        String viejo) {



        String valor = request.getParameter(nuevo);



        return valor != null

            ? valor

            : request.getParameter(viejo);

    }



    private void volverConError(HttpServletRequest request,

                                HttpServletResponse response,

                                String mensaje)

            throws ServletException, IOException {



        request.setAttribute("error", mensaje);

        request.setAttribute("email", leer(request, "email", "usuario"));



        request.getRequestDispatcher(VISTA_LOGIN)

               .forward(request, response);

    }

}