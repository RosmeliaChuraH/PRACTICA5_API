<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.entidades.Estudiante"%>
<%
    List<Estudiante> estudiantes = (List<Estudiante>) request.getAttribute("estudiantes");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            body {
                background-image: url('https://img.freepik.com/foto-gratis/paquete-hojas-papel-tonos-azules-espacio-copia_23-2148320442.jpg?t=st=1717470030~exp=1717473630~hmac=dc3aaefea7a8153dcb9305eac147cbcb5ee8f7101ea20604b050454937302d3b&w=826'); /* Reemplaza 'ruta/a/tu/imagen.jpg' con la ruta de tu imagen de fondo */
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Listado de Estudiantes</h1>
            <p><a href="MainController?action=add" class="btn btn-primary btn-lg"><i class="fa-sharp fa-solid fa-circle-plus"></i> Nuevo</a></p>
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Correo</th>
                    <th>Fecha Nacimiento</th>
                    <th></th>
                    <th></th>
                </tr>

                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    for (Estudiante item : estudiantes) {
                %>
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getNombre()%></td>
                    <td><%= item.getApellidos()%></td>
                    <td><%= item.getEmail()%></td>
                    <td><%= sdf.format(item.getFechaNacimiento())%></td> <!-- Aquí se formatea la fecha -->

                    <td><a class="btn btn-warning" href="MainController?action=edit&id=<%= item.getId()%>"><i class="fa-sharp fa-solid fa-pen-to-square"></i> Editar</a></td>
                    <td><a <a class="btn btn-danger" href="MainController?action=delete&id=<%= item.getId()%>" onclick="return(confirm('Estas seguro de Eliminar???'))"><i class="fa-sharp fa-solid fa-trash"></i> Eliminar</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
