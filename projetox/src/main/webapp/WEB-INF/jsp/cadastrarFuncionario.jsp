<%-- 
    Document   : cadastrarFuncionario
    Created on : 03/06/2017, 19:46:13
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html class="no-js" lang="">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastrar Funcionário</title>
        <link rel="stylesheet" type="text/css" href="css/funcionario.css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link href="css/cadastros.css" rel="stylesheet">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script language="javascript" src="js/cpf.js"></script>
        <script language="javascript" src="js/telefone.js"></script>
        <script language="javascript" src="js/limpar.js"></script>
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
                <form class="form-inline" action="CadastrarFuncServlet02" method="post"  id="form_cadastro">
                    <center>
                        <legend> Cadastro de Funcionário </legend>
                        <fieldset>
                            <div class="form-group">
                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="nome">Nome:</label>
                                    <input  name="nome" required placeholder="Primeiro Nome" style="width:200px; margin-right: 50px;" maxlength="50" class="form-control"  type="text">
                                </div>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="nome">Sobrenome:</label>
                                    <input  name="sobrenome" required placeholder="Sobrenome" style="width:200px; margin-right: 0px;" maxlength="50" class="form-control"  type="text">
                                </div>

                                </br></br>
                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="cpf">CPF: </label>
                                    <input name="cpf" required style="width:210px; margin-right: 50px;" placeholder="000.000.000-00" class="form-control" maxlength="14" type="text" onkeypress="javascript: mascara(this, cpf_mask)">
                                </div>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="nome">Nascimento: </label>
                                    <input  name="dataNasc" required style="width:200px; margin-right: 0px;" class="form-control" min="1900-01-01" max="2017-12-31" type="date">
                                </div>

                                </br></br>


                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="email">E-mail: </label>
                                    <input id="email" name="email" style="width:200px; margin-right: 50px;" required placeholder="E-mail" maxlength="50" class="form-control"  type="email">
                                </div>



                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="telefone">Telefone: </label>
                                    <input id="telefone" name="telefone" style="width:218px; margin-right: 0px;" maxlength="14" required placeholder="(xx)xxxxx-xxxx" class="form-control" type="text">

                                </div>

                                </br></br>


                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="telefone">Estado: </label>
                                    <select style="width:195px; margin-right: 50px;" required name="estado" class="form-control selectpicker">
                                        <option value="" disabled selected>Selecione um Estado...</option>
                                        <option value="Acre">Acre</option>
                                        <option value="Alagoas">Alagoas</option>
                                        <option value="Amapá">Amapá</option>
                                        <option value="Amazonas">Amazonas</option>
                                        <option value="Bahia">Bahia</option>
                                        <option value="Ceará">Ceará</option>
                                        <option value="Distrito Federal">Distrito Federal</option>
                                        <option value="Espirito Santo">Espírito Santo</option>
                                        <option value="Goiás">Goiás</option>
                                        <option value="Maranhão">Maranhão</option>
                                        <option value="Mato Grosso">Mato Grosso</option>
                                        <option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
                                        <option value="Minas Gerais">Minas Gerais</option>
                                        <option value="Pará">Pará</option>
                                        <option value="Paraíba">Paraíba</option>
                                        <option value="Paraná">Paraná</option>
                                        <option value="Pernambuco">Pernambuco</option>
                                        <option value="Piauí">Piauí</option>
                                        <option value="Rio de Janeiro">Rio de Janeiro</option>
                                        <option value="Rio Grande do Norte">Rio Grande do Norte</option>
                                        <option value="Rio Grande do Sul">Rio Grande do Sul</option>
                                        <option value="Rondônia">Rondônia</option>
                                        <option value="Roraima">Roraima</option>
                                        <option value="Santa Catarina">Santa Catarina</option>
                                        <option value="São Paulo">São Paulo</option>
                                        <option value="Sergipe">Sergipe</option>
                                        <option value="Tocantins">Tocantins</option>

                                    </select>
                                </div>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="cargo">Cargo: </label>
                                    <select style="width:235px; margin-right: 0px;"  required name="cargo" class="form-control selectpicker">
                                        <option value="" disabled selected>Selecione um cargo...</option>
                                        <option>Admin</option>
                                        <option>Vendedor</option>
                                        <option >Estoquista</option>
                                        <option >Gerente</option>

                                    </select>
                                </div>

                                </br></br>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="login">Login: </label>
                                    <input name="login" required placeholder="Login" class="form-control" maxlength="20" style="width:200px; margin-right: 50px;" type="text">

                                </div>
                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="senha">Senha: </label>
                                    <input name="senha" required placeholder="Senha" class="form-control" maxlength="20" style="width:230px; margin-right: 0px;" type="password">

                                </div>

                                <!--                                <div class="input-group" style="width: 200px;">
                                                                    <label class="input-group-addon" style="width:100px;" for="senha">Confirme a senha: </label>
                                                                    <input  name="confirmaSenha" required placeholder="Confirme a senha" class="form-control" style="width:200px;" type="password">
                                                                </div>-->
                            </div>
                        </fieldset>
                    </center>
                    </br></br>

                    <div id="btns">
                        <a class="btn btn-warning" style="width: 200px; margin-left: 25px; margin-right: 50px;" onclick="limparCampos()">Limpar</a>
                        <input class="btn btn-success" type="submit" style="width: 200px;" id="btnCadastro" value="Cadastrar" onclick="return validar()"/>
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
        <script src="js/cadastros.js"></script>
    </body>

    <footer class="footer">
        <p class="text-center">Copyright &copy; 2017, ProjetoX</p>
    </footer>

</html>
