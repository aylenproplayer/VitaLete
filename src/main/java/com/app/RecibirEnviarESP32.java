package com.app;


import java.io.IOException;
import java.io.PrintWriter;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RecibirEnviarESP32")
public class RecibirEnviarESP32 extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {
        // En GET los datos sí van en la URL, por lo que getQueryString() funciona bien aquí
        System.out.println("ESP32 [GET] -> llegó petición: " + request.getQueryString());
        recibirDatos(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        recibirDatos(request, response);
    }


    private void recibirDatos(HttpServletRequest request,
                              HttpServletResponse response)
                              throws IOException {


        String dispositivo = request.getParameter("dispositivo");
        String contador = request.getParameter("contador");


        // NUEVO: Imprime los parámetros reales directamente en la consola de Eclipse
        System.out.println("=========================================");
        System.out.println("ESP32 [POST] -> ¡Datos Recibidos!");
        System.out.println("Dispositivo: " + dispositivo);
        System.out.println("Contador: " + contador);
        System.out.println("=========================================");


        response.setContentType("text/html;charset=UTF-8");


        PrintWriter out = response.getWriter();


        out.println("<html>");
        out.println("<head><title>Datos ESP32</title></head>");
        out.println("<body>");


        out.println("<h1>Datos recibidos del ESP32</h1>");


        out.println("<h2>Dispositivo: "
                + (dispositivo != null ? dispositivo : "No recibido")
                + "</h2>");


        out.println("<h2>Contador: "
                + (contador != null ? contador : "No recibido")
                + "</h2>");


        out.println("</body>");
        out.println("</html>");
    }
}