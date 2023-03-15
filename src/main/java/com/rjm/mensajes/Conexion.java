/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rjm.mensajes;
import java.sql.*;

/**
 *
 * @author Rodrigo
 */
public class Conexion {
    private static final String URL ="jdbc:mysql://localhost/mensajes?serverTimezone=UTC"; 
    private static final String USER ="root";
    private static final String PASS ="12345678";
    
    public static Connection Conexion() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        return DriverManager.getConnection(URL,USER, PASS);
    }
    
    public static void Cerrar(ResultSet rs) throws SQLException{
        rs.close();
    }
    
    public static void Cerrar(PreparedStatement ps) throws SQLException{
        ps.close();
    }
    
    public static void Cerrar(Connection conn) throws SQLException{
        conn.close();
    }
}
