/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.models;

import java.util.Date;

/**
 *
 * @author Vinicius Ferreira Batista
 */
public class Produto {

    private int id;
    private String nome;
    private int codigo;
    private int quantidade;
    private double valor;
    private String descricao;
    private String tipo;
    private int idFilial;

    // Para gerar relatórios de cadastrado
    private String funcio;
    private Date dataCadastro;

    // Para gerar relatórios de exclusão
    private Date dataExclusao;

    public Produto() {

    }

    public Produto(String nome, int quantidade, double valor, String descricao, String tipo) {
        this.nome = nome;
        this.quantidade = quantidade;
        this.valor = valor;
        this.descricao = descricao;
        this.tipo = tipo;
    }

    public Produto(String nome, int codigo, String tipo, int quantidade, String descricao, double valor) {
        this.nome = nome;
        this.codigo = codigo;
        this.tipo = tipo;
        this.quantidade = quantidade;
        this.descricao = descricao;
        this.valor = valor;
    }

    public Produto(int id, String nome, int codigo, String tipo, int quantidade, String descricao, double valor) {
        this.id = id;
        this.nome = nome;
        this.codigo = codigo;
        this.tipo = tipo;
        this.quantidade = quantidade;
        this.descricao = descricao;
        this.valor = valor;

    }

    // Construtores para gerar relatórios de cadastro
    public Produto(int id, String nome, int codigo, String tipo, int quantidade, String descricao, double valor, String funcio, Date dataCadastro) {
        this.id = id;
        this.nome = nome;
        this.codigo = codigo;
        this.tipo = tipo;
        this.quantidade = quantidade;
        this.descricao = descricao;
        this.valor = valor;
        this.funcio = funcio;
        this.dataCadastro = dataCadastro;

    }

    public Produto(String nome, int codigo, String tipo, int quantidade, String descricao, double valor, String funcio, Date dataCadastro) {

        this.nome = nome;
        this.codigo = codigo;
        this.tipo = tipo;
        this.quantidade = quantidade;
        this.descricao = descricao;
        this.valor = valor;
        this.funcio = funcio;
        this.dataCadastro = dataCadastro;

    }
    public Produto(String nome, int codigo, String tipo, int quantidade, String descricao, double valor, String funcio, Date dataCadastro, int idFilial) {

        this.nome = nome;
        this.codigo = codigo;
        this.tipo = tipo;
        this.quantidade = quantidade;
        this.descricao = descricao;
        this.valor = valor;
        this.funcio = funcio;
        this.dataCadastro = dataCadastro;
        this.idFilial = idFilial;

    }

    // Construtores para gerar relatórios de exclusão
    public Produto(int id, String nome, int quantidade, double valor, String funcio, Date dataExclusao) {
        this.id = id;
        this.nome = nome;
        this.quantidade = quantidade;
        this.valor = valor;
        this.funcio = funcio;
        this.dataExclusao = dataExclusao;
    }

    public Produto(String nome, int quantidade, double valor, String funcio, Date dataExclusao) {
        this.nome = nome;
        this.quantidade = quantidade;
        this.valor = valor;
        this.funcio = funcio;
        this.dataExclusao = dataExclusao;
    }

    public Produto(int id, String nome, int codigo, double valor, int quantidade, String tipo, String descricao) {
        this.id = id;
        this.nome = nome;
        this.codigo = codigo;
        this.valor = valor;
        this.quantidade = quantidade;
        this.tipo = tipo;
        this.descricao = descricao;
    }
    public Produto(int id, String nome, double valor, int quantidade, String tipo, String descricao) {
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.quantidade = quantidade;
        this.tipo = tipo;
        this.descricao = descricao;
    }

    //Construtor da Classe
    public Produto(Produto produto) {
        this.id = produto.id;
        this.nome = produto.nome;
        this.codigo = produto.codigo;
        this.valor = produto.valor;
        this.quantidade = produto.quantidade;
        this.tipo = produto.tipo;
        this.descricao = produto.descricao;
    }

      public Produto(int id, String nome, String tipo, int quantidade, double valor) {
        this.id = id;
        this.nome = nome;
        this.tipo = tipo;

        this.quantidade = quantidade;
        this.valor = valor;

    }
    
    public String getFuncio() {
        return funcio;
    }

    public void setFuncio(String funcio) {
        this.funcio = funcio;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Date getDataExclusao() {
        return dataExclusao;
    }

    public void setDataExclusao(Date dataExclusao) {
        this.dataExclusao = dataExclusao;
    }

    public int getIdFilial() {
        return idFilial;
    }

    public void setIdFilial(int idFilial) {
        this.idFilial = idFilial;
    }
    

}
