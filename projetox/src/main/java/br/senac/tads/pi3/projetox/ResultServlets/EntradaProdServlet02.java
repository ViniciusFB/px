/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox.ResultServlets;

import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Produto;
import br.senac.tads.pi3.projetox.servlet.EntradaProdServlet01;
import java.util.Date;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "EntradaProdServlet02", urlPatterns = {"/EntradaProdServlet02"})
public class EntradaProdServlet02 extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
//        HttpSession sessao = request.getSession();
//        request.setAttribute("usuario", sessao.getAttribute("usuario"));
//        try {
//            ProdutoDAO dao = new ProdutoDAO();
//            int idProd = Integer.parseInt(request.getParameter("idProduto"));
//            int qtde = Integer.parseInt(request.getParameter("qtde"));
//            int qtdeAtual = dao.somaProdutoEmEstoque(idProd);
//            
//            //Atualiza a quantidade em estoque
//            dao.updateQuantidade(idProd, qtde, qtdeAtual, "Entrada");
//            request.setAttribute("entradamsg", idProd +" Entrada de produto com sucesso!!");
//            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/entradaProduto.jsp").forward(request, response);
//
//        } catch (NumberFormatException e) {
//            System.out.println(e);
//        } catch (SQLException ex) {
//            Logger.getLogger(EntradaProdServlet02.class.getName()).log(Level.SEVERE, null, ex);
//        }
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
        processRequest(request, response);
        boolean erro = false;
        ProdutoDAO dao = new ProdutoDAO();
        Produto produto = null;

        try {
            produto = new Produto((Produto) dao.obterProduto(Integer.parseInt(request.getParameter("idProduto"))));
        } catch (NullPointerException | NumberFormatException e) {
            System.out.println(e);
            request.setAttribute("entradamsg", "Nenhum produto foi encontrado com o ID informado!");
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/entradaProduto.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(EntradaProdServlet01.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("idProduto", produto.getId());
        request.setAttribute("nomeProduto", produto.getNome());
        request.setAttribute("qtdeEstoque", produto.getQuantidade());

        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/entradaProduto.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
