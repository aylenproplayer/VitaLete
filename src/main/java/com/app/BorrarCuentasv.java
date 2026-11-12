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

@WebServlet("/BorrarCuentasv")
public class BorrarCuentasv extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/CuentasSv");
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);

        if (sesion == null || sesion.getAttribute("usuarioId") == null) {
            response.sendRedirect(
                request.getContextPath() + "/vistas/inicioSesion.jsp"
            );
            return;
        }

        int usuarioId = (Integer) sesion.getAttribute("usuarioId");
        String sql = "DELETE FROM usuarios WHERE id = ?";

        try (Connection con = ConexionBD.conectar()) {

            if (con == null) {
                sesion.setAttribute("flashError",
                    "No se pudo conectar con la base de datos.");
                response.sendRedirect(request.getContextPath() + "/CuentasSv");
                return;
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, usuarioId);
                int filas = ps.executeUpdate();

                if (filas > 0) {
                    sesion.invalidate();

                    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                    response.setHeader("Pragma", "no-cache");
                    response.setDateHeader("Expires", 0);

                    response.sendRedirect(
                        request.getContextPath() + "/vistas/Inicio.jsp"
                    );
                    return;
                } else {
                    sesion.setAttribute("flashError",
                        "No se encontró la cuenta para eliminar.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            sesion.setAttribute("flashError",
                "No se pudo eliminar la cuenta. Verificá que no tenga datos vinculados.");
        }

        response.sendRedirect(request.getContextPath() + "/CuentasSv");
    }
}