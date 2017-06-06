/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.relatorios;


import br.senac.tads.pi3.models.Cliente;
import java.util.List;

/**
 *
 * @author ProjetoX
 */
public class RelatorioCliente {
    
    private List<Cliente> relatorioClientes;

    //Construtor da Classe
    public RelatorioCliente(List<Cliente> relatorioClientes) {
        this.relatorioClientes = relatorioClientes;
    }

    //Metodo que ira retornar o valor da variavel
    public List<Cliente> getRelatorioClientes() {
        return relatorioClientes;
    }
    
}
