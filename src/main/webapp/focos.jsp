<%-- 
    Document   : Focos
    Created on : 25 abr 2021, 21:49:08
    Author     : alberto
--%>

<%@page import="java.util.List"%>
<%@page import="org.teams.casadomotica.Dispositivo"%>
<%@page import="org.teams.casadomotica.ApiResource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    ApiResource cliente = new ApiResource();
    List<Dispositivo> lista = null;

    String act = request.getParameter("act");

    if (act == null) {
        lista = cliente.mostrarFocos();
    } else if (act.equals("anadir")) {
        if (request.getParameter("nombre") != null && request.getParameter("descripcion") != null) {
            try {

                    Dispositivo dispositivo = new Dispositivo();
                    dispositivo.setId(request.getParameter("100"));
                    dispositivo.setNombre(request.getParameter("nombre"));
                    dispositivo.setDescripcion(request.getParameter("descripcion"));
                    dispositivo.setEstado("OFF");
                    dispositivo.setTipo("Foco");
                    dispositivo.setUsuario(session.getAttribute("user").toString());
                    cliente.guardarDispositivo(dispositivo);
                    lista = cliente.mostrarFocos();

            } catch (Exception e) {
            }
        }
    } else if (act.equals("encender")) {
        if (request.getParameter("idFoco") != null) {
            try {
                
                    Dispositivo dispositivo = new Dispositivo();
                    dispositivo.setId(request.getParameter("idFoco"));
                    dispositivo.setNombre(request.getParameter("nombre"));
                    dispositivo.setDescripcion(request.getParameter("descripcion"));
                    dispositivo.setEstado("ON");
                    dispositivo.setTipo("Foco");
                    dispositivo.setUsuario(session.getAttribute("user").toString());
                    cliente.actualizarEstadoDispositivo(dispositivo);
                    lista = cliente.mostrarFocos();

            } catch (Exception e) {
            }
        }
    } else if (act.equals("apagar")) {
        try {
            Dispositivo dispositivo = new Dispositivo();
            dispositivo.setId(request.getParameter("idFoco"));
            dispositivo.setNombre(request.getParameter("nombre"));
            dispositivo.setDescripcion(request.getParameter("descripcion"));
            dispositivo.setEstado("OFF");
            dispositivo.setTipo("Foco");
            dispositivo.setUsuario(session.getAttribute("user").toString());
            cliente.actualizarEstadoDispositivo(dispositivo);
            lista = cliente.mostrarFocos();
        } catch (Exception e) {
        }
    } else if (act.equals("actualizar")) {
        try {
            lista = cliente.mostrarFocos();
        } catch (Exception e) {
        }

    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


        <title>Focos</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="inicio.jsp">Inicio</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Focos
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="focos.jsp">Focos<span class="sr-only"></span></a>
                            <a class="dropdown-item" href="alarmaFocos.jsp">Alarma<span class="sr-only"></span></a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cortinas
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="cortinas.jsp">Cortinas<span class="sr-only"></span></a>
                            <a class="dropdown-item" href="alarmaCortinas.jsp">Alarma<span class="sr-only"></span></a>
                        </div>
                    </li>

                </ul>
            </div>
        </nav>
    <body>
        <div class="container" >

            <form style="margin:5%; background-color:#F2F2F2; padding: 5%; ">
                <h1>Foco</h1>
                <!-- primera fila -->
                <div class="form-group">
                    <div class="row">
                        <!-- primera columna -->
                        <div class="col-md-4">
                            <input  class="form-control"type="text" name="idFoco" placeholder="Id">
                        </div>
                        <!-- segunda columna -->
                        <div class="col-md-4">
                            <input  class="form-control"type="text" name="nombre" placeholder="Nombre">
                        </div>
                        <!-- tercera columna -->
                        <div class="col-md-4">
                            <input  class="form-control"type="text" name="descripcion" placeholder="Descripcion">
                        </div>
                    </div>
                </div>
                <!-- segunda fila -->
                <div class="form-group">
                    <br>
                    <div>
                        <button class="btn btn-success" name="act" value="anadir" type="submit">Anadir</button>

                        <button class="btn btn-success" name="act" value="actualizar" type="submit">Actualizar</button>

                        <button class="btn btn-success" name="act" value="encender" type="submit">Encender</button>

                        <button class="btn btn-danger" name="act" value="apagar" type="submit">Apagar</button>
                    </div>
            </form>

        </div>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Descripción</th>
                </tr>
            </thead>
            <tbody>


                <%                    if (lista != null) {
                        for (Dispositivo elem : lista) {
                            out.print("<tr>");
                            out.print("<th scope=row>" + elem.getId() + "</th>");
                            out.print("<td>" + elem.getNombre() + "</td>");
                            out.print("<td>" + elem.getEstado() + "</td>");
                            out.print("<td>" + elem.getDescripcion() + "</td>");
                            out.println("</tr>");
                        }

                    }
                %>

            </tbody>
        </table>
    </body>
</body>
</html>
