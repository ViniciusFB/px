<%-- 
    Document   : login
    Created on : 03/06/2017, 17:14:11
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>PROJETO X - LOGIN</title>
        <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
        <link rel="stylesheet" href="css/cssLogin.css">
        
        <link rel="shortcut icon" type="image/png" href="imagens/favicon.png"/>
        <script src="js/prefixfree.min.js"></script>
    </head>

    <body>
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>PROJETO <span>X</span></div>
        </div>
        <br>
        <form class="form-signin" method="post" action="login">       
            <div class="login">
                <input type="text"  name="usuario" id="username" placeholder="Usuário: " required="" autofocus=""/>
                <input type="password" name="senha" id="password" placeholder="Senha: " required=""/>
                <input type="submit" value="Entrar">
            </div>
        </form>
    </body>
</html>
