<%@page import="com.emergentes.entidades.Estudiante"%>
<%
    Estudiante est = (Estudiante) request.getAttribute("estudiante");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Registrar Estudiante</h1>
            <form action="MainController" method="post">
                <input type="hidden" name="id" value="<%= est.getId()%>">
                 <div class="mb-3">
                    <label for="" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" value="<%= est.getNombre()%>" placeholder="Escriba su nombre">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Apellidos</label>
                    <input type="text" class="form-control" name="apellidos" value="<%= est.getApellidos()%>" placeholder="Escriba su apellido">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Correo</label>
                    <input type="email" class="form-control" name="email" value="<%= est.getEmail()%>"placeholder="Escriba su correo">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Fecha Nacimiento</label>
                    <input type="date" class="form-control" name="fechaNacimiento" value="<%= est.getFechaNacimiento()%>"placeholder="Escriba su fecha Nac.">
                </div>
               
                <button type="submit" class="btn btn-primary btn-lg">ENVIAR</button>
                
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
