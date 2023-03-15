<%-- 
    Document   : index
    Created on : 14 mar 2023, 13:18:13
    Author     : Rodrigo
--%>

<%@page import="java.util.*"%>
<%@page import="com.rjm.mensajes.Mensaje"%>
<%@page import="com.rjm.mensajes.MensajeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mesajes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="index.jsp" method="POST">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Mensajes</h5>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Ingresa un mensaje</label>
                            <textarea class="form-control" name="mensaje"></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Ingresa el autor</label>
                            <input type="text" name="autor" class="form-control">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
        <%
            MensajeDao mensajeDao = new MensajeDao();
            if (request.getParameter("guardar") != null) {
                    Mensaje mnm = new Mensaje(request.getParameter("mensaje"), request.getParameter("autor"));
                    mensajeDao.insertar(mnm);

                }

        %>

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Lista de Mensajes</h5>
                </div>
                <%                    List<Mensaje> mensajes = mensajeDao.seleccionar();
                    Collections.reverse(mensajes);

                    for (Mensaje mensaje : mensajes) {

                %>
                <div class="modal-body">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%=mensaje.getAutor()%></h5>
                            <p class="card-text"><%=mensaje.getMensaje()%></p>
                            <p class="blockuote-footer"><cite><%=mensaje.getFecha()%></cite></p>
                            <a href="editar.jsp?idMensaje=<%=mensaje.getIdMensaje()%>&&mensaje=<%=mensaje.getMensaje()%>&&autor=<%=mensaje.getAutor()%>" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="eliminar.jsp?idMensaje=<%=mensaje.getIdMensaje()%>" class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>


    </body>
</html>
