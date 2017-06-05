<%-- 
    Document   : cadastrarProduto
    Created on : 03/06/2017, 19:29:14
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js" lang="">
    <head>
        <title>Cadastrar Produto</title>
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
                <img src="_imagens/cadastraProd.jpg" id="imgMenuDinamico"/>
            </header>

            <section id="corpo">
                <form class="form-horizontal" action="CadastrarProdutoServlet02" method="post"  id="form_cadastro">

                    <center>
                        <div class="register-block">
                            <legend>Cadastro de Produto</legend>

                            <!-- Form Name -->

                            <table>

                                <!-- Text input-->

                                <div class="form-group">
                                    <label class="col-md-4 control-label">Nome</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
                                            <input id="nomeProduto" name="nome" required placeholder="Nome" class="form-control" maxlength="50" type="text">
                                        </div>
                                    </div>
                                </div>

                                <!-- Text input-->

                                <div class="form-group">
                                    <label class="col-md-4 control-label" >Código</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                                            <input name="codigo" required placeholder="Codigo" class="form-control"  type="text">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" >Valor</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                                            <input class="form-control" placeholder="Digite o Preço"  type="text" name="valor" required/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group"> 
                                    <label class="col-md-4 control-label">Tipo</label>
                                    <div class="col-md-4 selectContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                            <select required name="tipo" class="form-control selectpicker">
                                                <option value="" disabled selected>Selecione o tipo..</option>
                                                <option value="Bolsa">Bolsa</option>
                                                <option value="Relogio">Relógio</option>
                                                <option value="Oculos">Óculos</option>
                                                <option value="Bone">Boné</option>
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
                                            <input name="quantidade" required placeholder="Quantidade" class="form-control"  type="number">
                                        </div>
                                    </div>
                                </div>


                                <!-- Text input-->

                                <div class="form-group">
                                    <label class="col-md-4 control-label">Descrição</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-edit"></i></span>
                                            <textarea rows="6" maxlength="255" style="width: 15em; resize: none;" id="txtdescricao" name="descricao"></textarea>
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
                                <input type="submit" id="btnCadastro" value="Cadastrar" onclick="return validar()" />
                                <input type="hidden" name="funcio" value="${sessionScope.usuario.nomeCompleto}"/>
                                ${produto}
                            </div>
                        </div>

                    </center>
                </form>
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
