/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function limparCampos() {
    
    var ipts = document.querySelectorAll(".form-control");
    
    for (i of ipts) {
        i.value="";
    }
    
}