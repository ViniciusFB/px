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
        <title>Estoque de Produtos</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/Funcionario.css"/>
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
                <form method="post" action="EstoqueServlet02" class="form-inline">
                    <legend>Estoque</legend>
                    <fieldset>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon" for="filial">Filial: </label>
                                <select name="filial" class="form-control selectpicker">
                                    <option value="" disabled selected>Selecione uma filial...</option>
                                    <option>OPÇÃO1</option>
                                    <option>OPÇÃO2</option>
                                    <option >OPÇÃO3</option>
                                    <option >OPÇÃO4</option>

                                </select>
                            </div>
                            <div class="input-group">
                                <label class="input-group-addon" for="nomeProduto">Nome do Produto:</label>
                                <input type="text" name="nomeProduto" id="nomeProduto" placeholder="Produto a ser Pesquisado" class="form-control" style="width: 200px;"/>
                            </div>

                            <button name="validar" id="validar" class="btn btn-info">Pesquisar</button></p>

                        </div>
                        </br>
                        <hr style="height:1px; background-color:#E8E8E8;">
                        ${produto}
                        <c:if test = "${pesquisa != null}">
                            <div id="tabela" >
                                <table border="1">
                                    <tr>
                                        <th style="text-align: center">ID</th>
                                        <th style="text-align: center">NOME</th>
                                        <th style="text-align: center">TIPO</th>
                                        <th style="text-align: center;">QTDE</th>
                                        <th style="text-align: center">VALOR</th>
                                        <th style="text-align: center">OP</th>
                                        <th style="text-align: center">OP</th>
                                    </tr>

                                    <c:forEach items="${pesquisa}" var="produto">
                                        <tr>

                                            <td style="text-align: center"><c:out value="${produto.id}" /></td>
                                            <td style="text-align: center"><c:out value="${produto.nome}" /></td>
                                            <td style="text-align: center"><c:out value="${produto.tipo}" /></td>
                                            <td style="text-align: center"><c:out value="${produto.quantidade}" /></td>
                                            <td style="text-align: center"><c:out value="${produto.valor}" /></td>


                                            <td style="text-align: center" id="alterar"><a href="AlterarProdutoServlet01?idProduto=${produto.id}">Alterar</a></td>
                                            <td style="text-align: center" id="excluir"><a href="ExcluirProdutoServlet?idProduto=${produto.id}&funcio=${sessionScope.usuario.nomeCompleto}">Excluir</a></td>
                                            <!--<td style="text-align: center" id="excluir"><a href="ExcluirProdutoServlet?idProduto=${produto.id}">Excluir</a></td>--> 
                                        </tr>
                                    </c:forEach>                                                  
                                </table>
                            </div>
                        </c:if>
                    </fieldset>
                </form>
            </section>
            <aside id="menuLateral">
                <ul>
                    <li><a href="/projetox/CadastrarProdutoServlet01">CADASTRAR<br>PRODUTO</a></li>
                    <li><a href="/projetox/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li> 
                    <li><a href="/projetox/VendProdServlet01">VENDER<br>PRODUTOS</a></li> 
                    <li><a href="/projetox/EntradaProdServlet01">ENTRADA<br>PRODUTO</a></li>
                    <li><a href="/projetox/CadastrarFuncServlet01">CADASTRAR<br>FUNCIONÁRIO</a></li> 
                    <li><a href="/projetox/CadastrarFuncServlet01">CONSULTAR<br>FUNCIONÁRIOS</a></li> 
                    <li><a href="/projetox/CadastrarCliServlet01">CADASTRAR<br>CLIENTE</a></li> 
                    <li><a href="/projetox/CadastraFuncServlet01">CONSULTAR<br>CLIENTES</a></li> 
                    <li><a href="/projetox/RelatorioServlet01">GERAR<br>RELATÓRIOS</a></li> 
                </ul>
            </aside>


        </div>
    </body>

    <footer class="footer">
        <p class="text-center">Copyright &copy; 2017, ProjetoX</p>
    </footer>

</html>
