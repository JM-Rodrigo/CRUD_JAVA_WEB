/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rjm.mensajes;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Rodrigo
 */
public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        //Conexion.Conexion();
        //System.out.println("Conexion exitosa");
        /*
        Mensaje m1 = new Mensaje("Insert dese Java", "RJM");
        int registro = mensajeDao.insertar(m1);
        */
        MensajeDao mensajeDao = new MensajeDao();

        //Mensaje m2 = new Mensaje(2, "Actualizacion desde java","Rodrigo Javier Mtz");
        //int registro = mensajeDao.editar(m2);
        
        Mensaje m1 = new Mensaje(2);
        int registro = mensajeDao.eliminar(m1);
        
        
        
        
       
        List<Mensaje> mensajes = mensajeDao.seleccionar();
        
        for (Mensaje mensaje : mensajes) {
            System.out.println(mensaje);
            
        }
        
        
        
    }
}
