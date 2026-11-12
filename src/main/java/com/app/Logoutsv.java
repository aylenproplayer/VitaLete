package com.app;



import java.io.IOException;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;



@WebServlet("/logout")

public class Logoutsv extends HttpServlet {



    private static final long serialVersionUID = 1L;



    @Override

    protected void doGet(HttpServletRequest request,

                         HttpServletResponse response)

            throws ServletException, IOException {



        HttpSession sesion = request.getSession(false);



        if (sesion != null) {

            sesion.invalidate();

        }



        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        response.setHeader("Pragma", "no-cache");

        response.setDateHeader("Expires", 0);



        response.sendRedirect(

            request.getContextPath() + "/vistas/Inicio.jsp"

        );

    }



    @Override

    protected void doPost(HttpServletRequest request,

                          HttpServletResponse response)

            throws ServletException, IOException {



        doGet(request, response);

    }

}