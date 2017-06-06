/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox;

import br.senac.tads.pi3.dao.ClienteDAO;
import br.senac.tads.pi3.dao.FuncionarioDAO;
import br.senac.tads.pi3.dao.ProdutoDAO;
//import br.senac.tads.pi3.dao.VendasDAO;
import br.senac.tads.pi3.relatorios.RelatorioCliente;
import br.senac.tads.pi3.relatorios.RelatorioFuncionario;
import br.senac.tads.pi3.relatorios.RelatorioProduto;
import br.senac.tads.pi3.relatorios.RelatorioVenda;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ProjetoX
 */
@WebServlet(name = "RelatorioServlet02", urlPatterns = {"/RelatorioServlet02"})
public class RelatorioServlet02 extends HttpServlet {

    /**
    *
    * @param request
    * @param response
    * @throws javax.servlet.ServletException
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
    }

    /**
    *
    * @param request
    * @param response
    * @throws javax.servlet.ServletException
    */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RelatorioServlet02.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
    *
    * @param request
    * @param response
    * @throws javax.servlet.ServletException
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession(); 
        request.setAttribute("usuario", sessao.getAttribute("usuario"));
        try {
            
            //Pegando o valor do name e atribuindo a variavel
            String tipoRelatorio = request.getParameter("tipoRelatorio");
            
            //O valor da variável decidirá em qual caso irá cair
            switch (tipoRelatorio) {
                case "listarProdutos": {
                    ProdutoDAO produto = new ProdutoDAO();
                    
                    //A lista que ira retornar do metodo sera usado na criacao de uma nova classe
                    RelatorioProduto relatorioProduto = new RelatorioProduto(produto.listar());
                    
                    //Setando os valores que serao resgatados pela JSP
                    request.setAttribute("relatorio", "Relatorio de produtos cadastrados!!");
                    request.setAttribute("relatorioprodutos", relatorioProduto.getRelatorioProdutos());                    
                    
                    //Enviando os valores para a JSP
                    this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/relatorio.jsp").forward(request, response);
                    break;
                }
                case "listarProdutosExcluidos": {
                    ProdutoDAO produto = new ProdutoDAO();
                    
                    //A lista que ira retornar do metodo sera usado na criacao de uma nova classe
                    RelatorioProduto relatorioProduto = new RelatorioProduto(produto.listarExclusoes());
                    
                    //Setando os valores que serao resgatados pela JSP
                    request.setAttribute("relatorio", "Relatorio de produtos excluidos!!");
                    request.setAttribute("relatorioprodutos", relatorioProduto.getRelatorioProdutos());                    
                    
                    //Enviando os valores para a JSP
                    this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/relatorio.jsp").forward(request, response);
                    break;
                }
                case "listarFuncionarios": {
                    FuncionarioDAO funcionario = new FuncionarioDAO();
                    
                    //A lista que ira retornar do metodo sera usado na criacao de uma nova classe
                    RelatorioFuncionario relatorioFuncionario = new RelatorioFuncionario(funcionario.listar());
                    
                    //Setando os valores que serao resgatados pela JSP
                    request.setAttribute("relatorio", "Relatorio de funcionarios cadastrados!!");
                    request.setAttribute("relatoriofuncionarios", relatorioFuncionario.getRelatorioFuncionarios());                    
                    
                    //Enviando os valores para a JSP
                    this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/relatorio.jsp").forward(request, response);
                    break;
                }
                case "listarClientes": {
                    ClienteDAO cliente = new ClienteDAO();
                    
                    //A lista que ira retornar do metodo sera usado na criacao de uma nova classe
                    RelatorioCliente relatorioCliente = new RelatorioCliente(cliente.listar()); 
                    
                    //Setando os valores que serao resgatados pela JSP
                    request.setAttribute("relatorio", "Relatorio de clientes cadastrados!!");
                    request.setAttribute("relatorioclientes", relatorioCliente.getRelatorioClientes());
                    
                    //Enviando os valores para a JSP
                    this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/relatorio.jsp").forward(request, response);
                    break;
                }
                
//                case "listarVendas": {
//                    VendasDAO vendas = new VendasDAO();
//                    
//                    //A lista que ira retornar do metodo sera usado na criacao de uma nova classe
//                    RelatorioVenda relatorioVenda = new RelatorioVenda(vendas.listar()); 
//                    
//                    //Setando os valores que serao resgatados pela JSP
//                    request.setAttribute("relatorio", "Relatorio de vendas cadastrados!!");
//                    request.setAttribute("relatoriovendas", relatorioVenda.getRelatorioVendas());
//                    
//                    //Enviando os valores para a JSP
//                    this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/relatorio.jsp").forward(request, response);
//                    break;
//                }
            }
        } catch (IOException | ServletException e) {
            System.out.println(e);
        } catch (Exception ex) {
            Logger.getLogger(RelatorioServlet02.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
