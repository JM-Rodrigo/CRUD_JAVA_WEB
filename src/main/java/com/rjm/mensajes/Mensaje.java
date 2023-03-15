/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rjm.mensajes;

/**
 *
 * @author Rodrigo
 */
public class Mensaje {
    private int idMensaje;
    private String mensaje;
    private String autor;
    private String fecha;

    public Mensaje() {
    }

    public Mensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public Mensaje(String mensaje, String autor) {
        this.mensaje = mensaje;
        this.autor = autor;
    }

    public Mensaje(int idMensaje, String mensaje, String autor) {
        this.idMensaje = idMensaje;
        this.mensaje = mensaje;
        this.autor = autor;
    }

    public Mensaje(int idMensaje, String mensaje, String autor, String fecha) {
        this.idMensaje = idMensaje;
        this.mensaje = mensaje;
        this.autor = autor;
        this.fecha = fecha;
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Mensaje{idMensaje=").append(idMensaje);
        sb.append(", mensaje=").append(mensaje);
        sb.append(", autor=").append(autor);
        sb.append(", fecha=").append(fecha);
        sb.append('}');
        return sb.toString();
    }
    
    
    
}
