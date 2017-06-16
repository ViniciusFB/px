/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.projetox;

import br.senac.tads.pi3.dao.ClienteDAO;
import br.senac.tads.pi3.dao.ProdutoDAO;
import br.senac.tads.pi3.models.Cliente;
import br.senac.tads.pi3.models.Produto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinicius.fbatista1
 */
@WebServlet(name = "VendaServlet02", urlPatterns = {"/VendaServlet02"})
public class VendaServlet02 extends HttpServlet {

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
        ClienteDAO dao = new ClienteDAO();
        Cliente cliente = null;
        Produto prod = null;
        ProdutoDAO daoP = new ProdutoDAO();
        List<Produto> produto = daoP.listar();

        request.setAttribute("listaProdutos", produto);

        try {
            cliente = new Cliente((Cliente) dao.obterCliente(Integer.parseInt(request.getParameter("idCliente"))));
        } catch (NullPointerException | NumberFormatException e) {
            System.out.println(e);
            this.getServletContext().getRequestDispatcher("/WEB-INF/ErroGenerico.jsp").forward(request, response);

        }
        

        request.setAttribute("idCliente", cliente.getId());
        request.setAttribute("nomeCliente", cliente.getNome());
        request.setAttribute("cpfCliente", cliente.getCpf());
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/vendas.jsp").forward(request, response);
   

    }
}
