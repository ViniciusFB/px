<%-- 
    Document   : estoque
    Created on : 03/06/2017, 21:25:08
    Author     : Vinicius Ferreira Batista
--%>

<%@page import="br.senac.tads.pi3.models.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Realizar Venda</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/vendas.css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link href="css/cadastros.css" rel="stylesheet">
        <script src="js/Funcionario.js" type="text/javascript"></script>
        <link rel="shortcut icon" type="image/png" href="imagens/favicon.png"/>

    </head>
    <body>
        <div id="interface">
            <header id="logado">
                <p>Usuário logado: ${sessionScope.usuario.nomeCompleto}!</p>
            </header>
            <header id="cabecalho">
                <a href="/projetox/home">
                    <img  id="imgLogo" src="imagens/px-logo.png" onclick="" title="Home"/></a>
            </header>
            <header id="logout">
                <a href="/projetox/logout"><p>SAIR</p></a>
            </header>
            <header id="menuDinamico" align="center">
                <img src="_imagens/pesquisarProd.jpg" id="imgMenuDinamico"/>
            </header>

            <section id="corpo">
                <form method="post" action="VendaServlet02" class="form-inline">
                    <legend>Realizar Venda</legend>
                    <fieldset>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon" for="idCliente">ID do Cliente: </label>
                                <input type="text" name="idCliente" value="${idCliente}" id="idCliente" placeholder="ID do Cliente" class="form-control" style="width: 150px;"/>
                            </div>
                            <button name="validar" id="validar" class="btn btn-info">Pesquisar</button></p>

                            </br>

                            <div class="input-group">
                                <label class="input-group-addon" for="nomeCliente">Nome do Cliente: </label>
                                <input type="text" name="nomeCliente" value="${nomeCliente}" id="nomeCliente" disabled class="form-control" style="width: 200px;"/>
                            </div>

                            <div class="input-group">
                                <label class="input-group-addon" for="cpfCliente">CPF do Cliente: </label>
                                <input type="text" name="cpfCliente" value="${cpfCliente}" id="cpfCliente" disabled class="form-control" style="width: 200px;"/>
                            </div>


                        </div>
                        </br>
                        <hr style="height:1px; background-color:#E8E8E8;">

                        <div id="tabela" >
                            </br>
                            <table border="1">

                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">NOME</th>
                                    <th class="text-center">TIPO</th>
                                    <th class="text-center">QTDE</th>
                                    <th class="text-center">VALOR</th>
                                    <th class="text-center"></th>

                                </tr>

                                <c:forEach items="${listaProdutos}" var="produto">
                                    <tr>

                                        <td class="text-center"><c:out value="${produto.id}" /></td>
                                        <td class="text-center"><c:out value="${produto.nome}" /></td>
                                        <td class="text-center"><c:out value="${produto.tipo}" /></td>
                                        <td class="text-center"><c:out value="${produto.quantidade}" /></td>
                                        <td class="text-center"><c:out value="${produto.valor}" /></td>

                                        <td style="text-align: center" id="adicionar"><a href="VendaServlet02?idProduto=${produto.id}">Adicionar</a></td>


                                    </tr>
                                </c:forEach>                                                  
                            </table>

                        </div>
                        </br></br></br></br></br></br></br></br>
                        <div id="dadosProd">
                            <div class="input-group">
                                <label class="input-group-addon" for="nomeProduto">Produto: </label>
                                <input type="text" name="nomeProduto" value="${nomeProduto}" id="nomeProduto" disabled class="form-control" style="width: 200px;"/>
                            </div>

                            <div class="input-group">
                                <label class="input-group-addon" for="codigo">Cod do Produto: </label>
                                <input type="text" name="codigo" value="${codigo}" id="codigo" disabled class="form-control" style="width: 200px;"/>
                            </div>
                            </br>
                            </br>
                            <div class="input-group">
                                <label class="input-group-addon" for="valorProduto">Valor: </label>
                                <input type="text" name="valorProduto" value="${valorProduto}" id="valorProduto" disabled class="form-control" style="width: 200px;"/>
                            </div>
                            <label for="quantidade">Qtde: </label>
                            <input type="text" name="quantidade" value="${quantidade}" id="quantidade" maxlength="4" class="form-control" style="width: 140px;"/>

                            <button name="adicionar" id="adicionar" class="btn btn-success">Adicionar ao Carrinho</button></p>
                        </div>
                        <div id="carrinho" >
                            </br>
                            <table border="1">

                                <tr>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">NOME</th>
                                    <th class="text-center">TIPO</th>
                                    <th class="text-center">QTDE</th>
                                    <th class="text-center">VALOR UNI.</th>
                                    <th class="text-center">TOTAL</th>
                                    <th class="text-center"></th>
                                </tr>

                                <c:forEach items="${listaProdutos}" var="produto">
                                    <tr> 

                                        <td class="text-center"><c:out value="${produto.id}" /></td>
                                        <td class="text-center"><c:out value="${produto.nome}" /></td>
                                        <td class="text-center"><c:out value="${produto.tipo}" /></td>
                                        <td class="text-center"><c:out value="${produto.quantidade}" /></td>
                                        <td class="text-center"><c:out value="${produto.valor}" /></td>
                                        <td class="text-center"><c:out value="${produto.valor}" /></td>

                                        <td style="text-align: center" id="adicionar"><a id="add" href="VendaServlet02?idProduto=${produto.id}">REMOVER</a></td>


                                    </tr>
                                </c:forEach>                                                  
                            </table>

                        </div>
                        <div id="dadosVenda">
                            <div class="input-group">
                                <label class="input-group-addon" for="valorTotal">Valor Total: </label>
                                <input type="text" name="valorTotal" value="${valorTotal}" id="valorTotal" disabled class="form-control" style="width: 200px;"/>
                            </div>
                            <div class="input-group">
                                <label class="input-group-addon" for="data">Data: </label>
                                <input type="text" name="data" value="${data}" id="data" disabled class="form-control" style="width: 200px;"/>
                            </div>
                            <button name="finalizarVenda" id="finalizarVenda" class="btn btn-success">Finalizar Venda</button></p>
                        </div>
                    </fieldset>
                </form>
            </section>
            <aside id="menuLateral">
                <ul>
                    <li><a href="/projetox/CadastrarProdutoServlet01">CADASTRAR<br>PRODUTO</a></li>
                    <li><a href="/projetox/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li> 
                    <li><a href="/projetox/VendaServlet01">VENDER<br>PRODUTOS</a></li> 
                    <li><a href="/projetox/EntradaProdServlet01">ENTRADA<br>PRODUTO</a></li>
                    <li><a href="/projetox/CadastrarFuncServlet01">CADASTRAR<br>FUNCIONÁRIO</a></li> 
                    <li><a href="/projetox/FuncionarioServlet01">CONSULTAR<br>FUNCIONÁRIOS</a></li> 
                    <li><a href="/projetox/CadastrarCliServlet01">CADASTRAR<br>CLIENTE</a></li> 
                    <li><a href="/projetox/ClienteServlet01">CONSULTAR<br>CLIENTES</a></li> 
                    <li><a href="/projetox/RelatorioServlet01">GERAR<br>RELATÓRIOS</a></li> 
                </ul>
            </aside>



        </div>
    </body>

    <footer class="footer">
        <p class="text-center">Copyright &copy; 2017, ProjetoX</p>
    </footer>

</html>
