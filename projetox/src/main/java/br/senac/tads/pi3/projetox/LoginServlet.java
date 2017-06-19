/*
 * The MIT License
 *
 * Copyright 2017 bruno.flima4.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package br.senac.tads.pi3.projetox;

import br.senac.tads.pi3.dao.FuncionarioDAO;
import br.senac.tads.pi3.models.Funcionario;
import java.io.IOException;
import java.sql.SQLException;
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
 * @author bruno.flima4
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();
        Funcionario funcionario = null;
        FuncionarioDAO dao = new FuncionarioDAO();
        String usuario = request.getParameter("usuario");

        try {
            funcionario = new Funcionario((Funcionario) dao.obterFuncionarioPorLogin(usuario));

        } catch (NullPointerException | NumberFormatException e) {
            System.out.println(e);
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/erroLogin.jsp").forward(request, response);
        }

//            String senha = dao.selecionaHashSenha(request.getParameter("username"));
        String senha = funcionario.getSenha();
        sessao.setAttribute("cargo", funcionario.getCargo());
        String senhaDigitada = request.getParameter("senha");
        try {
            sessao.setAttribute("usuario", dao.selecionaNomeByLoginSenha(request.getParameter("usuario"), senha));
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (senha == null) {
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/erroLogin.jsp").forward(request, response);
        } else if (senha.equals(senhaDigitada)) {
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
        } else {
            this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/erroLogin.jsp").forward(request, response);
        }

    }
}
