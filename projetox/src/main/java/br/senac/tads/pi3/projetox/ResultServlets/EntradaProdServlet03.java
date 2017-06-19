/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox.ResultServlets;

import br.senac.tads.pi3.dao.ProdutoDAO;
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
 * @author ProjetoX
 */
@WebServlet(name = "EntradaProdServlet03", urlPatterns = {"/EntradaProdServlet03"})
public class EntradaProdServlet03 extends HttpServlet {

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
        HttpSession sessao = request.getSession();
        request.setAttribute("usuario", sessao.getAttribute("usuario"));
        try {
            ProdutoDAO dao = new ProdutoDAO();
            int idProd = Integer.parseInt(request.getParameter("idProduto"));
            int qtde = Integer.parseInt(request.getParameter("qtde"));
            int qtdeAtual = dao.somaProdutoEmEstoque(idProd);

            //Atualiza a quantidade em estoque
            dao.updateQuantidade(idProd, qtde, qtdeAtual, "Entrada");
            request.setAttribute("entradamsg", idProd + " Entrada de produto com sucesso!!");
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/entradaProduto.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("ERRO: " +e);
        } catch (SQLException ex) {
            Logger.getLogger(EntradaProdServlet02.class.getName()).log(Level.SEVERE, null, ex);
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

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
