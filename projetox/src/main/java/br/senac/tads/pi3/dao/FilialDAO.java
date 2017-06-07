/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.dao;

import br.senac.tads.pi3.models.Filial;
import java.sql.Connection;
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
public class FilialDAO extends ConexaoBD {

    public Filial obterFilial(int idFilial) throws SQLException {
        PreparedStatement stmt = null;
        Connection conn = null;
        Filial f = null;

        String sql = "SELECT idFilial, nomeFilial, estadoFilial, cidadeFilial "
                + "FROM Filial WHERE idFilial = ?";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idFilial);
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                int id = resultados.getInt("idFilial");
                String nome = resultados.getString("nomeFilial");
                String estado = resultados.getString("estadoFilial");
                String cidade = resultados.getString("cidadeFilial");
                f = new Filial(id, nome, estado, cidade);
                break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return f;

    }
    public Filial obterFilialPorNome(String nomeFilial) throws SQLException {
        PreparedStatement stmt = null;
        Connection conn = null;
        Filial f = null;

        String sql = "SELECT idFilial, nomeFilial, estadoFilial, cidadeFilial "
                + "FROM Filial WHERE nomeFilial = ?";

        try {
            conn = obterConexao();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nomeFilial);
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                int id = resultados.getInt("idFilial");
                String nome = resultados.getString("nomeFilial");
                String estado = resultados.getString("estadoFilial");
                String cidade = resultados.getString("cidadeFilial");
                f = new Filial(id, nome, estado, cidade);
                break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return f;

    }

    public List<Filial> listar() {
        Statement stmt = null;
        Connection conn = null;

        String sql = "SELECT idFilial, nomeFilial, estadoFilial, cidadeFilial FROM Filial ";

        List<Filial> lista = new ArrayList<>();

        try {
            conn = obterConexao();
            stmt = conn.createStatement();
            ResultSet resultados = stmt.executeQuery(sql);

            while (resultados.next()) {
                int id = resultados.getInt("idFilial");
                String nome = resultados.getString("nomeFilial");
                String estado = resultados.getString("estadoFilial");
                String cidade = resultados.getString("cidadeFilial");

                Filial filial = new Filial(id, nome, estado, cidade);
                lista.add(filial);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Código colocado aqui para garantir que a conexão com o banco
            // seja sempre fechada, independentemente se executado com sucesso
            // ou erro.
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(FilialDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return lista;
    }

}
