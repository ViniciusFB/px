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
import java.util.List;
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
@WebServlet(name = "EstoqueServlet02", urlPatterns = {"/EstoqueServlet02"})
public class EstoqueServlet02 extends HttpServlet {

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
        ProdutoDAO dao = new ProdutoDAO();
        FilialDAO daoF = new FilialDAO();

        List<Produto> produtos;
        List<Produto> filiais;
        Filial f = null;
        HttpSession sessao = request.getSession();
        request.setAttribute("usuario", sessao.getAttribute("usuario"));
       int idFilial = -0;
        try {
            String nome = request.getParameter("nomeProduto");
//            int filial = Integer.parseInt(request.getParameter("filial"));
            String campoFilial = request.getParameter("filial");

            if (campoFilial != null) {
                f = new Filial((Filial) daoF.obterFilialPorNome(campoFilial));
                idFilial = f.getId();

            }

            if (nome != null && campoFilial == null || campoFilial.equals("")) {
                produtos = dao.pesquisarProduto(nome);
                request.setAttribute("pesquisa", produtos);
            } else if (nome != null && !campoFilial.equals("")) {
                produtos = dao.pesquisarProdutoNomeFilial(nome, idFilial);
                request.setAttribute("pesquisa", produtos);
            }

            if (nome == null || nome.equals("") && campoFilial == null) {
                produtos = dao.listar();
                request.setAttribute("pesquisa", produtos);

            } else if (nome.equals("") && !campoFilial.equals("")) {
                produtos = dao.pesquisarProdutoFilial(idFilial);
                request.setAttribute("pesquisa", produtos);
            }

            
            request.setAttribute("listaFilial", daoF.listar());
            
            //Enviando os valores setados no servlet para a JSP determinada no parametro
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/estoque.jsp").forward(request, response);

        } catch (SQLException | ServletException | IOException e) {
            System.out.println(e);

            //Caso aconteca algum erro, a tela sera direcionada para a JSP passada como parametro no metodo abaixo
            this.getServletContext().getRequestDispatcher("/WEB-INF/ErroGenerico.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstoqueServlet02.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
