<%-- 
    Document   : relatorio
    Created on : 06/06/2017, 03:35:25
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <title>Relatórios</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/relatorio.css"/>
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
            <legend>Gerar relatório</legend>
            <form method="post" action="RelatorioServlet02" class="form-inline">
                <div class="form-group">
                    <div class="input-group" style="width:350px;">
                        <label class="input-group-addon" style="width:110px;"for="tipoRelatorio">Tipo:</label>
                        <select name="tipoRelatorio" class="form-control">
                            <option value="listarProdutos" selected="selected">Listar Produtos</option>
                            <option value="listarProdutosExcluidos">Listar Produtos Excluídos</option>
                            <option value="listarFuncionarios">Listar Funcionários</option>
                            <option value="listarClientes">Listar Clientes</option>
                            <option value="listarVendas">Listar Vendas</option>  
                        </select>
                    </div>
                    <input type="submit" value='Pesquisar'class="btn btn-info"/></br>
                </div>
                <hr style="height:1px; background-color:#E8E8E8;">
                <p>${relatorio}</p>
                <c:if test = "${relatorio == 'Relatorio de produtos cadastrados!!'}">
                    <div id="tabela" >

                        <table class="table" border="3">
                            <tr>
                                <th>ID</th>
                                <th>NOME</th>
                                <th>QUANTIDADE</th>
                                <th>Valor</th>
                                <th>Cadastrado Por</th>
                                <th>Data</th>
                            </tr>

                            <c:forEach items="${relatorioprodutos}" var="rel">
                                <tr>
                                    <td>${rel.id}</td>
                                    <td>${rel.nome}</td>
                                    <td>${rel.quantidade}</td>
                                    <td>${rel.valor}</td>
                                    <td>${rel.funcio}</td>
                                    <td>${rel.dataCadastro}</td>
                                </tr>
                            </c:forEach>                                                           
                        </table>                
                    </div>
                </c:if>

                <c:if test = "${relatorio == 'Relatorio de produtos excluidos!!'}">
                    <div id="tabela" >

                        <table class="table" border="3">
                            <tr>
                                <th>ID</th>
                                <th>NOME</th>
                                <th>QUANTIDADE</th>
                                <th>Valor</th>
                                <th>Excluido Por</th>
                                <th>Data</th>
                            </tr>

                            <c:forEach items="${relatorioprodutos}" var="rel">
                                <tr>
                                    <td>${rel.id}</td>
                                    <td>${rel.nome}</td>
                                    <td>${rel.quantidade}</td>
                                    <td>${rel.valor}</td>
                                    <td>${rel.funcio}</td>
                                    <td>${rel.dataExclusao}</td>
                                </tr>
                            </c:forEach>                                                           
                        </table>          
                    </div>
                </c:if>

                <c:if test = "${relatorio == 'Relatorio de funcionarios cadastrados!!'}">
                    <div id="tabela" >

                        <table class="table" border="3">
                            <tr>
                                <th>ID</th>
                                <th>NOME</th>
                                <th>E-MAIL</th>
                                <th>TELEFONE</th>
                                <th>CARGO</th>
                            </tr>

                            <c:forEach items="${relatoriofuncionarios}" var="rel">
                                <tr>
                                    <td>${rel.id}</td>
                                    <td>${rel.nome}</td>
                                    <td>${rel.email}</td>
                                    <td>${rel.telefone}</td>
                                    <td>${rel.cargo}</td>
                                </tr>
                            </c:forEach>                                                           
                        </table>    
                    </div>
                </c:if>

                <c:if test = "${relatorio == 'Relatorio de clientes cadastrados!!'}">
                    <div id="tabela" >

                        <table class="table" border="3">
                            <tr>
                                <th>ID</th>
                                <th>NOME</th>
                                <th>SOBRENOME</th>
                                <th>NASCIMENTO</th>
                                <th>CPF</th>
                                <th>E-MAIL</th>
                            </tr>

                            <c:forEach items="${relatorioclientes}" var="rel">
                                <tr>
                                    <td>${rel.id}</td>
                                    <td>${rel.nome}</td>
                                    <td>${rel.sobrenome}</td>
                                    <td>${rel.dataNasc}</td>
                                    <td>${rel.cpf}</td>
                                    <td>${rel.email}</td>
                                </tr>
                            </c:forEach>                                                           
                        </table>            
                    </div>
                </c:if>

                <c:if test = "${relatorio == 'Relatorio de vendas cadastrados!!'}">
                    <div id="tabela" >

                        <table class="table" border="3">
                            <tr>
                                <th>ID</th>
                                <th>NOME</th>
                                <th>PRODUTO</th>
                                <th>DATA</th>
                                <th>QUANTIDADE</th>
                                <th>VALOR</th>
                            </tr>

                            <c:forEach items="${relatoriovendas}" var="rel">
                                <tr>
                                    <td>${rel.id}</td>
                                    <td>${rel.nome}</td>
                                    <td>${rel.produto}</td>
                                    <td>${rel.venda}</td>
                                    <td>${rel.quantidade}</td>
                                    <td>${rel.valorFinal}</td>
                                </tr>
                            </c:forEach>                                                           
                        </table>                     
                    </div>
                </c:if>
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
