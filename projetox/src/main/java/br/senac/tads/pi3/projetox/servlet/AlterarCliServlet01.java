/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox.servlet;

import br.senac.tads.pi3.dao.ClienteDAO;
import br.senac.tads.pi3.models.Cliente;
import br.senac.tads.pi3.models.Funcionario;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet(name = "AlterarCliServlet01", urlPatterns = {"/AlterarCliServlet01"})
public class AlterarCliServlet01 extends HttpServlet {

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
        ClienteDAO dao = new ClienteDAO();
        Cliente cliente = null;

        try {
            cliente = new Cliente((Cliente) dao.obterCliente(Integer.parseInt(request.getParameter("idCliente"))));
        } catch (NullPointerException | NumberFormatException e) {
            System.out.println(e);
            this.getServletContext().getRequestDispatcher("/WEB-INF/ErroGenerico.jsp").forward(request, response);
        }
        request.setAttribute("id", cliente.getId());
        request.setAttribute("nome", cliente.getNome());
        request.setAttribute("sobrenome", cliente.getSobrenome());
        request.setAttribute("dataNasc", cliente.getDataNasc());
        request.setAttribute("cpf", cliente.getCpf());
        request.setAttribute("email", cliente.getEmail());
        request.setAttribute("telefone", cliente.getTelefone());
        request.setAttribute("estado", cliente.getEstado());
        request.setAttribute("cidade", cliente.getCidade());
        request.setAttribute("endereco", cliente.getEndereco());
        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/alterarCliente.jsp").forward(request, response);
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
