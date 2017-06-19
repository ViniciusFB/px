/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox.ResultServlets;

import br.senac.tads.pi3.dao.FilialDAO;
import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Produto;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vinicius.fbatista1
 */
@WebServlet(name = "AlterarProdutoServlet02", urlPatterns = {"/AlterarProdutoServlet02"})
public class AlterarProdutoServlet02 extends HttpServlet {

    /**
     * Neste exemplo, somente apresenta a tela do formulário
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        RequestDispatcher dispatcher
//                = request.getRequestDispatcher("alterarProd.jsp");
//        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean erro = false;
        Produto produto = null;
        ProdutoDAO dao = new ProdutoDAO();
        HttpSession sessao = request.getSession();

        request.setAttribute("usuario", sessao.getAttribute("usuario"));

        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        String descricao = request.getParameter("descricao");
        double valor = Double.parseDouble(request.getParameter("valor"));

        produto = new Produto(id, nome, valor, quantidade, tipo, descricao);

        dao.atualizarProduto(produto);
        FilialDAO daoF = new FilialDAO();

        request.setAttribute("listaFilial", daoF.listar());
        request.setAttribute("produto", "Produto: ''" + request.getParameter("nome") + "'' foi alterada com sucesso!!");

//                this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/estoque.jsp").forward(request, response);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("/WEB-INF/jsp/estoque.jsp");
        dispatcher.forward(request, response);

    }
}
