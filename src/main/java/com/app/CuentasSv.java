package com.app;



import java.io.IOException;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;

import java.util.Map;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;



@WebServlet("/CuentasSv")

public class CuentasSv extends HttpServlet {



    private static final long serialVersionUID = 1L;



    @Override

    protected void doGet(HttpServletRequest request,

                         HttpServletResponse response)

            throws ServletException, IOException {



        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        response.setHeader("Pragma", "no-cache");

        response.setDateHeader("Expires", 0);



        HttpSession sesion = request.getSession(false);



        if (sesion == null || sesion.getAttribute("usuarioId") == null) {

            response.sendRedirect(

                request.getContextPath() + "/vistas/inicioSesion.jsp"

            );

            return;

        }



        int usuarioId = (Integer) sesion.getAttribute("usuarioId");



        String sqlPerfil =

            "SELECT nombre, apellido, email FROM usuarios WHERE id = ?";



        String sqlUsuarios =

            "SELECT id, nombre, apellido, email, fecha_registro FROM usuarios";



        List<Map<String, String>> usuarios = new ArrayList<>();



        try (Connection con = ConexionBD.conectar()) {



            if (con == null) {

                request.setAttribute("error",

                    "No se pudo conectar con la base de datos.");



                request.getRequestDispatcher("/vistas/Cuentas.jsp")

                       .forward(request, response);

                return;

            }



            // Datos del usuario que inició sesión

            try (PreparedStatement ps = con.prepareStatement(sqlPerfil)) {



                ps.setInt(1, usuarioId);



                try (ResultSet rs = ps.executeQuery()) {



                    if (rs.next()) {



                        request.setAttribute("nombrePerfil",

                            rs.getString("nombre"));



                        request.setAttribute("apellidoPerfil",

                            rs.getString("apellido"));



                        request.setAttribute("emailPerfil",

                            rs.getString("email"));



                    } else {



                        sesion.invalidate();



                        response.sendRedirect(

                            request.getContextPath() + "/vistas/inicioSesion.jsp"

                        );

                        return;

                    }

                }

            }



            // Lista de usuarios registrados

            try (PreparedStatement ps = con.prepareStatement(sqlUsuarios);

                 ResultSet rs = ps.executeQuery()) {



                while (rs.next()) {



                    Map<String, String> usuario = new HashMap<>();



                    usuario.put("id",

                        String.valueOf(rs.getInt("id")));



                    usuario.put("nombre",

                        rs.getString("nombre"));



                    usuario.put("apellido",

                        rs.getString("apellido"));



                    usuario.put("email",

                        rs.getString("email"));



                    usuario.put("fecha_registro",

                        String.valueOf(rs.getTimestamp("fecha_registro")));



                    usuarios.add(usuario);

                }

            }



            request.setAttribute("usuarios", usuarios);



            Object mensajeExito = sesion.getAttribute("flashExito");

            Object mensajeError = sesion.getAttribute("flashError");



            if (mensajeExito != null) {

                request.setAttribute("exito", mensajeExito);

                sesion.removeAttribute("flashExito");

            }



            if (mensajeError != null) {

                request.setAttribute("error", mensajeError);

                sesion.removeAttribute("flashError");

            }



            request.getRequestDispatcher("/vistas/Cuentas.jsp")

                   .forward(request, response);



        } catch (SQLException e) {



            e.printStackTrace();



            request.setAttribute("error",

                "No se pudieron cargar los datos de las cuentas.");



            request.getRequestDispatcher("/vistas/Cuentas.jsp")

                   .forward(request, response);

        }

    }

}