/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox.servlet;

import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Produto;
import java.io.IOException;
import java.sql.SQLException;
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
 * @author Vinicius Ferreira Batista
 */
@WebServlet(name = "AlterarProdutoServlet01", urlPatterns = {"/AlterarProdutoServlet01"})
public class AlterarProdutoServlet01 extends HttpServlet {

    /**
     * Neste exemplo, somente apresenta a tela do formulário
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProdutoDAO dao = new ProdutoDAO();
        Produto produto = null;

        try {
            produto = new Produto((Produto) dao.obterProduto(Integer.parseInt(request.getParameter("idProduto"))));
        } catch (NullPointerException | NumberFormatException e) {
            System.out.println(e);
            this.getServletContext().getRequestDispatcher("/WEB-INF/ErroGenerico.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AlterarProdutoServlet01.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("id", produto.getId());
        request.setAttribute("nome", produto.getNome());
        request.setAttribute("codigo", produto.getCodigo());
        request.setAttribute("valor", produto.getValor());
        request.setAttribute("tipo", produto.getTipo());
        request.setAttribute("quantidade", produto.getQuantidade());
        request.setAttribute("descricao", produto.getDescricao());
        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/alterarProduto.jsp").forward(request, response);
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
        HttpSession sessao = request.getSession();
        request.setAttribute("usuarioLogado", sessao.getAttribute("usuarioLogado"));

    }

}
