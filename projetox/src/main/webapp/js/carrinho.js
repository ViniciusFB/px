/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function adicionar(produto) {

    var id = document.querySelectorAll("#idProduto");
    var campoNome = document.querySelectorAll("#nomeProduto");
    var campoCodigo = document.querySelectorAll("#codigo");
    var campoQuantidade = document.querySelectorAll("#quantidade");
    var campoValor = document.querySelectorAll("#valorProduto");

    var adc = document.querySelectorAll("#add");

    adc.addEventListener("click", function () {
        campoNome.value = produto.nome;
        campoCodigo.value = produto.codigo;
        campoQuantidade.value = produto.quantidade;
        campoValor.value = produto.valor;
    });

}
