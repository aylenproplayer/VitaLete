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

import jakarta.servlet.http.HttpSession;



@WebServlet("/perfil")

public class Perfilsv extends HttpServlet {



    private static final long serialVersionUID = 1L;



    @Override

    protected void doGet(HttpServletRequest request,

                         HttpServletResponse response)

            throws ServletException, IOException {



        response.sendRedirect(

            request.getContextPath() + "/CuentasSv"

        );

    }



    @Override

    protected void doPost(HttpServletRequest request,

                          HttpServletResponse response)

            throws ServletException, IOException {



        request.setCharacterEncoding("UTF-8");



        HttpSession sesion = request.getSession(false);



        if (sesion == null || sesion.getAttribute("usuarioId") == null) {

            response.sendRedirect(

                request.getContextPath() + "/vistas/inicioSesion.jsp"

            );

            return;

        }



        int id = (Integer) sesion.getAttribute("usuarioId");



        String nombre = limpio(request.getParameter("nombre"));

        String apellido = limpio(request.getParameter("apellido"));

        String email = limpio(request.getParameter("email")).toLowerCase();



        if (nombre.isEmpty() || apellido.isEmpty() || email.isEmpty()) {



            sesion.setAttribute("flashError",

                "Completá todos los campos.");



            response.sendRedirect(

                request.getContextPath() + "/CuentasSv"

            );

            return;

        }



        if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {



            sesion.setAttribute("flashError",

                "El correo electrónico no es válido.");



            response.sendRedirect(

                request.getContextPath() + "/CuentasSv"

            );

            return;

        }



        String sql =

            "UPDATE usuarios SET nombre = ?, apellido = ?, email = ? WHERE id = ?";



        try (Connection con = ConexionBD.conectar()) {



            if (con == null) {

                sesion.setAttribute("flashError",

                    "No se pudo conectar con la base de datos.");



                response.sendRedirect(

                    request.getContextPath() + "/CuentasSv"

                );

                return;

            }



            try (PreparedStatement ps = con.prepareStatement(sql)) {



                ps.setString(1, nombre);

                ps.setString(2, apellido);

                ps.setString(3, email);

                ps.setInt(4, id);



                int filas = ps.executeUpdate();



                if (filas > 0) {



                    sesion.setAttribute("usuarioNombre", nombre);



                    sesion.setAttribute("flashExito",

                        "¡Tu perfil se actualizó correctamente!");



                } else {



                    sesion.setAttribute("flashError",

                        "No se encontró tu cuenta para actualizar.");

                }

            }



        } catch (SQLException e) {



            e.printStackTrace();



            if (e.getErrorCode() == 1062) {



                sesion.setAttribute("flashError",

                    "Ese correo ya está registrado en otra cuenta.");



            } else {



                sesion.setAttribute("flashError",

                    "Ocurrió un error al guardar tus datos.");

            }

        }



        response.sendRedirect(

            request.getContextPath() + "/CuentasSv"

        );

    }



    private String limpio(String valor) {

        return valor == null ? "" : valor.trim();

    }

}