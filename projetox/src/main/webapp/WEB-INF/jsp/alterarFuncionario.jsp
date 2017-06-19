<%-- 
    Document   : alterarProduto
    Created on : 04/06/2017, 20:46:42
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
    <head>
        <title>Alterar Funcionario</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/funcionario.css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link href="css/cadastros.css" rel="stylesheet">
        <script src="js/Funcionario.js" type="text/javascript"></script>
        <link rel="shortcut icon" type="image/png" href="imagens/favicon.png"/>
    </head>
    <body>
        <div id="interface">
            <header id="logado">
                <p>Usuário logado: ${usuario}</p>
                <!--<p>Cargo: ${cargo}</p>-->
            </header>
            <header id="cabecalho">
                <a href="/projetox/home">
                    <img  id="imgLogo" src="imagens/px-logo.png" onclick="" title="Home"/></a>
            </header>
            <header id="logout">
                <a href="/projetox/logout"><p>SAIR</p></a>
            </header>
            <header id="menuDinamico" align="center">
                <c:choose>
                    <c:when test="${cargo=='Admin'}"><img src="imagens/adm.png" id="imgMenuDinamico"/></c:when>
                    <c:when test="${cargo=='Vendedor'}"><img src="imagens/vendedor.png" id="imgMenuDinamico"/></c:when>
                    <c:when test="${cargo=='Gerente'}"><img src="imagens/gerente.png" id="imgMenuDinamico"/></c:when>
                    <c:when test="${cargo=='Estoquista'}"><img src="imagens/estoquista.png" id="imgMenuDinamico"/></c:when>
                </c:choose>
            </header>
            <section id="corpo">
                <form class="form-inline" action="AlterarFuncServlet02" method="post" id="form_cadastro">
                    <center>
                        <legend>Alterar Funcionário</legend>
                        <fieldset>
                            <div class="form-group">
                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="id">ID Funcionario:</label>
                                    <input  name="id" readonly="true" value="${id}" style="width:180px; margin-right: 60px;" class="form-control"  type="text">
                                </div>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="cpf">CPF: </label>
                                    <input name="cpf" readonly="true" value="${cpf}" style="width:210px; margin-right: 0px;" placeholder="000.000.000-00" class="form-control" maxlength="14" type="text" onkeypress="javascript: mascara(this, cpf_mask)">
                                </div>

                                </br></br>


                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="nome">Nome:</label>
                                    <input  name="nome" required value="${nome}" placeholder="Primeiro Nome" style="width:240px; margin-right: 50px;" maxlength="50" class="form-control"  type="text">
                                </div>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="nome">Sobrenome:</label>
                                    <input  name="sobrenome" required value="${sobrenome}" placeholder="Sobrenome" style="width:170px; margin-right: 0px;" maxlength="50" class="form-control"  type="text">
                                </div>

                                </br></br>


                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="dataNasc">Nascimento: </label>
                                    <input  name="dataNasc" required value="${dataNasc}" style="width:200px; margin-right: 50px;" class="form-control" min="1900-01-01" max="2017-12-31" type="date">
                                </div>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="email">E-mail: </label>
                                    <input id="email" name="email" value="${email}" style="width:200px; margin-right: 0px;" required placeholder="E-mail" maxlength="50" class="form-control"  type="email">
                                </div>

                                </br></br>


                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:200px;" for="telefone">Telefone: </label>
                                    <input id="telefone" name="telefone" value="${telefone}" style="width:220px; margin-right: 50px;" maxlength="15" required placeholder="(xx)xxxxx-xxxx" class="form-control" type="text">
                                </div>


                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:200px;" for="login">Login: </label>
                                    <input name="login" required value="${login}" readonly class="form-control" maxlength="50" style="width:200px; margin-right:0px;" type="text">

                                </div>

                            </div>
                        </fieldset>
                    </center>
                    </br></br>

                    <div style="left: 45%; position: absolute;">
                        <input class="btn btn-warning" type="submit" style="width: 200px;" name="alterarBotao" id="btnCadastro" value="Alterar" onclick="return validar()"/>
                    </div>

                    </br></br>
                    </br></br>
                    <p id="mensagem" class="text-center" style="background-color: hsla(120,100%,50%,0.3);"> ${funcionario} </p>
                </form>
            </section>

            <aside id="menuLateral">
                <ul>
                    <c:choose>
                        <c:when test="${cargo=='Admin'}">
                            <li><a href="/projetox/CadastrarFuncServlet01">CADASTRAR<br>FUNCIONÁRIO</a></li> 
                            <li><a href="/projetox/FuncionarioServlet01">CONSULTAR<br>FUNCIONÁRIOS</a></li> 
                            <li><a href="/projetox/CadastrarProdutoServlet01">CADASTRAR<br>PRODUTO</a></li>
                            <li><a href="/projetox/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li>
                            <li><a href="/projetox/CadastrarCliServlet01">CADASTRAR<br>CLIENTE</a></li>
                            <li><a href="/projetox/ClienteServlet01">CONSULTAR<br>CLIENTES</a></li>
                            <li><a href="/projetox/VendaServlet01">VENDER<br>PRODUTOS</a></li>
                            <li><a href="/projetox/RelatorioServlet01">GERAR<br>RELATÓRIOS</a></li>

                        </c:when>                    

                        <c:when test="${cargo=='Estoquista'}">
                            <li><a href="/projetox/CadastrarProdutoServlet01">CADASTRAR<br>PRODUTO</a></li>
                            <li><a href="/projetox/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li> </c:when>

                        <c:when test="${cargo=='Vendedor'}">
                            <li><a href="/projetox/VendaServlet01">VENDER<br>PRODUTOS</a></li>
                            <li><a href="/projetox/CadastrarCliServlet01">CADASTRAR<br>CLIENTE</a></li>
                            <li><a href="/projetox/ClienteServlet01">CONSULTAR<br>CLIENTES</a></li>

                        </c:when>

                        <c:when test="${cargo=='Gerente'}">
                            <li><a href="/projetox/RelatorioServlet01">GERAR<br>RELATÓRIOS</a></li> </c:when>

                    </c:choose>
                </ul>
            </aside>



        </div>
    </body>

    <footer class="footer">
        <p class="text-center">Copyright &copy; 2017, ProjetoX</p>
    </footer>

</html>
