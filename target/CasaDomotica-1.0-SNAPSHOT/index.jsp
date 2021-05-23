<%@page import="org.teams.casadomotica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Panel Log in</title>
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
                        <i class="fa fa-sign-in" aria-hidden="true"></i>
                    </div>
                    <div class="col-lg-12 login-title">
                        LOGIN
                    </div>

                    <div class="col-lg-12 login-form">
                        <div class="col-lg-12 login-form">
                            <form>
                                <div class="form-group">
                                    <label class="form-control-label">USUARIO</label>
                                    <input type="text" name="Usuarioo" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label">CONTRASEÑA</label>
                                    <input type="password" name="contrasena" class="form-control" i>
                                </div>

                                <div class="col-lg-12 loginbttm">
                                    <div class="col-lg-6 login-btm login-text">
                                        <!-- Error Message -->
                                    </div>
                                    <div class="col-lg-6 login-btm login-button">
                                        <button type="submit" name="act" value="iniciarSesion" class="btn btn-outline-primary">INICIAR SESION</button>
                                        <%
                                            ApiClient cliente = new ApiClient();
                                            
                                            String act = request.getParameter("act");

                                            if (act == null) {
                                            } else if (act.equals("iniciarSesion")) {
                                                if (request.getParameter("Usuarioo") != null && request.getParameter("contrasena") != null) {
                                                    try {

                                                        Usuario usuario = new Usuario();
                                                        usuario.setUsuario(request.getParameter("Usuarioo"));
                                                        usuario.setContrasena(request.getParameter("contrasena"));
                                                        Usuario usu = cliente.getUsuario(usuario, Usuario.class)

                                                        if (usu != null) {
                                                           response.sendRedirect("/focos.jsp");
                                                        }
                                                    } catch (Exception e) {
                                                    }
                                                }
                                            }
                                        %>

                                        <script>
                                        </script>
                                        <div>
                                            <a href="registro.jsp" class="btn btn-outline-primary">REGISTRARSE</a>
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