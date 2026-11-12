package com.app;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;



public class ConexionBD {



    private static final String URL ="jdbc:mysql://localhost:3306/vitalete";



    private static final String USUARIO = "proyectos";//proyectos

    private static final String PASSWORD = "Fatima5totc";//Fatima5totc



    public static Connection conectar() {



        try {

            Class.forName("com.mysql.cj.jdbc.Driver");



            Connection conexion = DriverManager.getConnection(

                URL,

                USUARIO,

                PASSWORD

            );



            System.out.println("¡Conexión exitosa a MySQL!");



            return conexion;



        } catch (ClassNotFoundException e) {



            System.err.println("No se encontró el driver de MySQL.");

            e.printStackTrace();



        } catch (SQLException e) {



            System.err.println("ERROR AL CONECTAR CON MYSQL:");

            e.printStackTrace();

        }



        return null;

    }



    public static void main(String[] args) {

        conectar();

    }

}