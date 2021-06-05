<%-- 
    Document   : registro
    Created on : 25 abr 2021, 23:15:01
    Author     : alberto
--%>

<%@page import="org.teams.casadomotica.ApiResource"%>
<%@page import="org.teams.casadomotica.ClientApi"%>
<%@page import="org.teams.casadomotica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css'>
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'><link rel="stylesheet" href="./style.css">

    </head>
    <body>
        <!-- partial:index.partial.html -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-2"></div>
                <div class="col-lg-6 col-md-8 login-box">
                    <div class="col-lg-12 login-key">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                    <div class="col-lg-12 login-title">
                        REGISTRO
                    </div>

                    <div class="col-lg-12 login-form">
                        <div class="col-lg-12 login-form">
                            <form>
                        </div><div class="form-group">
                            <label class="form-control-label">Nombre de usuario</label>
                            <input type="text" name="nombreUsuario" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">Contraseña</label>
                            <input type="password" name="contrasena" class="form-control" i>
                        </div>

                        <div class="col-lg-12 loginbttm">
                            <div class="col-lg-6 login-btm login-text">
                                <!-- Error Message -->
                            </div>
                            <div class="col-lg-6 login-btm login-button">
                                <div
                                    <div></div>
                                <a href="index.jsp" class="btn btn-outline-primary">Cancelar</a>
                                <button name="act" value="guardar" type="submit" class="btn btn-outline-primary">Registrar</button>
                                <%
                                    Usuario usuario;
                                    ApiResource cliente = new ApiResource();
                                    String act = request.getParameter("act");

                                    if (act == null) {
                                    } else if (act.equals("guardar")) {
                                        if (request.getParameter("nombreUsuario") != null && request.getParameter("contrasena") != null) {
                                            try {

                                                usuario = new Usuario();
                                                usuario.setUsuario(request.getParameter("nombreUsuario"));
                                                usuario.setContrasena(request.getParameter("contrasena"));
                                                boolean res = cliente.guardarUsuario(usuario);

                                                if (res) {
                                                    response.sendRedirect("index.jsp");
                                                }
                                            } catch (Exception e) {
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
        <!-- partial -->

    </body>
</html>
