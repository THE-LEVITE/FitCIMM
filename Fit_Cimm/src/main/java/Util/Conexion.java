/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Conexión a MySQL (XAMPP)
 * Base de datos: parqueadero_boyaca
 */
public class Conexion {

    private static final String URL    = "jdbc:mysql://localhost:3306/fitcimm?useSSL=false&serverTimezone=America/Bogota&characterEncoding=UTF-8";
    private static final String USUARIO = "root";
    private static final String CLAVE   = "";  

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver MySQL no encontrado", e);
        }
    }

    public static Connection getConexion() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, CLAVE);
    }
}
