<%-- 
    Document   : cadastrarCliente
    Created on : 03/06/2017, 20:02:07
    Author     : Vinicius Ferreira Batista
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js" lang="">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastrar Cliente</title>
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
                 <form class="form-horizontal" action="CadastrarCliServlet02" method="post"  id="form_cadastro">

                    <center>
                        <div class="register-block">
                            <legend> Cadastro de Cliente </legend>

                            <!-- Form Name -->

                            <table>

                                <!-- Text input-->

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
                                                <option value="AC">Acre</option>
                                                <option value="AL">Alagoas</option>
                                                <option value="AP">Amapá</option>
                                                <option value="AM">Amazonas</option>
                                                <option value="BA">Bahia</option>
                                                <option value="CE">Ceará</option>
                                                <option value="DF">Distrito Federal</option>
                                                <option value="ES">Espírito Santo</option>
                                                <option value="GO">Goiás</option>
                                                <option value="MA">Maranhão</option>
                                                <option value="MT">Mato Grosso</option>
                                                <option value="MS">Mato Grosso do Sul</option>
                                                <option value="MG">Minas Gerais</option>
                                                <option value="PA">Pará</option>
                                                <option value="PB">Paraíba</option>
                                                <option value="PR">Paraná</option>
                                                <option value="PE">Pernambuco</option>
                                                <option value="PI">Piauí</option>
                                                <option value="RJ">Rio de Janeiro</option>
                                                <option value="RN">Rio Grande do Norte</option>
                                                <option value="RS">Rio Grande do Sul</option>
                                                <option value="RO">Rondônia</option>
                                                <option value="RR">Roraima</option>
                                                <option value="SC">Santa Catarina</option>
                                                <option value="SP">São Paulo</option>
                                                <option value="SE">Sergipe</option>
                                                <option value="TO">Tocantins</option>


                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label">Cidade</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                            <input name="cidade" placeholder="Cidade" class="form-control"  type="text">
                                        </div>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-4 control-label">Endereço</label>  
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                            <input name="endereco" placeholder="Endereço" class="form-control" type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Gênero</label>
                                    <div class="col-md-4">
                                        <div class="radio">
                                            <label style="padding-left: 25px">
                                                <input type="radio" name="genero" value="masculino" /> Masculino 
                                            </label><label style="padding-left: 25px">
                                                <input type="radio" name="genero" value="feminino" /> Feminino
                                            </label>
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
                                <input type="submit" id="btnCadastro" value="Cadastrar" />
                            </div>
                        </div>

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
