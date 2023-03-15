<%-- 
    Document   : editar
    Created on : 15 mar 2023, 11:48:36
    Author     : Rodrigo
--%>

<%@page import="com.rjm.mensajes.Mensaje"%>
<%@page import="com.rjm.mensajes.MensajeDao"%>
<%@page import="com.rjm.mensajes.MensajeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="editar.jsp" method="POST">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Editar Mensajes</h5>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <input type="hidden" name="idMensaje" value="<%=request.getParameter("idMensaje")%>">
                            <label class="form-label">Ingresa un mensaje</label>
                            <textarea class="form-control" name="mensaje"><%=request.getParameter("mensaje")%></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Ingresa el autor</label>
                            <input type="text" name="autor" class="form-control" value="<%=request.getParameter("autor")%>">
                        </div>

                    </div>

                    <div class="modal-footer">
                        <a href="index.jsp" type="submit" class="btn btn-danger">Regresar</a>
                        <input type="submit" name="guardar" class="btn btn-primary" src="index.jsp" value="Guardar Cambios">
                    </div>
                </form>

               
            </div>
        </div>

        <%
            MensajeDao mensajeDao = new MensajeDao();
            String idMensaje = request.getParameter("idMensaje");

            if (request.getParameter("guardar") != null) {
                Mensaje mnm = new Mensaje(Integer.parseInt(idMensaje.trim()), request.getParameter("mensaje"), request.getParameter("autor"));
                mensajeDao.editar(mnm);

            }

        %>

    </body>
</html>
