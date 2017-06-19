<%-- 
    Document   : EntradaProd
    Created on : 03/06/2016, 10:58:03
    Author     : AX4B
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="ErroGenerico.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> 
    <head>
        <title>Entrada de Produto</title>
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
                <form method="post" action="EntradaProdServlet02" class="form-inline">
                    <legend>Entrada de Produto</legend>
                    <fieldset>

                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon" for="idProduto">ID do Produto: </label>
                                <input type="text" name="idProduto" value="${idProduto}" id="idProduto" maxlength="10" placeholder="ID do Produto" class="form-control" required style="width: 150px;"/>
                            </div>
                            <button name="pesquisar" id="pesquisar" class="btn btn-info">Pesquisar</button></p>

                            </br>

                            <div class="input-group">
                                <label class="input-group-addon" for="nomeProduto">Nome do Produto: </label>
                                <input type="text" name="nomeProduto" value="${nomeProduto}" id="nomeProduto" disabled class="form-control" style="width: 200px;"/>
                            </div>

                            </br></br>
                            <div class="input-group">
                                <label class="input-group-addon" for="qtdeEstoque">Qtd no Estoque: </label>
                                <input type="number" name="qtdeEstoque" value="${qtdeEstoque}" id="qtdeEstoque" readonly class="form-control" style="width: 215px;"/>
                            </div>
                        </div>
                        </br>
                        </br>
                    </fieldset>
                </form>
                <div class="input-group">
                    <label class="input-group-addon" for="qtde">Adicionar Qtde:</label>
                    <input type="number" name="qtde" style="width: 220px;" min="0" max="1000" id="qtde" placeholder="Quantidade para ser adicionada" class="form-control"/>
                </div>
                </br>

                <!--<a class="btn btn-success" href="EntradaProdServlet03?idProduto=${idProduto}&qtde=${qtde}">Adicionar</a>-->
                <a class="btn btn-success" href='' onclick="this.href = 'EntradaProdServlet03?idProduto=${idProduto}&qtde=' + document.getElementById('qtde').value">Adicionar</a>

                </br></br>
                <p>${entradamsg}</p>

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
                            <li><a href="/projetox/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li>
                            <li><a href="/projetox/EntradaProdServlet01">ENTRADA<br>PRODUTOS</a></li>

                        </c:when>

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

