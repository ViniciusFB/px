<%-- 
    Document   : cadastrarProduto
    Created on : 03/06/2017, 19:29:14
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html class="no-js" lang="">
    <head>
        <title>Cadastrar Produto</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/funcionario.css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link href="css/cadastros.css" rel="stylesheet">
        <script src="js/Funcionario.js" type="text/javascript"></script>
        <script src="js/limpar.js" type="text/javascript"></script>
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
                <form class="form-inline" action="CadastrarProdutoServlet02" method="post"  id="form_cadastro">
                    <center>
                        <legend>Cadastro de Produto</legend>
                        <fieldset>

                            </br>
                            <div class="form-group">

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="nome">Nome:</label>
                                    <input  name="nome" required placeholder="Nome do Produto" style="width:200px; margin-right: 50px;" maxlength="50" class="form-control" type="text">
                                </div>

                                <!-- Text input-->

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:100px;" for="codigo">Código</label> 
                                    <input name="codigo" required placeholder="Codigo" style="width:200px; margin-right: 25px;" maxlength="10" class="form-control" type="text">
                                </div>

                                </br></br>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:200px;" for="valor">Valor</label> 
                                    <input class="form-control" placeholder="Digite o Preço" style="width:210px; margin-right: 50px;" type="text" name="valor" required/>
                                </div>

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:200px;" for="tipo">Tipo</label>
                                    <select style="width:210px; margin-right:25px;" required name="tipo" class="form-control selectpicker">
                                        <option value="" disabled selected>Selecione o tipo..</option>
                                        <option value="Bolsa">Bolsa</option>
                                        <option value="Relogio">Relógio</option>
                                        <option value="Oculos">Óculos</option>
                                        <option value="Bone">Boné</option>
                                    </select>
                                </div>
                                </br></br>



                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:200px;" for="quantidade">Qtde</label>  
                                    <input name="quantidade" required placeholder="Quantidade" min="1" max="1000" style="width:210px; margin-right: 50px;" class="form-control" type="number">
                                </div>


                                <!-- Text input-->
                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:200px;" for="filial">Filial</label>
                                    <select style="width:210px; margin-right:25px;" required name="filial" class="form-control">
                                        <option value="" disabled selected>Selecione a filial..</option>
                                        <c:forEach items="${listaFilial}" var="filial">
                                            <option value="${filial.nome}">${filial.nome}</option>
                                        </c:forEach>
                                    </select>
                                </div>


                                </br></br></br>

                                <!-- Text input-->

                                <div class="input-group" style="width: 200px;">
                                    <label class="input-group-addon" style="width:50px;" for="descricao">Descrição: </label>  
                                    <textarea class="form-control" rows="6" maxlength="255" style="width: 32em; margin-right:50px; resize: none;" id="txtdescricao" name="descricao"></textarea>
                                </div>


                            </div>
                        </fieldset>
                    </center>
                    </br></br>
                    <!-- Button -->
                    <div id="btns">
                        <a class="btn btn-warning" style="width: 200px; margin-left: 25px; margin-right: 50px;" onclick="limparCampos()">Limpar</a>
                        <input class="btn btn-success" type="submit" style="width: 200px;" id="btnCadastro" value="Cadastrar" onclick="return validar()"/>
                        <input type="hidden" name="funcio" value="${usuario}"/>
                    </div>

                    </br></br>
                    </br></br>
                    <p id="mensagem" class="text-center" style="background-color: hsla(120,100%,50%,0.3);"> ${produto} </p>
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

