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
    telefoneCliente VARCHAR(15) NOT NULL,
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
  telefoneFuncionario VARCHAR(15) NOT NULL,
  estadoFuncionario VARCHAR(50),
  cidadeFuncionario VARCHAR(50),
  cargo VARCHAR(50) NOT NULL,
  login VARCHAR(20) NOT NULL UNIQUE,
  senha VARCHAR(20) NOT NULL

);

CREATE TABLE Filial (
    idFilial INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)
 CONSTRAINT PK_Filial PRIMARY KEY,
    nomeFilial VARCHAR(50) NOT NULL,
    estadoFilial VARCHAR(50) NOT NULL
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
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- create table VendaProd(
--    idVendaProd INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
--    idVenda INTEGER NOT NULL,
--    idProduto INTEGER NOT NULL,
--    nomeProduto VARCHAR(50) NOT NULL,
--    quantidade INT NOT NULL,
--    PRIMARY KEY (idVendaProd),
--    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda),
--    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
-- );

-- 
-- create table Relatorio(
--     idRelatorio INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
--     nmProduto VARCHAR(50) NOT NULL,
--     nmCliente VARCHAR(50) NOT NULL,
--     tipoProduto VARCHAR(50) NOT NULL
--     venda TIMESTAMP NOT NULL,
--     vlFinal DOUBLE NOT NULL,
--     valorProduto DOUBLE NOT NULL,
--     quantProduto INT NOT NULL
--     FOREIGN KEY (nomeProduto) REFERENCES Produto(nomeProduto),
--     FOREIGN KEY(nomeCliente) REFERENCES Cliente(nomeCliente),
--     FOREIGN KEY (tipoProduto) REFERENCES Produto(tipo),
--     FOREIGN KEY (venda) REFERENCES Venda(dataVenda),
--     FOREIGN KEY (vlFinal) REFERENCES Venda(valorFinal),
--     FOREIGN KEY(valorProduto) REFERENCES Produto(valorProduto),
--     FOREIGN KEY(quantProduto) REFERENCES Produto(quantidade)
-- );

create table ProdutosExcluidos(
    idProduto INT NOT NULL UNIQUE,
    nomeProduto VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    valorProduto DOUBLE NOT NULL,
    excluidoPor VARCHAR(50) NOT NULL,
    dataExclusao TIMESTAMP NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);


INSERT INTO FILIAL (nomeFilial, estadoFilial) VALUES ('MATRIZ SP', 'SP');
INSERT INTO FILIAL (nomeFilial, estadoFilial) VALUES ('FILIAL RECIFE', 'PE');
INSERT INTO FILIAL (nomeFilial, estadoFilial) VALUES ('FILIAL PORTO ALEGRE', 'RS');
INSERT INTO Produto (nomeProduto, codigo, tipoProduto, quantidade, descricao, valorProduto, CADASTRADOPOR, DATACADASTRO, disponivel, idFilial) VALUES ('Pro2dut66', 29891, 'Bolsa',  5, 'nada', 589, 'Administrador', '2017-06-03 23:16:48.113', true, 2);

 INSERT INTO Funcionario
(nomeFuncionario, sobrenomeFuncionario, dataNasc, cpfFuncionario, emailFuncionario,telefoneFuncionario, cargo, login, senha)
 VALUES ('Administrador', 'X', '1990-01-01' , '000.000.000-00', 'administrador@projetox.com', '(00) 0000-0000', 'Admin', 'admin', 'admin');
 INSERT INTO Funcionario
(nomeFuncionario, sobrenomeFuncionario, dataNasc, cpfFuncionario, emailFuncionario,telefoneFuncionario, cargo, login, senha)
 VALUES ('Vendedor', 'X', '1990-01-01' , '000.000.000-01', 'vendedor@projetox.com', '(00) 1111-1111', 'Vendedor', 'vendedor', 'vendedor');
 INSERT INTO Funcionario
(nomeFuncionario, sobrenomeFuncionario, dataNasc, cpfFuncionario, emailFuncionario,telefoneFuncionario, cargo, login, senha)
 VALUES ('Estoquista', 'X', '1990-01-01' , '000.000.000-02', 'estoquista@projetox.com', '(00) 2222-2222', 'Estoquista', 'estoquista', 'estoquista');
 INSERT INTO Funcionario
(nomeFuncionario, sobrenomeFuncionario, dataNasc, cpfFuncionario, emailFuncionario,telefoneFuncionario, cargo, login, senha)
 VALUES ('Gerente', 'X', '1990-01-01' , '000.000.000-03', 'gerente@projetox.com', '(00) 3333-3333', 'Gerente', 'gerente', 'gerente');