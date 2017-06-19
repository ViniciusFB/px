<%-- 
    Document   : erroLogin
    Created on : 03/06/2017, 20:40:04
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Erro no Login</title>
        <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
        <link rel="stylesheet" href="css/cssLogin.css">
                
        <link rel="shortcut icon" type="image/png" href="imagens/favicon.png"/>
        <script src="js/prefixfree.min.js"></script>
    </head>

    <body>
        <div>
            <p>Erro no login!</p>
        </div>
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
            <h3 id="erro">Nome de usuário ou senha estão incorretos</h3>
        </form>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>





    </body>
</html>

