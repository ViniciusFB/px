/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox;

import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
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
@WebServlet(name = "ExcluirProdutoServlet", urlPatterns = {"/ExcluirProdutoServlet"})
public class ExcluirProdutoServlet extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("idProduto"));

        try {
            produto = new Produto((Produto) dao.obterProduto(Integer.parseInt(request.getParameter("idProduto"))));
        } catch (SQLException ex) {
            Logger.getLogger(ExcluirProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        String funcionario = request.getParameter("funcio");
        String nome = produto.getNome();
        int quantidade = produto.getQuantidade();
        double valor = produto.getValor();
     //   HttpSession sessao = request.getSession();
      //  request.setAttribute("usuario", sessao.getAttribute("usuario"));
     //   String funcionario = (String) sessao.getAttribute("nomeCompleto");  Aqui retorna null porque
        // esse get pega todo o conteúdo do UsuarioSistema. Nome, nomeCompleto e senha!
        // Para resolver, dar um jeito de pegar só esse nomeCompleto

        produto = new Produto(id, nome, quantidade, valor, funcionario, new Date());

        dao.adicionarExclusao(produto);

        dao.excluirProduto((id));
        request.setAttribute("produto", "Produto: ''" + nome + "'' foi removido com sucesso!!");
        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/estoque.jsp").forward(request, response);
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ExcluirProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        request.setAttribute("usuario", sessao.getAttribute("usuario"));

    }

}
