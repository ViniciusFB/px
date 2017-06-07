/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.dao;

import br.senac.tads.pi3.models.Funcionario;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vinicius Ferreira Batista
 */
public class FuncionarioDAO extends ConexaoBD {

    public Funcionario obterFuncionario(int idFuncionario) {
        PreparedStatement stmt = null;
        Connection conn = null;
        Funcionario f = null;

        String sql = "SELECT idFuncionario, nomeFuncionario, sobrenomeFuncionario, dataNasc, "
                + " cpfFuncionario, emailFuncionario, telefoneFuncionario, estadoFuncionario, cidadeFuncionario, cargo, login, senha "
                + "FROM Funcionario WHERE idFuncionario = ?";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idFuncionario);
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                int id = resultados.getInt("idFuncionario");
                String nome = resultados.getString("nomeFuncionario");
                String sobrenome = resultados.getString("sobrenomeFuncionario");
                Date dataNasc = resultados.getDate("dataNasc");
                String cpf = resultados.getString("cpfFuncionario");
                String email = resultados.getString("emailFuncionario");
                String telefone = resultados.getString("telefoneFuncionario");
                String estado = resultados.getString("estadoFuncionario");
                String cidade = resultados.getString("cidadeFuncionario");
                String cargo = resultados.getString("cargo");
                String login = resultados.getString("login");
                String senha = resultados.getString("senha");
                f = new Funcionario(id, nome, sobrenome, dataNasc, cpf, email, telefone, estado, cidade, cargo, login, senha);
                break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return f;

    }

    public List<Funcionario> listar() {
        Statement stmt = null;
        Connection conn = null;

        String sql = "SELECT idFuncionario, nomeFuncionario, sobrenomeFuncionario, dataNasc,"
                + " cpfFuncionario, emailFuncionario, telefoneFuncionario, estadoFuncionario, cidadeFuncionario, cargo, login "
                + "FROM Funcionario";

        List<Funcionario> lista = new ArrayList<>();
        try {
            conn = obterConexao();
            stmt = conn.createStatement();
            ResultSet resultados = stmt.executeQuery(sql);

            //     DateFormat formatadorData = new SimpleDateFormat("dd/MM/yyyy");
            while (resultados.next()) {
                int id = resultados.getInt("idFuncionario");
                String nome = resultados.getString("nomeFuncionario");
                String sobrenome = resultados.getString("sobrenomeFuncionario");
                Date dataNasc = resultados.getDate("dataNasc");
                String cpf = resultados.getString("cpfFuncionario");
                String email = resultados.getString("emailFuncionario");
                String telefone = resultados.getString("telefoneFuncionario");
                String estado = resultados.getString("estadoFuncionario");
                String cidade = resultados.getString("cidadeFuncionario");
                String cargo = resultados.getString("cargo");
                String login = resultados.getString("login");

                Funcionario funcionario = new Funcionario(id, nome, sobrenome, dataNasc, cpf, email, telefone,
                        estado, cidade, cargo, login);
                lista.add(funcionario);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return lista;
    }

    public void incluirComTransacao(Funcionario funcionario) {
        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "INSERT INTO Funcionario "
                + "(nomeFuncionario, sobrenomeFuncionario, dataNasc, cpfFuncionario, emailFuncionario,"
                + "telefoneFuncionario, estadoFuncionario, cidadeFuncionario, cargo, login, senha) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = obterConexao();

            conn.setAutoCommit(false); // Permite usar transacoes para multiplos comandos no banco de dados
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getSobrenome());
            stmt.setDate(3, funcionario.getDataNasc());
            stmt.setString(4, funcionario.getCpf());
            stmt.setString(5, funcionario.getEmail());
            stmt.setString(6, funcionario.getTelefone());
            stmt.setString(7, funcionario.getEstado());
            stmt.setString(8, funcionario.getCidade());
            stmt.setString(9, funcionario.getCargo());
            stmt.setString(10, funcionario.getLogin());
            stmt.setString(11, funcionario.getSenha());

            stmt.executeUpdate();

            // ResultSet para recuperar o ID gerado automaticamente no banco de dados.
            // Neste exemplo, o ID é gerado automaticamente.
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int idNovo = generatedKeys.getInt(1);
                funcionario.setId(idNovo);
                System.out.println("***** ID NOVO CADASTRADO: " + String.valueOf(idNovo));

                // Executar próximos INSERTs USANDO O ID novo.
            }
            conn.commit();
        } catch (SQLException ex) {
            try {
                // Caso ocorra algum erro, tenta desfazer todas as ações realizadas no BD.
                if (conn != null & !conn.isClosed()) {
                    conn.rollback();
                }
            } catch (SQLException ex1) {
                Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            try {
                // Caso ocorra algum erro, tenta desfazer todas as ações realizadas no BD.
                if (conn != null & !conn.isClosed()) {
                    conn.rollback();
                }
            } catch (SQLException ex1) {
                Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void incluir(Funcionario funcionario) {
        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "INSERT INTO Funcionario "
                + "(nomeFuncionario, sobrenomeFuncionario, dataNasc, cpfFuncionario, emailFuncionario,"
                + "telefoneFuncionario, estadoFuncionario, cidadeFuncionario, cargo, login, senha) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getSobrenome());
            stmt.setDate(3, funcionario.getDataNasc());
            stmt.setString(4, funcionario.getCpf());
            stmt.setString(5, funcionario.getEmail());
            stmt.setString(6, funcionario.getTelefone());
            stmt.setString(7, funcionario.getEstado());
            stmt.setString(8, funcionario.getCidade());
            stmt.setString(9, funcionario.getCargo());
            stmt.setString(10, funcionario.getLogin());
            stmt.setString(11, funcionario.getSenha());
            stmt.executeUpdate();
            //System.out.println("Registro incluido com sucesso.");

        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void excluirFuncionario(int id) {

        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "DELETE FROM Funcionario WHERE (idFuncionario=?)";

        try {

            conn = obterConexao();
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, id);

            stmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }
    public void atualizarFuncionario(Funcionario funcionario) {

        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "UPDATE Funcionario SET nomeFuncionario=?, sobrenomeFuncionario=?, dataNasc=?, cpfFuncionario=?, emailFuncionario=?, "
                + "telefoneFuncionario=?, login=? WHERE (idFuncionario=?)";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getSobrenome());
            stmt.setDate(3, funcionario.getDataNasc());
            stmt.setString(4, funcionario.getCpf());
            stmt.setString(5, funcionario.getEmail());
            stmt.setString(6, funcionario.getTelefone());
            stmt.setString(7, funcionario.getLogin());
            stmt.setInt(8, funcionario.getId());

            stmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

}
