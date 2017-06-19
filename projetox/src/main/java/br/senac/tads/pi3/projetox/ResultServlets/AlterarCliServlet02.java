/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox.ResultServlets;

import br.senac.tads.pi3.dao.ClienteDAO;
import br.senac.tads.pi3.models.Cliente;
import java.io.IOException;
import java.sql.Date;
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
@WebServlet(name = "AlterarCliServlet02", urlPatterns = {"/AlterarCliServlet02"})
public class AlterarCliServlet02 extends HttpServlet {

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
        Cliente cliente = null;
        ClienteDAO dao = new ClienteDAO();
        HttpSession sessao = request.getSession();

        request.setAttribute("usuario", sessao.getAttribute("usuario"));

        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        Date dataNasc = Date.valueOf(request.getParameter("dataNasc"));
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String estado = request.getParameter("estado");
        String cidade = request.getParameter("cidade");
        String endereco = request.getParameter("endereco");

        cliente = new Cliente(id, nome, sobrenome, dataNasc, cpf, email, telefone, estado, cidade, endereco);

        dao.atualizarCliente(cliente);
        request.setAttribute("listaClientes", dao.listar());
        request.setAttribute("cliente", "Cliente: ''" + nome + "'' foi alterado com sucesso!!");

//                this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/estoque.jsp").forward(request, response);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("/WEB-INF/jsp/clientes.jsp");
        dispatcher.forward(request, response);

    }
}
