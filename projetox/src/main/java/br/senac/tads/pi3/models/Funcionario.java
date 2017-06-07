/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.models;

import java.sql.Date;

/**
 *
 * @author Vinicius Ferreira Batista
 */
public class Funcionario {

    private int id;

    private String nome;
    private String sobrenome;
    private Date dataNasc;
    private String cpf;
    private String email;
    private String telefone;
    private String estado;
    private String cidade;
    private String cargo;
    private String login;
    private String senha;

    public Funcionario() {

    }

    public Funcionario(String nome, String sobrenome, Date dataNasc, String cpf, String email, String telefone, String estado, String cidade, String cargo, String login, String senha) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dataNasc = dataNasc;
        this.cpf = cpf;
        this.email = email;
        this.telefone = telefone;
        this.estado = estado;
        this.cidade = cidade;
        this.cargo = cargo;
        this.login = login;
        this.senha = senha;
    }

    public Funcionario(int id, String nome, String sobrenome, Date dataNasc, String cpf, String email, String telefone, String estado, String cidade, String cargo, String login, String senha) {
        this.id = id;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dataNasc = dataNasc;
        this.cpf = cpf;
        this.email = email;
        this.telefone = telefone;
        this.estado = estado;
        this.cidade = cidade;
        this.cargo = cargo;
        this.login = login;
        this.senha = senha;
    }
    public Funcionario(int id, String nome, String sobrenome, Date dataNasc, String cpf, String email, String telefone, String estado, String cidade, String cargo, String login) {
        this.id = id;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dataNasc = dataNasc;
        this.cpf = cpf;
        this.email = email;
        this.telefone = telefone;
        this.estado = estado;
        this.cidade = cidade;
        this.cargo = cargo;
        this.login = login;
    }
    
    public Funcionario(Funcionario funcionario) {
        this.id = funcionario.id;
        this.nome = funcionario.nome;
        this.sobrenome = funcionario.sobrenome;
        this.dataNasc = funcionario.dataNasc;
        this.cpf = funcionario.cpf;
        this.email = funcionario.email;
        this.telefone = funcionario.telefone;
        this.estado = funcionario.estado;
        this.cidade = funcionario.cidade;
        this.cargo = funcionario.cargo;
        this.login = funcionario.login;
    }

    public Funcionario(int id, String nome, String sobrenome, Date dataNasc, String cpf, String email, String telefone, String login) {
       this.id = id;
       this.nome = nome;
       this.sobrenome = sobrenome;
       this.dataNasc = dataNasc;
       this.cpf = cpf;
       this.email = email;
       this.telefone = telefone;
       this.login = login;
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

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

}
