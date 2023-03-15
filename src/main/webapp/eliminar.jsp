<%-- 
    Document   : eliminar
    Created on : 15 mar 2023, 12:14:13
    Author     : Rodrigo
--%>

<%@page import="com.rjm.mensajes.MensajeDao"%>
<%@page import="com.rjm.mensajes.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String idMensaje = request.getParameter("idMensaje");
            Mensaje mensaje = new Mensaje(Integer.valueOf(idMensaje));
            MensajeDao mensajeDao = new MensajeDao();
            mensajeDao.eliminar(mensaje);
            response.sendRedirect("index.jsp");
            //request.getRequestDispatcher("index.jsp".formatted(request, response));
            
        %>
    </body>
</html>
