/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.dao;

import br.senac.tads.pi3.models.Cliente;
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
 * @author vinicius.fbatista1
 */
public class ClienteDAO extends ConexaoBD {

    public Cliente obterCliente(int idCliente) {
        PreparedStatement stmt = null;
        Connection conn = null;
        Cliente c = null;

        String sql = "SELECT idCliente, nomeCliente, sobrenomeCliente, dataNasc, cpfCliente, emailCliente, telefoneCliente, estadoCliente, cidadeCliente, enderecoCliente,"
                + "cepCliente, numCasa, generoCliente "
                + "FROM Cliente WHERE idCliente = ?";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                int id = resultados.getInt("idCliente");
                String nome = resultados.getString("nomeCliente");
                String sobrenome = resultados.getString("sobrenomeCliente");
                Date dataNasc = resultados.getDate("dataNasc");
                String cpf = resultados.getString("cpfCliente");
                String email = resultados.getString("emailCliente");
                String telefone = resultados.getString("telefoneCliente");
                String estado = resultados.getString("estadoCliente");
                String cidade = resultados.getString("cidadeCliente");
                String endereco = resultados.getString("enderecoCliente");
                String cep = resultados.getString("cepCliente");
                int numCasa = resultados.getInt("numCasa");
                String genero = resultados.getString("generoCliente");
                c = new Cliente(id, nome, sobrenome, dataNasc, cpf, email, telefone, estado, cidade, endereco, cep, numCasa, genero);
                break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return c;

    }

    public List<Cliente> listar() {
        Statement stmt = null;
        Connection conn = null;

        String sql = "SELECT idCliente, nomeCliente, sobrenomeCliente, dataNasc, cpfCliente, emailCliente, telefoneCliente, estadoCliente, cidadeCliente, enderecoCliente,"
                + "cepCliente, numCasa, generoCliente "
                + "FROM Cliente";

        List<Cliente> lista = new ArrayList<>();
        try {
            conn = obterConexao();
            stmt = conn.createStatement();
            ResultSet resultados = stmt.executeQuery(sql);

            //     DateFormat formatadorData = new SimpleDateFormat("dd/MM/yyyy");
            while (resultados.next()) {
                int id = resultados.getInt("idCliente");
                String nome = resultados.getString("nomeCliente");
                String sobrenome = resultados.getString("sobrenomeCliente");
                Date dataNasc = resultados.getDate("dataNasc");
                String cpf = resultados.getString("cpfCliente");
                String email = resultados.getString("emailCliente");
                String telefone = resultados.getString("telefoneCliente");
                String estado = resultados.getString("estadoCliente");
                String cidade = resultados.getString("cidadeCliente");
                String endereco = resultados.getString("enderecoCliente");
                String cep = resultados.getString("cepCliente");
                int numCasa = resultados.getInt("numCasa");
                String genero = resultados.getString("generoCliente");
                Cliente cliente = new Cliente(id, nome, sobrenome, dataNasc, cpf, email, telefone, estado, cidade,
                        endereco, cep, numCasa, genero);

                lista.add(cliente);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return lista;
    }

    public void incluirComTransacao(Cliente cliente) {
        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "INSERT INTO Cliente "
                + "(nomeCliente, sobrenomeCliente, dataNasc, cpfCliente, emailCliente, telefoneCliente, estadoCliente, cidadeCliente, enderecoCliente,"
                + "cepCliente, numCasa, generoCliente) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = obterConexao();

            conn.setAutoCommit(false); // Permite usar transacoes para multiplos comandos no banco de dados
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getSobrenome());
            stmt.setDate(3, cliente.getDataNasc());
            stmt.setString(4, cliente.getCpf());
            stmt.setString(5, cliente.getEmail());
            stmt.setString(6, cliente.getTelefone());
            stmt.setString(7, cliente.getEstado());
            stmt.setString(8, cliente.getCidade());
            stmt.setString(9, cliente.getEndereco());
            stmt.setString(10, cliente.getCep());
            stmt.setInt(11, cliente.getNumCasa());
            stmt.setString(12, cliente.getGenero());

            stmt.executeUpdate();

            // ResultSet para recuperar o ID gerado automaticamente no banco de dados.
            // Neste exemplo, o ID é gerado automaticamente.
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int idNovo = generatedKeys.getInt(1);
                cliente.setId(idNovo);
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
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            try {
                // Caso ocorra algum erro, tenta desfazer todas as ações realizadas no BD.
                if (conn != null & !conn.isClosed()) {
                    conn.rollback();
                }
            } catch (SQLException ex1) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void incluir(Cliente cliente) {
        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "INSERT INTO Cliente "
                + "(nomeCliente, sobrenomeCliente, dataNasc, cpfCliente, emailCliente, telefoneCliente, estadoCliente, cidadeCliente, enderecoCliente,"
                + "cepCliente, numCasa, generoCliente) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getSobrenome());
            stmt.setDate(3, cliente.getDataNasc());
            stmt.setString(4, cliente.getCpf());
            stmt.setString(5, cliente.getEmail());
            stmt.setString(6, cliente.getTelefone());
            stmt.setString(7, cliente.getEstado());
            stmt.setString(8, cliente.getCidade());
            stmt.setString(9, cliente.getEndereco());
            stmt.setString(10, cliente.getCep());
            stmt.setInt(11, cliente.getNumCasa());
            stmt.setString(12, cliente.getGenero());
            stmt.executeUpdate();
            //System.out.println("Registro incluido com sucesso.");

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

}
