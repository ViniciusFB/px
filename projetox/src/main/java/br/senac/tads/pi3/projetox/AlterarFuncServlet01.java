/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox;

import br.senac.tads.pi3.dao.FuncionarioDAO;
import br.senac.tads.pi3.models.Funcionario;
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
@WebServlet(name = "AlterarFuncServlet01", urlPatterns = {"/AlterarFuncServlet01"})
public class AlterarFuncServlet01 extends HttpServlet {

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
        FuncionarioDAO dao = new FuncionarioDAO();
        Funcionario funcionario = null;

        try {
            funcionario = new Funcionario((Funcionario) dao.obterFuncionario(Integer.parseInt(request.getParameter("idFuncionario"))));
        } catch (NullPointerException | NumberFormatException e) {
            System.out.println(e);
            this.getServletContext().getRequestDispatcher("/WEB-INF/ErroGenerico.jsp").forward(request, response);
        }
        request.setAttribute("id", funcionario.getId());
        request.setAttribute("nome", funcionario.getNome());
        request.setAttribute("sobrenome", funcionario.getSobrenome());
        request.setAttribute("dataNasc", funcionario.getDataNasc());
        request.setAttribute("cpf", funcionario.getCpf());
        request.setAttribute("email", funcionario.getEmail());
        request.setAttribute("telefone", funcionario.getTelefone());
        request.setAttribute("estado", funcionario.getEstado());
        request.setAttribute("cargo", funcionario.getCargo());
        request.setAttribute("login", funcionario.getLogin());
        request.setAttribute("senha", funcionario.getSenha());
        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/alterarFuncionario.jsp").forward(request, response);
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
