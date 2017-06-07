/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox;

import br.senac.tads.pi3.dao.FilialDAO;
import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Filial;
import br.senac.tads.pi3.models.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        HttpSession sessao = request.getSession();
        request.setAttribute("usuario", sessao.getAttribute("usuario"));
        FilialDAO df = new FilialDAO();
        Filial f = null;

        String nome = request.getParameter("nome");
        nome = nome.trim();
        if (nome == null || nome.length() < 3 || nome.equals("")) {
            erro = true;
            request.setAttribute("produto", "Não foi possível cadastrar o produto!");
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
        String filial = request.getParameter("filial");
        
        try {
            f = new Filial((Filial) df.obterFilialPorNome(filial));
        } catch (SQLException ex) {
            Logger.getLogger(CadastrarProdutoServlet02.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            int id = f.getId();
            

        if (!erro) {
            // Os dados foram preenchidos corretamente
            // Faz o fluxo POST-REDIRECT-GET para a tela de resultados
            Produto novo = new Produto(nome, codigo, tipo, quantidade, descricao, valor, funcionario, new Date(), id);

            ProdutoDAO dao = new ProdutoDAO();
            dao.incluirComTransacao(novo);

            request.setAttribute("produto", "Produto: ''" + request.getParameter("nome") + "'' foi cadastrado com sucesso!!");
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/cadastrarProduto.jsp").forward(request, response);

        } else {
            // Tem erro no preenchimento dos dados.
            // Reapresenta o formulário para o usuário indicando os erros.
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/cadastrarProduto.jsp");
            dispatcher.forward(request, response);
        }
    }

}
