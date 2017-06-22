
<%@page import="br.senac.tads.pi3.models.ItemDeCompra"%>
<%@page import="br.senac.tads.pi3.models.CarrinhoDeCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Carrinho de Compras</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/vendas.css?1"/>
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
                <legend class="text-center">Carrinho de Compras</legend>
                <form method="post" action="FinalizarVendaServlet01" class="form-inline">
                    <div id="carrinho">
                        <table border="1" cellpadding="2" >
                            <tr>
                                <td bgcolor="#000088" class="text-center"><font color="white">Excluir</font></td>
                                <td bgcolor="#000088" class="text-center"><font color="white">Item</font></td>
                                <td bgcolor="#000088" class="text-center"><font color="white">QTD</font></td>
                                <td bgcolor="#000088" class="text-center"><font color="white">Preço Unitário</font></td>
                                <td bgcolor="#000088" class="text-center"><font color="white">Total Item</font></td>
                                <td bgcolor="#000088" class="text-center"><font color="white">+1</font></td>
                            </tr>
                            <%
                                //recupera os produtos do carrinho da sessao
                                CarrinhoDeCompra carrinho = (CarrinhoDeCompra) session.getAttribute("carrinho");
                                for (ItemDeCompra item : carrinho.getItens()) {
                            %>
                            <tr class="text-center">
                                <td class="text-center"><a
                                        href="ControleCarrinho?acao=removeProduto&idProduto=<%=item.getProduto().getId()%>&idCliente=${idCliente}">
                                        X</td>
                                <td class="text-center"><%=item.getProduto().getNome()%></td>
                                <td class="text-center"><%=item.getQuantidade()%></td>
                                <td class="text-center"><%=item.getProduto().getValor()%></td>
                                <td class="text-center"><%=item.getTotal()%></td>
                                <td class="text-center"><a
                                        href="ControleCarrinho?acao=addProduto&idProduto=<%=item.getProduto().getId()%>&idCliente=${idCliente}">+</a
                                    ></td>
                            </tr>

                            <%
                                }
                            %>

                        </table>

                        <strong>Valor Total: <%=carrinho.calculaTotal()%></strong><br/>

                        <a href="VendaServlet03?idCliente=${idCliente}"> Continue comprando</a><br/>

                        <a href="ControleCarrinho?acao=cancelaCompra&idCliente=${idCliente}">Cancelar comprar</a>
                        <input type="hidden" name="idCliente" value="${idCliente}" id="idCliente" placeholder="ID do Cliente" class="form-control" style="width: 150px;"/>

                        <input type="submit" style="float: right; margin-right: 40px" value="Finalizar Venda" class="btn btn-success" />
                    </div>
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
