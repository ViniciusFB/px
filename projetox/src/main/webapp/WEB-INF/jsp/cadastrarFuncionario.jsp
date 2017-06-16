<%-- 
    Document   : cadastrarFuncionario
    Created on : 03/06/2017, 19:46:13
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js" lang="">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastrar Funcionário</title>
        <link rel="stylesheet" type="text/css" href="css/Funcionario.css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link href="css/cadastros.css" rel="stylesheet">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script language="javascript" src="js/cpf.js"></script>
        <script language="javascript" src="js/telefone.js"></script>
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
                <img id="imgMenuDinamico" src="_imagens/cadastraFunc.jpg"/>
            </header>

            <section id="corpo">
                <form class="form-horizontal" action="CadastrarFuncServlet02" method="post"  id="form_cadastro">

                    <center>
                        <div class="register-block">
                            <legend> Cadastro de Funcionário </legend>

                            <!-- Form Name -->

                            <table>


                                <div class="form-group">
                                    <label class="col-md-4 control-label">Primeiro Nome</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input  name="nome" required placeholder="Primeiro Nome" class="form-control"  type="text">
                                        </div>
                                    </div>
                                </div>

                                <!-- Text input-->

                                <div class="form-group">
                                    <label class="col-md-4 control-label" >Sobrenome</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input name="sobrenome" required placeholder="Sobrenome" class="form-control"  type="text">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" >Data de Nascimento</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            <input name="dataNasc" required placeholder="Data de nascimento" class="form-control" min="1900-01-01" max="2017-12-31" type="Date">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" >CPF</label> 
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input name="cpf" required placeholder="000.000.000-00" class="form-control" maxlength="14" type="text" onkeypress="javascript: mascara(this, cpf_mask)">
                                        </div>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label">E-Mail</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                            <input id="email" name="email" required placeholder="E-mail" class="form-control"  type="email">
                                        </div>
                                    </div>
                                </div>


                                <!-- Text input-->

                                <div class="form-group">
                                    <label class="col-md-4 control-label">Telefone</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                            <input id="telefone" name="telefone" maxlength="14" required placeholder="(xx)xxxxx-xxxx" class="form-control" type="text">
                                        </div>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group"> 
                                    <label class="col-md-4 control-label">Estado</label>
                                    <div class="col-md-4 selectContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                            <select required name="estado" class="form-control selectpicker">
                                                <option value="" disabled selected>Selecione um Estado...</option>
                                                <option value="Acre">Acre</option>
                                                <option value="Alagoas">Alagoas</option>
                                                <option value="Amapá">Amapá</option>
                                                <option value="Amazonas">Amazonas</option>
                                                <option value="Bahia">Bahia</option>
                                                <option value="Ceará">Ceará</option>
                                                <option value="Distrito Federal">Distrito Federal</option>
                                                <option value="Espirito Santo">Espírito Santo</option>
                                                <option value="Goiás">Goiás</option>
                                                <option value="Maranhão">Maranhão</option>
                                                <option value="Mato Grosso">Mato Grosso</option>
                                                <option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
                                                <option value="Minas Gerais">Minas Gerais</option>
                                                <option value="Pará">Pará</option>
                                                <option value="Paraíba">Paraíba</option>
                                                <option value="Paraná">Paraná</option>
                                                <option value="Pernambuco">Pernambuco</option>
                                                <option value="Piauí">Piauí</option>
                                                <option value="Rio de Janeiro">Rio de Janeiro</option>
                                                <option value="Rio Grande do Norte">Rio Grande do Norte</option>
                                                <option value="Rio Grande do Sul">Rio Grande do Sul</option>
                                                <option value="Rondônia">Rondônia</option>
                                                <option value="Roraima">Roraima</option>
                                                <option value="Santa Catarina">Santa Catarina</option>
                                                <option value="São Paulo">São Paulo</option>
                                                <option value="Sergipe">Sergipe</option>
                                                <option value="Tocantins">Tocantins</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label"> Cargo do Funcionário</label>
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                            <select required name="cargo" class="form-control selectpicker">
                                                <option value="" disabled selected>Selecione um cargo...</option>
                                                <option>Admin</option>
                                                <option>Vendedor</option>
                                                <option >Estoquista</option>
                                                <option >Gerente</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Login</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input name="login" required placeholder="Login" class="form-control"  type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Senha</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input  name="senha" required placeholder="Digite sua senha" class="form-control"  type="password">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Confirmar Senha</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input  name="confirmaSenha" required placeholder="Confirme a senha" class="form-control"  type="password">
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
                                <input type="submit" id="btnCadastro" value="Cadastrar" onclick="return validar()"/>
                            </div>
                        </div>
                        ${funcionario}

                    </center>
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
