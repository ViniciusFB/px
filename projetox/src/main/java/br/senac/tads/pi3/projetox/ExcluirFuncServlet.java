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
@WebServlet(name = "ExcluirFuncServlet", urlPatterns = {"/ExcluirFuncServlet"})
public class ExcluirFuncServlet extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("idFuncionario"));

        funcionario = new Funcionario((Funcionario) dao.obterFuncionario(Integer.parseInt(request.getParameter("idFuncionario"))));

        String nome = funcionario.getNome();

        dao.excluirFuncionario((id));
        request.setAttribute("funcionario", "Funcionario: ''" + nome + "'' foi removido com sucesso!!");
        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/funcionarios.jsp").forward(request, response);
      
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ExcluirFuncServlet.class.getName()).log(Level.SEVERE, null, ex);
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
