/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.relatorios;

import br.senac.tads.pi3.models.Funcionario;
import java.util.List;

/**
 *
 * @author ProjetoX
 */
public class RelatorioFuncionario {
    
    private List<Funcionario> relatorioFuncionarios;

       //Construtor da Classe
    public RelatorioFuncionario(List<Funcionario> relatorioFuncionarios) {
        this.relatorioFuncionarios = relatorioFuncionarios;
    }

    //Metodo que ira retornar o valor da variavel
    public List<Funcionario> getRelatorioFuncionarios() {
        return relatorioFuncionarios;
    }
    
}
