/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox;

import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Produto;
import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinicius.fbatista1
 */
@WebServlet(name = "CadastrarProdutoServlet02", urlPatterns = {"/CadastrarProdutoServlet02"})
public class CadastrarProdutoServlet02 extends HttpServlet {

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
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/jsp/cadastrarProduto.jsp");
        dispatcher.forward(request, response);
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

        String nome = request.getParameter("nome");
        if (nome == null || nome.length() < 1 || nome.equals("")) {
            erro = true;
            request.setAttribute("erroNome", true);
        }

        int codigo = Integer.parseInt(request.getParameter("codigo"));

        String tipo = request.getParameter("tipo");
        if (tipo == null || tipo.length() < 1) {
            erro = true;
            request.setAttribute("erroTipo", true);
        }
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        String descricao = request.getParameter("descricao");
        double valor = Double.parseDouble(request.getParameter("valor"));
        String funcionario = request.getParameter("funcio");

        if (!erro) {
            // Os dados foram preenchidos corretamente
            // Faz o fluxo POST-REDIRECT-GET para a tela de resultados
            Produto novo = new Produto(nome, codigo, tipo, quantidade, descricao, valor, funcionario, new Date());

            ProdutoDAO dao = new ProdutoDAO();
            dao.incluirComTransacao(novo);

            request.setAttribute("produto", "Produto: " + request.getParameter("nome") + " cadastrado com sucesso!!");
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/cadastrarProduto.jsp").forward(request, response);

        } else {
            // Tem erro no preenchimento dos dados.
            // Reapresenta o formulário para o usuário indicando os erros.
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/cadastrarProduto.jsp");
            dispatcher.forward(request, response);
        }
    }

}
