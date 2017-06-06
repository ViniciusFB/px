/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.relatorios;


import br.senac.tads.pi3.models.Produto;
import java.util.List;

/**
 *
 * @author ProjetoX
 */
public class RelatorioProduto {
    
    private List<Produto> relatorioProdutos;

    //Construtor da Classe
    public RelatorioProduto(List<Produto> relatorioProdutos) {
        this.relatorioProdutos = relatorioProdutos;
    }

    //Metodo que ira retornar o valor da variavel
    public List<Produto> getRelatorioProdutos() {
        return relatorioProdutos;
    }
    
}
