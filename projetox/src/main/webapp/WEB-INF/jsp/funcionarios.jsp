<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Funcionários Cadastrados</title>
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
            <form method="post" action="AlterarFuncServlet01" class="form-inline">
                <legend>Funcionários Cadastrados</legend>

                <fieldset>
                    <div id="tabela">
                        <table border="1">
                            <tr>
                                <th style="text-align: center">ID</th>
                                <th style="text-align: center">Nome</th>
                                <th style="text-align: center">E-mail</th>
                                <th style="text-align: center">Telefone</th>
                                <th style="text-align: center">Cargo</th>
                                <th style="text-align: center">Login</th>
                            </tr>
                            <c:forEach items="${listaFuncionarios}" var="funcionario">
                                <tr>
                                    <td style="text-align: center"><c:out value="${funcionario.id}" /></td>
                                    <td style="text-align: center"><c:out value="${funcionario.nome}" /></td>
                                    <td style="text-align: center"><c:out value="${funcionario.email}" /></td>
                                    <td style="text-align: center"><c:out value="${funcionario.telefone}" /></td>
                                    <td style="text-align: center"><c:out value="${funcionario.cargo}" /></td>
                                    <td style="text-align: center"><c:out value="${funcionario.login}" /></td>

                                    <td style="text-align: center" id="alterar"><a href="AlterarFuncServlet01?idFuncionario=${funcionario.id}">Alterar</a></td>
                                    <td style="text-align: center" id="excluir"><a href="ExcluirFuncServlet?idFuncionario=${funcionario.id}">Excluir</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </fieldset>
                ${funcionario}
            </form>
        </section>
        <aside id="menuLateral">
            <ul>
                <li><a href="/projetox/CadastrarProdutoServlet01">CADASTRAR<br>PRODUTO</a></li>
                <li><a href="/projetox/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li> 
                <li><a href="/projetox/VendProdServlet01">VENDER<br>PRODUTOS</a></li> 
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
