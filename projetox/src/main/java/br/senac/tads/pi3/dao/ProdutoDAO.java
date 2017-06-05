/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.dao;

import br.senac.tads.pi3.models.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vinicius.fbatista1
 */
public class ProdutoDAO extends ConexaoBD {

    private ArrayList<String> produtos;
    private Produto produto;

    private ArrayList<Produto> listaProdutos;

    public ProdutoDAO() {
        this.listaProdutos = new ArrayList();
        this.produtos = new ArrayList();
        produto = null;
    }

    public ArrayList<String> getProdutos() {
        return produtos;
    }

    public Produto selecionaProduto(String id) throws SQLException {
        PreparedStatement stmt = null;
        Connection conn = null;
        try {
//            String sql = "SELECT * FROM PRODUTO WHERE PRODUTO.ID_PRODUTO = " + id;
            String sql = "SELECT idProduto, nomeProduto, codigo, valorProduto, quantidade, tipoProduto, descricao FROM Produto"
                    + " WHERE idProduto = " + id;

            conn = obterConexao();
            stmt = conn.prepareStatement(sql);

            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                this.produto = new Produto(
                        resultados.getInt(1),
                        resultados.getString(2),
                        resultados.getInt(3),
                        resultados.getDouble(4),
                        resultados.getInt(5),
                        resultados.getString(6),
                        resultados.getString(7));

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return this.produto;

    }

    public Produto obterProduto(int idProduto) throws SQLException {
        PreparedStatement stmt = null;
        Connection conn = null;
        Produto p = null;

        String sql = "SELECT idProduto, nomeProduto, codigo, tipoProduto, quantidade, descricao, valorProduto "
                + "FROM Produto WHERE idProduto = ?";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idProduto);
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                int id = resultados.getInt("idProduto");
                String nome = resultados.getString("nomeProduto");
                int codigo = resultados.getInt("codigo");
                String tipo = resultados.getString("tipoProduto");
                int quantidade = resultados.getInt("quantidade");
                String descricao = resultados.getString("descricao");
                double valor = resultados.getDouble("valorProduto");
                p = new Produto(id, nome, codigo, tipo, quantidade, descricao, valor);
                break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return p;

    }

    public List<Produto> listar() {
        Statement stmt = null;
        Connection conn = null;

//        String sql = "SELECT idProduto, nomeProduto, codigo, tipoProduto, quantidade, descricao, valorProduto, cadastradoPor, dataCadastro "
//                + "FROM Produto";
        String sql = "SELECT idProduto, nomeProduto, codigo, tipoProduto, quantidade, descricao, valorProduto, cadastradoPor, "
                + " dataCadastro FROM Produto WHERE disponivel = 'true' ";

        List<Produto> lista = new ArrayList<>();

        try {
            conn = obterConexao();
            stmt = conn.createStatement();
            ResultSet resultados = stmt.executeQuery(sql);
            DateFormat formatadorData = new SimpleDateFormat("dd/MM/yyyy");

            while (resultados.next()) {
                int id = resultados.getInt("idProduto");
                String nome = resultados.getString("nomeProduto");
                int codigo = resultados.getInt("codigo");
                String tipo = resultados.getString("tipoProduto");
                int quantidade = resultados.getInt("quantidade");
                String descricao = resultados.getString("descricao");
                double valor = resultados.getDouble("valorProduto");
                String funcionario = resultados.getString("cadastradoPor");
                Date data = resultados.getDate("dataCadastro");

                Produto produto = new Produto(id, nome, codigo,
                        tipo, quantidade, descricao, valor, funcionario, data);
                lista.add(produto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return lista;
    }
    
    public List<Produto> pesquisarProduto(String nome) throws SQLException, ClassNotFoundException {
        
         PreparedStatement stmt = null;
        Connection conn = null;
        String sql = "SELECT idProduto, nomeProduto, tipoProduto, quantidade, valorProduto "
                + "FROM Produto WHERE disponivel = 'true' AND nomeProduto = ? ";
        List<Produto> lista = new ArrayList<>();
        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            

            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                
                 int id = resultados.getInt("idProduto");
                String nomeP = resultados.getString("nomeProduto");
                String tipo = resultados.getString("tipoProduto");
                int quantidade = resultados.getInt("quantidade");
                double valor = resultados.getDouble("valorProduto");
                
                lista.add(new Produto(id, nomeP, tipo, quantidade, valor));
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println(e);
        } finally {
            
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return lista;
    }

    public void incluirComTransacao(Produto produto) {
        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "INSERT INTO Produto "
                + "(nomeProduto, codigo, tipoProduto, quantidade, descricao, valorProduto, cadastradoPor, dataCadastro, disponivel) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = obterConexao();

            conn.setAutoCommit(false); // Permite usar transacoes para multiplos comandos no banco de dados
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, produto.getNome());
            stmt.setInt(2, produto.getCodigo());
            stmt.setString(3, produto.getTipo());
            stmt.setInt(4, produto.getQuantidade());
            stmt.setString(5, produto.getDescricao());
            stmt.setDouble(6, produto.getValor());
            stmt.setString(7, produto.getFuncio());
            stmt.setTimestamp(8, new java.sql.Timestamp(System.currentTimeMillis()));
            stmt.setBoolean(9, true);

            stmt.executeUpdate();

            // ResultSet para recuperar o ID gerado automaticamente no banco de dados.
            // Neste exemplo, o ID é gerado automaticamente.
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int idNovo = generatedKeys.getInt(1);
                produto.setId(idNovo);
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
                Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            try {
                // Caso ocorra algum erro, tenta desfazer todas as ações realizadas no BD.
                if (conn != null & !conn.isClosed()) {
                    conn.rollback();
                }
            } catch (SQLException ex1) {
                Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public void incluir(Produto produto) {
        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "INSERT INTO Produto "
                + "(nomeProduto, codigo, tipoProduto, quantidade, descricao, valorProduto, cadastradoPor, dataCadastro, disponivel) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getNome());
            stmt.setInt(2, produto.getCodigo());
            stmt.setString(3, produto.getTipo());
            stmt.setInt(4, produto.getQuantidade());
            stmt.setString(5, produto.getDescricao());
            stmt.setDouble(6, produto.getValor());
            stmt.setString(7, produto.getFuncio());
            stmt.setTimestamp(8, new java.sql.Timestamp(System.currentTimeMillis()));
            stmt.setString(9, produto.getFuncio());
            stmt.setTimestamp(10, new java.sql.Timestamp(System.currentTimeMillis()));
            stmt.setBoolean(11, true);

            stmt.executeUpdate();
            //System.out.println("Registro incluido com sucesso.");

        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public void excluirProduto(int id) {

        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "UPDATE Produto SET disponivel=? WHERE (idProduto=?)";

        try {

            conn = obterConexao();
            stmt = conn.prepareStatement(sql);

            stmt.setBoolean(1, false);
            stmt.setInt(2, id);

            stmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public void atualizarProduto(Produto produto) {

        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "UPDATE Produto SET nomeProduto=?, tipoProduto=?, quantidade=?, descricao=?, valorProduto=? "
                + " WHERE (idProduto=?)";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getNome());
            stmt.setString(2, produto.getTipo());
            stmt.setInt(3, produto.getQuantidade());
            stmt.setString(4, produto.getDescricao());
            stmt.setDouble(5, produto.getValor());
            stmt.setInt(6, produto.getId());

            stmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public void adicionarExclusao(Produto produto) {

        PreparedStatement stmt = null;
        Connection conn = null;

        String sql = "INSERT INTO ProdutosExcluidos "
                + "(nomeProduto, quantidade, valorProduto, excluidoPor, dataExclusao) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);

//            Produto produto = new Produto();
            stmt.setString(1, produto.getNome());
            stmt.setInt(2, produto.getQuantidade());
            stmt.setDouble(3, produto.getValor());
            stmt.setString(4, produto.getFuncio());
            stmt.setTimestamp(5, new java.sql.Timestamp(System.currentTimeMillis()));

            stmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public List<Produto> listarExclusoes() {
        Statement stmt = null;
        Connection conn = null;

        String sql = "SELECT idExclusao, nomeProduto, quantidade, valorProduto, excluidoPor, dataExclusao "
                + "FROM ProdutosExcluidos";

        List<Produto> lista = new ArrayList<>();

        try {
            conn = obterConexao();
            stmt = conn.createStatement();
            ResultSet resultados = stmt.executeQuery(sql);
            DateFormat formatadorData = new SimpleDateFormat("dd/MM/yyyy");

            while (resultados.next()) {
                int id = resultados.getInt("idExclusao");
                String nome = resultados.getString("nomeProduto");
                int quantidade = resultados.getInt("quantidade");
                double valor = resultados.getDouble("valorProduto");
                String funcionario = resultados.getString("excluidoPor");
                Date data = resultados.getDate("dataExclusao");

                Produto produto = new Produto(id, nome,
                        quantidade, valor, funcionario, data);
                lista.add(produto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return lista;
    }

}
