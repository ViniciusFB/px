package br.senac.tads.pi3.models;

/**
 *
 * @author danilo.kwatanabe
 */
public class Filial {

    private int id;
    private String nome;
    private String estado;
    private String cidade;

    public Filial() {
    }

    public Filial(int id, String nome, String estado, String cidade) {
        this.id = id;
        this.nome = nome;
        this.estado = estado;
        this.cidade = cidade;
    }

    public Filial(String nome, String estado, String cidade) {
        this.nome = nome;
        this.estado = estado;
        this.cidade = cidade;
    }
    
    public Filial(Filial filial) {
        this.id = filial.id;
        this.nome = filial.nome;
        this.estado = filial.estado;
        this.cidade = filial.cidade;
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

}
