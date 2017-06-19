/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox.servlet;

import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Cliente;
import br.senac.tads.pi3.models.Produto;
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

@WebServlet(name = "EntradaProdServlet01", urlPatterns = {"/EntradaProdServlet01"})
public class EntradaProdServlet01 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            ProdutoDAO dao = new ProdutoDAO();
            
            //Setando o valor que sera resgatado na JSP
            
            HttpSession sessao = request.getSession(); 
            
            request.setAttribute("usuario", sessao.getAttribute("usuario"));
            
            //Comando que ira chamar a JSP passada no parametro
            request.getRequestDispatcher("WEB-INF/jsp/entradaProduto.jsp").forward(request, response);
        }
        catch(NumberFormatException e){
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
//        boolean erro = false;
//        ProdutoDAO dao = new ProdutoDAO();
//        Produto produto = null;
//
//
//        try {
//            produto = new Produto((Produto) dao.obterProduto(Integer.parseInt(request.getParameter("idProduto"))));
//        } catch (NullPointerException | NumberFormatException e) {
//            System.out.println(e);
//            request.setAttribute("erro", "Nenhum produto foi encontrado com o ID informado!");
//            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/entradaProduto.jsp").forward(request, response);
//
//        } catch (SQLException ex) {
//            Logger.getLogger(EntradaProdServlet01.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        request.setAttribute("idProduto", produto.getId());
//        request.setAttribute("nomeProduto", produto.getNome());
//        request.setAttribute("qtdeEstoque", produto.getQuantidade());
//
//        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/entradaProduto.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
