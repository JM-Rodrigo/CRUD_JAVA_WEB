/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rjm.mensajes;
import java.sql.*;
import java.util.*;
import static com.rjm.mensajes.Conexion.*;

/**
 *
 * @author Rodrigo
 */
public class MensajeDao {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Mensaje mensaje;
    
    public List<Mensaje> seleccionar() throws ClassNotFoundException, SQLException{
        String sql = "SELECT * FROM mensajes";
        List<Mensaje> mensajes = new ArrayList<>();
        
        try {
            this.conn = Conexion();
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            
            while (this.rs.next()) {
                int idMensaje = this.rs.getInt("idMensaje");
                String men = this.rs.getString("mensaje");
                String autor = this.rs.getString("autor");
                String fecha = this.rs.getString("fecha");
                
                this.mensaje = new Mensaje(idMensaje, men, autor, fecha);
                mensajes.add(this.mensaje);
    
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }finally{
            Cerrar(this.rs);
            Cerrar(this.ps);
            Cerrar(this.conn);
        }
        return mensajes;
    }
    
    public int insertar(Mensaje mensaje) throws ClassNotFoundException, SQLException{
        String sql = "INSERT INTO mensajes VALUES(DEFAULT,?,?,CURRENT_TIME())";
        int registro = 0;
        
        try {
            this.conn = Conexion();
            this.ps = this.conn.prepareStatement(sql);
            
            this.ps.setString(1,mensaje.getMensaje());
            this.ps.setString(2,mensaje.getAutor());
            registro = this.ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }finally{
            Cerrar(this.ps);
            Cerrar(this.conn);
        }
        return registro;
    }
    
    public int editar (Mensaje mensaje) throws ClassNotFoundException, SQLException{
        String sql = "UPDATE mensajes SET mensaje=?, autor=? WHERE idMensaje = ?";
        int registro = 0;
        
        try {
            this.conn = Conexion();
            this.ps = this.conn.prepareStatement(sql);
            
            this.ps.setString(1,mensaje.getMensaje());
            this.ps.setString(2,mensaje.getAutor());
            this.ps.setInt(3,mensaje.getIdMensaje());
            registro = this.ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }finally{
            Cerrar(this.ps);
            Cerrar(this.conn);
        }
        return registro;
    }
    
    public int eliminar (Mensaje mensaje) throws ClassNotFoundException, SQLException{
        String sql = "DELETE FROM mensajes WHERE idMensaje = ?";
        int registro = 0;
        
        try {
            this.conn = Conexion();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1,mensaje.getIdMensaje());
            registro = this.ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }finally{
            Cerrar(this.ps);
            Cerrar(this.conn);
        }
        return registro;
    }
   
}
