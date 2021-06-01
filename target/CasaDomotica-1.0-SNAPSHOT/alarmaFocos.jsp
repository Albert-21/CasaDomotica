<%-- 
    Document   : alarmaFocos
    Created on : 26 abr 2021, 17:42:40
    Author     : alberto
--%>

<%@page import="java.util.List"%>
<%@page import="org.teams.casadomotica.Alarma"%>
<%@page import="org.teams.casadomotica.ApiResource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ApiResource cliente = new ApiResource();
    List<Alarma> lista = null;

    String act = request.getParameter("act");

    if (act == null) {
    } else if (act.equals("agregar")) {
        if (request.getParameter("idFoco") != null && request.getParameter("nombre") != null && request.getParameter("descripcion") != null) {
            try {
                Alarma alarma = new Alarma();
                alarma.setId_dispositivo(request.getParameter("idFoco"));
                alarma.setId_dispositivo(request.getParameter("idAlarma"));
                alarma.setNombre(request.getParameter("nombre"));
                alarma.setDescripcion(request.getParameter("descripcion"));
                alarma.setEstado("activa");
                String fecha_Completa = request.getParameter("fecha");
                alarma.setFecha_inicio(fecha_Completa.substring(0, 13));
                alarma.setFecha_fin(fecha_Completa.substring(13, 23));
                alarma.setHora_inicio(request.getParameter("horaEncendido"));
                alarma.setHora_fin(request.getParameter("horaApagado"));

                cliente.guardarAlarma(alarma);
                lista = cliente.mostrarAlarmas();

            } catch (Exception e) {
            }
        }
    } else {
        if (act.equals("borrar")) {
            if (cliente.borrarAlarma(request.getParameter("idAlarmaBorrar"))) {
%>
<script>
    window.alert("Se elimino correctamente");
</script>
<%
            }else{
%>
<script>
    window.alert("Ocurrio un problema");
</script>
<%
                
            }
        }
    }
%>




<!DOCTYPE html>
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


        <title>Alarmas</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" >Inicio</a>
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
                <h1>Alarmas</h1>
                <!-- primera fila -->
                <div class="form-group">
                    <div class="row">
                        <!-- primera columna -->
                        <div class="col-md-4">
                            <input  class="form-control"type="text" name="idFoco" placeholder="Id Foco">
                        </div>
                        <div class="col-md-4">
                            <input  class="form-control"type="text" name="idAlarma" placeholder="Id Alarma">
                        </div>
                        <!-- segunda columna -->
                        <div class="col-md-4">
                            <input  class="form-control"type="text" name="nombre" placeholder="Nombre">
                        </div>
                        <!-- segunda columna -->
                        <br>
                        <div class="col-md-4">
                            <input  class="form-control"type="text" name="descripcion" placeholder="Descripcion">
                        </div>
                    </div>
                </div>
                <!-- segunda fila -->
                <div class="form-group">
                    <div class="row">
                        <script>
                            $(document).ready(function () {
                                $(function () {
                                    $('input[name="fecha"]').daterangepicker({
                                        "startDate": "01/01/2021",
                                        "endDate": "17/01/2021",
                                        opens: 'center',
                                        locale: {
                                            format: 'DD/MM/YYYY'
                                        }
                                    });
                                });
                            });
                        </script>
                        <div>
                            <form autocomplete="off">
                                <div >
                                    <div class="col-xl-5 col-lg-3 col-md-2 px-1">
                                        <div class="input-group input-daterange"> <label>Selecciona el rango para repetir la alarma </label> <input class="" type="text" name="fecha" value="01/01/2018 - 01/15/2018"  /> </div>
                                    </div>
                                </div>

                            </form>

                        </div>
                        <div>                                 
                            <p>Hora Apagado<input type="time" name="horaApagado" form="form-control"></p>
                            <p>Hora Encendido<input type="time" name="horaEncendido" form="form-control"></p>
                        </div>
                        <br>

                        </form>
                    </div>
                    <div>
                        <button class="btn btn-success" type="submit" name="act" value="agregar">Agregar</button>
                    </div>
                    <br>

                    <div class="col-md-4">
                        <input  class="form-control"type="text" name="idAlarmaBorrar" placeholder="Id Alarma a borrar">
                    </div>
                    <br>
                    <div class="col-md-4">
                        <button class="btn btn-danger" type="submit" name="act" value="borrar">Eliminar</button>
                    </div>

                </div>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID Alarma</th>
                            <th scope="col">ID Foco</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Fechas Repetir</th>
                            <th scope="col">Horario</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (lista != null) {
                                for (Alarma elem : lista) {
                                    out.print("<tr>");
                                    out.print("<th scope=row>" + elem.getId_alarma() + "</th>");
                                    out.print("<td>" + elem.getId_dispositivo() + "</td>");
                                    out.print("<td>" + elem.getNombre() + "</td>");
                                    out.print("<td>" + elem.getEstado() + "</td>");
                                    out.print("<td>" + elem.getDescripcion() + "</td>");
                                    out.print("<td>" + elem.getFecha_inicio() + " - " + elem.getFecha_fin() + "</td>");
                                    out.print("<td>" + elem.getHora_inicio() + " - " + elem.getHora_fin() + "</td>");
                                    out.println("</tr>");
                                }
                            }
                        %>
                    </tbody>
                </table>
                </body>
                </body>
                </html>

