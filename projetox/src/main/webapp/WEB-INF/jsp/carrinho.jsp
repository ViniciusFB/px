
<%@page import="br.senac.tads.pi3.models.ItemDeCompra"%>
<%@page import="br.senac.tads.pi3.models.CarrinhoDeCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho de Compras</title>
    </head>
    <body>
        <h1>Carrinho de Compras!</h1>
        <table border="1" cellpadding="2" >
            <tr>
                <td bgcolor="#000088"><font color="white">Excluir</font></td>
                <td bgcolor="#000088"><font color="white">Item</font></td>
                <td bgcolor="#000088"><font color="white">QTD</font></td>
                <td bgcolor="#000088"><font color="white">Preço Unitário</font></td>
                <td bgcolor="#000088"><font color="white">Total Item</font></td>
                <td bgcolor="#000088"><font color="white">+1</font></td>
            </tr>
            <%
                //recupera os produtos do carrinho da sessao
                CarrinhoDeCompra carrinho = (CarrinhoDeCompra) session.getAttribute("carrinho");
                for (ItemDeCompra item : carrinho.getItens()) {
            %>
            <tr>
                <td><a
                        href="ControleCarrinho?acao=removeProduto&idProduto=<%=item.getProduto().getId()%>&idCliente=${idCliente}">
                        X</td>
                <td><%=item.getProduto().getNome()%></td>
                <td><%=item.getQuantidade()%></td>
                <td><%=item.getProduto().getValor()%></td>
                <td><%=item.getTotal()%></td>
                <td><a
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
    </body>
</html>