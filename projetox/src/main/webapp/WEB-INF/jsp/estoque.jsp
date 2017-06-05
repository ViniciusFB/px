<%-- 
    Document   : estoque
    Created on : 03/06/2017, 21:25:08
    Author     : Vinicius Ferreira Batista
--%>

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
                <p>Seja bem-vindo, ${sessionScope.usuario.nomeCompleto}!</p>
            </header>
            <header id="cabecalho">
                <a href="/px/home"><img id="imgLogo" src="imagens/px-logo.png" onclick="" title="Home"/></a>
            </header>
            <header id="logout">
                <a href="/px/logout"><p>SAIR</p></a>
            </header>
            <header id="menuDinamico" align="center">
                <img src="_imagens/pesquisarProd.jpg" id="imgMenuDinamico"/>
            </header>

            <section id="corpo">
                <form method="post" action="EstoqueServlet02" class="form-inline">
                    <legend>Pesquisar Produto</legend>
                    <fieldset>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon" for="nomeProduto">Nome do Produto:</label>
                                <input type="text" name="nomeProduto" id="nomeProduto" placeholder="Produto a ser Pesquisado" class="form-control"/>
                            </div>
                            <button name="validar" id="validar" class="btn btn-info">Pesquisar</button></p>
                        </div>
                        </br>
                        <hr style="height:1px; background-color:#E8E8E8;">
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


                                            <td style="text-align: center" id="alterar"><a href="AlterarProdutoServlet01?idProduto=${produto.id}" >Alterar</a></td>
                                            <td style="text-align: center" id="excluir"><a href="ExcluirProdutoServlet?idProduto=${produto.id}">Excluir</a></td>



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
                    <li><a href="/px/CadastrarProdServlet01">CADASTRAR<br>PRODUTO</a></li> <!-- // Estoque, ADM -->
                    <li><a href="/px/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li> <!-- // Estoque, ADM. Sendo que o Estoque pode remover e alterar produtos. -->
                    <li><a href="/px/AlteraProdutoServlet01">ALTERAR<br>PRODUTO</a></li> <!-- // Mesma coisa de cima -->
                    <li><a href="/px/RemoveProdutoServlet01">REMOVER<br>PRODUTO</a></li><!-- // Mesma coisa de cima -->
                    <li><a href="/px/VendProdServlet01">VENDER<br>PRODUTOS</a></li> <!-- // Vendedor -->
                    <li><a href="/px/EntradaProdServlet01">ENTRADA<br>PRODUTO</a></li>
                    <!--	// Estoque. Maneira rápida de aumentar quantidade de produtos. Só apresentar informações básicas que não podem ser preenchidas e um campo de quantidade para ser ADICIONADA. (ADICIONADA NÃO É MODIFICADA, OU SEJA, SERÁ FEITA UMA SOMA)  -->
                    <li><a href="/px/CadastrarFuncServlet01">CADASTRAR<br>FUNCIONÁRIO</a></li> <!-- Administrador -->
                    <li><a href="/px/CadastrarFuncServlet01">CONSULTAR<br>FUNCIONÁRIOS</a></li> <!-- Administrador -->
                    <li><a href="/px/CadastrarCliServlet01">CADASTRAR<br>CLIENTE</a></li> <!-- Funcionário X ou Y. Talvez Vendedor -->
                    <li><a href="/px/CadastraFuncServlet01">CONSULTAR<br>CLIENTES</a></li> <!-- Adm e Vendedores -->
                    <li><a href="/px/GeraRelatorioServlet01">GERAR<br>RELATÓRIOS</a></li> <!-- Administrador, Estoquista. Mas o estoquista não pode gerar todos os relatórios -->
                </ul>
            </aside>

        </div>
    </body>

    <footer class="footer">
        <p class="text-center">Copyright &copy; 2017, ProjetoX</p>
    </footer>

</html>
