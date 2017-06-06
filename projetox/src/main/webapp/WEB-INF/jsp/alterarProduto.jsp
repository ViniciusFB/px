<%-- 
    Document   : alterarProduto
    Created on : 04/06/2017, 20:46:42
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alterar Produto</title>
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
                <img src="_imagens/alterarProd.jpg" id="imgMenuDinamico"/>
            </header>
            <section id="corpo">
                <legend>Alterar Produto</legend>
                <form class="form-inline" action="AlterarProdutoServlet02" method="post" id="form_cadastro">
                    <div class="form-group">
                        <div class="input-group">
                            <label class="input-group-addon" for="nomeProduto">ID do Produto:</label>
                            <input style="width: 200px;" type="text" pattern="[0-9]+$" value="${id}" name="idProduto" id="produto" placeholder="ID do produto a ser alterado" class="form-control" >

                        </div>
                        <input type="submit" value='Pesquisar' name="alterarBotao" class="btn btn-info"/>

                    </div>
                </form><br>
                <form class="form-horizontal" action="AlterarProdutoServlet02" method="post" id="form_cadastro">

                    <center>
                        <div class="register-block">

                            <table>


                                <div class="form-group">
                                    <label class="col-md-4 control-label" >ID</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                                            <input name="id" class="form-control"  type="text" value="${id}" readonly="true">
                                        </div>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Nome</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                            <input  name="nome"class="form-control"  type="text" value="${nome}">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" >Código</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                                            <input name="codigo" class="form-control"  type="text" value="${codigo}" readonly="true">
                                        </div>
                                    </div>
                                </div> 

                                <!-- Text input-->

                                <div class="form-group">
                                    <label class="col-md-4 control-label" >Valor</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                                            <input name="valor" class="form-control"  type="text" value="${valor}">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group"> 
                                    <label class="col-md-4 control-label">Tipo</label>
                                    <div class="col-md-4 selectContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                            <select name="tipo" class="form-control selectpicker" readonly="true">
                                                <option value="${tipo}" selected>${tipo}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Quantidade</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-sort"></i></span>
                                            <input name="quantidade" class="form-control" type="number" value="${quantidade}">
                                        </div>
                                    </div>
                                </div>

                                <!-- Text input-->

                                <div class="form-group">
                                    <label class="col-md-4 control-label">Descrição</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <textarea rows="6" style="width: 15em; resize: none;" id="txtdescricao" name="descricao" value=${descricao}></textarea>
                                        </div>
                                    </div>
                                </div>


                            </table>
                        </div>
                        <!-- Success message -->
                        <!--<div class="alert alert-success" role="alert" id="success_message">Sucesso <i class="glyphicon glyphicon-thumbs-up"></i> Cadastro Realizado com Sucesso !!.</div>-->

                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-4 control-label"></label>
                            <div class="col-md-4">
                                <input type="submit" value='Alterar' name="alterarBotao" id="btnCadastro"/>
                                ${produto}
                            </div>
                        </div>

                    </center>
                </form>
            </section>

            <aside id="menuLateral">
                <ul>
                    <li><a href="/projetox/CadastrarProdServlet01">CADASTRAR<br>PRODUTO</a></li> <!-- // Estoque, ADM -->
                    <li><a href="/projetox/EstoqueServlet01">CONSULTAR<br>PRODUTOS</a></li> <!-- // Estoque, ADM. Sendo que o Estoque pode remover e alterar produtos. -->
                    <li><a href="/projetox/AlterarProdutoServlet01">ALTERAR<br>PRODUTO</a></li> <!-- // Mesma coisa de cima -->
                    <li><a href="/projetox/RemoveProdutoServlet01">REMOVER<br>PRODUTO</a></li><!-- // Mesma coisa de cima -->
                    <li><a href="/projetox/VendProdServlet01">VENDER<br>PRODUTOS</a></li> <!-- // Vendedor -->
                    <li><a href="/projetox/EntradaProdServlet01">ENTRADA<br>PRODUTO</a></li>
                    <!--	// Estoque. Maneira rápida de aumentar quantidade de produtos. Só apresentar informações básicas que não podem ser preenchidas e um campo de quantidade para ser ADICIONADA. (ADICIONADA NÃO É MODIFICADA, OU SEJA, SERÁ FEITA UMA SOMA)  -->
                    <li><a href="/projetox/CadastrarFuncServlet01">CADASTRAR<br>FUNCIONÁRIO</a></li> <!-- Administrador -->
                    <li><a href="/projetox/CadastrarFuncServlet01">CONSULTAR<br>FUNCIONÁRIOS</a></li> <!-- Administrador -->
                    <li><a href="/projetox/CadastrarCliServlet01">CADASTRAR<br>CLIENTE</a></li> <!-- Funcionário X ou Y. Talvez Vendedor -->
                    <li><a href="/projetox/CadastraFuncServlet01">CONSULTAR<br>CLIENTES</a></li> <!-- Adm e Vendedores -->
                    <li><a href="/projetox/GeraRelatorioServlet01">GERAR<br>RELATÓRIOS</a></li> <!-- Administrador, Estoquista. Mas o estoquista não pode gerar todos os relatórios -->
                </ul>
            </aside>
        </div>
    </body>

    <footer class="footer">
        <p class="text-center">Copyright &copy; 2017, ProjetoX</p>
    </footer>

</html>
