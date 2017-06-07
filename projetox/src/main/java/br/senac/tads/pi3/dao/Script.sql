/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  vinicius.fbatista1
 * Created: 24/04/2017
 */

create table Produto(
    idProduto INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
 CONSTRAINT PK_Produto PRIMARY KEY,
    nomeProduto VARCHAR(50) NOT NULL,
    codigo INT NOT NULL UNIQUE,
    tipoProduto VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    descricao VARCHAR(255),
    valorProduto DOUBLE NOT NULL,
    cadastradoPor VARCHAR(50) NOT NULL,
    dataCadastro TIMESTAMP NOT NULL,
    disponivel BOOLEAN NOT NULL,
    idFilial INT NOT NULL,
    FOREIGN KEY (idFilial) REFERENCES Filial (idFilial)
  
);

create table Cliente (
    idCliente INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
 CONSTRAINT PK_Cliente PRIMARY KEY,
    nomeCliente VARCHAR(50) NOT NULL,
    sobrenomeCliente VARCHAR(50) NOT NULL,
    dataNasc DATE NOT NULL,
    cpfCliente VARCHAR(14) NOT NULL UNIQUE,
    emailCliente VARCHAR(50) NOT NULL,
    telefoneCliente VARCHAR(14) NOT NULL,
    estadoCliente VARCHAR(50),
    cidadeCliente VARCHAR(50),
    enderecoCliente VARCHAR(50),
    generoCliente VARCHAR(50)
);

create table Funcionario (
  idFuncionario INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
 CONSTRAINT PK_Funcionario PRIMARY KEY,
  nomeFuncionario VARCHAR(50) NOT NULL,
  sobrenomeFuncionario VARCHAR(50) NOT NULL,
  dataNasc DATE NOT NULL,
  cpfFuncionario VARCHAR(14) NOT NULL UNIQUE,
  emailFuncionario VARCHAR(50) NOT NULL,
  telefoneFuncionario VARCHAR(14) NOT NULL,
  estadoFuncionario VARCHAR(50),
  cidadeFuncionario VARCHAR(50),
  cargo VARCHAR(50) NOT NULL,
  login VARCHAR(20) NOT NULL,
  senha VARCHAR(20) NOT NULL

);

CREATE TABLE Filial (
    idFilial INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
 CONSTRAINT PK_Filial PRIMARY KEY,
    nomeFilial VARCHAR(50) NOT NULL,
    estadoFilial VARCHAR(50) NOT NULL,
    cidadeFilial VARCHAR(50) NOT NULL
--   , idProduto INT NOT NULL
--   ,  FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

 create table Venda (
    idVenda INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    idCliente INT NOT NULL,
    idProduto INT NOT NULL,
    dataVenda TIMESTAMP NOT NULL,
    valorFinal DOUBLE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (valorFinal) REFERENCES Produto(Valor)
);

create table Relatorio(
    idRelatorio INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nmProduto VARCHAR(50) NOT NULL,
    nmCliente VARCHAR(50) NOT NULL,
    tipoProduto VARCHAR(50) NOT NULL
    venda TIMESTAMP NOT NULL,
    vlFinal DOUBLE NOT NULL,
    valorProduto DOUBLE NOT NULL,
    quantProduto INT NOT NULL
    FOREIGN KEY (nomeProduto) REFERENCES Produto(nomeProduto),
    FOREIGN KEY(nomeCliente) REFERENCES Cliente(nomeCliente),
    FOREIGN KEY (tipoProduto) REFERENCES Produto(tipo),
    FOREIGN KEY (venda) REFERENCES Venda(dataVenda),
    FOREIGN KEY (vlFinal) REFERENCES Venda(valorFinal),
    FOREIGN KEY(valorProduto) REFERENCES Produto(valorProduto),
    FOREIGN KEY(quantProduto) REFERENCES Produto(quantidade)
);

create table ProdutosExcluidos(
    idProduto INT NOT NULL UNIQUE,
    nomeProduto VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    valorProduto DOUBLE NOT NULL,
    excluidoPor VARCHAR(50) NOT NULL,
    dataExclusao TIMESTAMP NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);


INSERT INTO FILIAL (nomeFilial, estadoFilial, cidadeFilial) VALUES ('Filial 1', 'SP', 'SP');
INSERT INTO FILIAL (nomeFilial, estadoFilial, cidadeFilial) VALUES ('Filial 2', 'RJ', 'IPA');
INSERT INTO Produto (nomeProduto, codigo, tipoProduto, quantidade, descricao, valorProduto, CADASTRADOPOR, DATACADASTRO, disponivel, idFilial) VALUES ('Pro2dut66', 29891, 'Bolsa',  5, 'nada', 589, 'Administrador', '2017-06-03 23:16:48.113', true, 2);