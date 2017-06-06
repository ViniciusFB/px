/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.tads.pi3.relatorios;

import br.senac.tads.pi3.models.Vendas;
import java.util.List;

/**
 *
 * @author danilo.kwatanabe
 */
public class RelatorioVenda {
    
        private List<Vendas> relatorioVendas;

    //Construtor da Classe
    public RelatorioVenda(List<Vendas> relatorioVendas) {
        this.relatorioVendas = relatorioVendas;
    }

    //Metodo que ira retornar o valor da variavel
    public List<Vendas> getRelatorioVendas() {
        return relatorioVendas;
    }
    
}
