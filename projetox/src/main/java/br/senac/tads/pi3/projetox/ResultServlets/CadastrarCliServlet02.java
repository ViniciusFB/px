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
 * @author ProjetoX
 */
@WebServlet(name = "CadastrarCliServlet02", urlPatterns = {"/CadastrarCliServlet02"})
public class CadastrarCliServlet02 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/jsp/cadastrarCliente.jsp");
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

        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        Date dataNasc = Date.valueOf(request.getParameter("dataNasc"));
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String estado = request.getParameter("estado");
        String cidade = request.getParameter("cidade");
        String endereco = request.getParameter("endereco");
        String genero = request.getParameter("genero");
        
        if (!erro) {
            // Os dados foram preenchidos corretamente
            // Faz o fluxo POST-REDIRECT-GET para a tela de resultados
            Cliente novo = new Cliente(nome, sobrenome, dataNasc, cpf, email, telefone, estado, cidade, endereco, genero);

            ClienteDAO dao = new ClienteDAO();
            dao.incluirComTransacao(novo);

//            UsuarioSistema usuario = new UsuarioSistema();
//            usuario.setUsuario(cargo);
//            usuario.setSenha(cargo);
//            usuario.setNomeCompleto(cargo);
//            usuario.setPapeis(cargo);
            request.setAttribute("cliente", "Cliente: ''" + request.getParameter("nome") + "'' foi cadastrado com sucesso!!");
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/cadastrarCliente.jsp").forward(request, response);
        } else {
            // Tem erro no preenchimento dos dados.
            // Reapresenta o formulário para o usuário indicando os erros.
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/cadastrarFuncionario.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
