

create database ecommerce; 
use ecommerce; 

create table Cliente_PJ(
 IdPessoaJ int AUTO_INCREMENT,
 RazaoSocial varchar (255) not null, 
 CNPJ char(15) not null,
 Endereco varchar(255),
 Telefone varchar (45) ,
 Email varchar (255),
 primary key (IdPessoaJ)
 constraint unique_CNPJ_Cliente_PJ unique (CNPJ),
 constraint unique_RazaoSocial unique (RazaoSocial)
);

INSERT INTO Cliente_PJ (IdPessoaJ,Razao_Social,CNPJ,Endereco,Telefone,Email)
VALUES (01,'EMPRESA.1 LTDA',111111111111,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'teste.mysql@gmail.com');

INSERT INTO Cliente_PJ (IdPessoaJ,Razao_Social,CNPJ,Endereco,Telefone,Email)
VALUES (02,'EMPRESA.2 LTDA',2222222222222,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'exemplo.mysql@gmail.com');

INSERT INTO Cliente_PJ (IdPessoaJ,Razao_Social,CNPJ,Endereco,Telefone,Email)
VALUES (03,'EMPRESA.3 LTDA',333333333333,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'exemplo.mysql@gmail.com');

INSERT INTO Cliente_PJ (IdPessoaJ,Razao_Social,CNPJ,Endereco,Telefone,Email)
VALUES (04,'EMPRESA.4 LTDA',444444444444,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'exemplo.mysql@gmail.com');

create table Cliente_PF(
 IdPessoaF int primary key,
 Nome varchar (255) not null,
 CPF char(12) not null,
 Endereco varchar(255),
 Telefone varchar (45),
 Email varchar (255),
 constraint unique_CPF_Cliente_PF unique (CPF)
);

INSERT INTO Cliente_PF (IdPessoaF,Nome,CPF,Endereco,Telefone,Email)
VALUES (01,'Bruno',111111111,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'exemplo.mysql@gmail.com');

INSERT INTO Cliente_PF (IdPessoaF,Nome,CPF,Endereco,Telefone,Email)
VALUES (02,'Isabela',222222222,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'exemplo.mysql@gmail.com');

INSERT INTO Cliente_PF (IdPessoaF,Nome,CPF,Endereco,Telefone,Emai)
VALUES (03,'Jose',33333333,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'exemplo.mysql@gmail.com');

INSERT INTO Cliente_PF (IdPessoaF,Nome,CPF,Endereco,Telefone,Emai)
VALUES (04,'Marcos',444444444,'Rio de Janeiro, Bairro -  São Gomes, 245',999999999,'exemplo.mysql@gmail.com');

create table Login (
IdLogin int,
IdPessoaJ int,
IdPessoaF int,
 Usuario varchar (45),
 Senha varchar (255),
constraint unique_Usuario_Login unique (Usuario),
constraint unique_Senha_Login unique (Senha),
constraint fk_Login_IdPessoaJ foreign key (IdPessoaJ) references Cliente_PJ (IdPessoaJ),
constraint fk_Login_IdPessoaF foreign key ( IdPessoaF) references Cliente_PF (IdPessoaF)
);

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (01,NULL,0001,'Bruno','tm32547');

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (02,NULL,0002,'Isabela','em32547');

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (03,NULL,0003,'Jose','fm32547');

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (04,NULL,0004,'Joana','gm32547');

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (05,005,NULL,'EMPRESA.1','dm32547');

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (06,006,NULL,'EMPRESA.2','dm34547');

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (07,007,NULL,'EMPRESA.3','fm32547');

INSERT INTO Login (IdLogin,IdPessoaJ,IdPessoaF,Usuario,Senha)
VALUES (08,008,NULL,'EMPRESA.4','df30547');

create table Pedido (
IDPedido int,
IdPessoaJ int ,
IdPessoaF int,
primary key (IDPedido,IdPessoaJ,IdPessoaF),
PedidoStatus enum ('Cancelado','Confirmado','Em processamento') default 'Em processamento',
PedidoDescricao varchar (255),
Enviarvalor varchar (255),
pagamentodinheiro bool default 10,
constraint fk_Pedido_IdPessoaJ foreign key (IdPessoaJ) references Cliente_PJ (IdPessoaJ),
constraint fk_Pedido_IdPessoaF foreign key ( IdPessoaF) references Cliente_PF (IdPessoaF)
on update cascade 
);

Insert into Pedido (IDPedido,IdPessoaJ,IdPessoaF,PedidoStatus,PedidoDescricao,Pagamentodinheiro)
values (1,005,null,default,'compra via web',null,1),
(2,006,null,default,'compra via web',300,0),
(3,007,null,default,'compra via aplicativo',null,1),
(4,008,null,default,'compra via web',500,0),
(5,null,0001,default,'compra via aplicativo',null,1),
(6,null,0002,default,'compra via web',null,1),
(7,null,0003,default,'compra via aplicativo',250,0),
(8,null,0004,default,'compra via web',null,1)
;

create table Frete (
IdFrete int,
IDPedido int,
IdEntrega int,
 primary key (IdFrete,IDPedido, IdEntrega),
  Endereco varchar (255),
  dataEnvio date not null,
  Valor float default 10,
  constraint fk_Frete_IDPedido foreign key (IDPedido) references Pedido (IDPedido),
  constraint fk_Frete_IdEntrega foreign key (IdEntrega) references Entrega (IdEntrega)
  );
  
  insert into Frete (IdFrete,IDPedido,IdEntrega,Endereco,dataEnvio,Valor)
  values (111110,1,000001,'Rio de Janeiro',15-09-2022,25),
 (111111,2,000002,'Rio de Janeiro',15-09-2022,40),
   (111112,3,000003,'Rio de Janeiro',15-09-2022,55),
   (111113,4,000004,'Rio de Janeiro',15-09-2022,10),
  (111114,4,000004,'Rio de Janeiro',15-09-2022,45),
  (111115,6,000006,'Rio de Janeiro',15-09-2022,12),
  (111116,7,000007,'Rio de Janeiro',15-09-2022,72),
  (111117,8,000008,'Rio de Janeiro',15-09-2022,55)
  ;
  
  create table Entrega (
  IdEntrega int auto_increment primary key,
  EntregaStatus enum ('Devolvido','Entregue','A caminho') not null,
  Codigorastreio int not null
  );

insert into Entrega (IdEntrega,EntregaStatus,Codigorastreio) values 
(000001,default,000000001),
(000002,default,000000001),
(000003,default,000000001),
(000004,default,000000001),
(000005,default,000000001),
(000006,default,000000001),
(000007,default,000000001),
(000008,default,000000001)
;


  create table Formadepagamento (
    IdPessoaJ int,
    IdPessoaF  int ,
    IdFormadepagamento int,
    IdPix int,
    IdCartaodeCredito int,
    tipodepagamento enum ('Cartão','Pix'),
    limite float,
    primary key (IdPessoaJ,IdPessoaF,IdFormadepagamento),
      constraint fk_Formadepagamento_IdPessoaJ foreign key (IdPessoaJ) references Cliente_PJ (IdPessoaJ),
	  constraint fk_Formadepagamento_IdPessoaF foreign key (IdPessoaF) references Cliente_PF (IdPessoaF)
);

Insert into Formadepagamento (IdPessoaJ,IdPessoaF,IdFormadepagamento,idPix,IdCartaodeCredito,tipodepagamento,limite)
values (005,null,7,1,null,default,null),
 (006,null,6,null,2,default,null),
 (007,null,6,null,2,default,null),
 (008,null,7,1,null,default,null),
 (null,0001,7,1,null,default,null),
 (null,0002,7,1,null,default,null),
 (null,0003,6,null,2,default,null),
 (null,0004,6,null,2,default,null)
;

    create table Pix (
    IdPix int,
    IdFormadepagamento int,
    Chave varchar (255),
    primary key (IdPix,IdFormadepagamento),
    constraint fk_Pix_IdPix foreign key (IdPix) references Formadepagamento (IdPix)
    );
    
    insert into Pix (IdPessoaJ,IdPessoaF,IdPix,IdFormadepagamento,Chave) values
    (005,null,1,7,0000000001),
    (006,null,1,6,null),
    (007,null,1,6,null),
    (008,null,1,7,0000000002),
    (null,0001,1,7,0000000003),
    (null,0002,1,7,0000000004),
    (null,0003,1,6,null),
    (null,0004,1,6,null)
    ;
    
     create table CartaodeCredito (
    IdCartaodeCredito int,
    IdFormadepagamento int,
    Nomedotitular varchar (255) not null,
    CPF char (11) not null,
    Numerodocartao char (30) not null, 
    Datadevalidade date not null, 
    Codigodevalidacao char (3),
    primary key (IdCartaodeCredito,IdFormadepagamento),
     constraint unique_Numerodocartao_CartaodeCredito unique (Numerodocartao),
     constraint unique_Datadevalidade_CartaodeCredito unique (Datadevalidade),
     constraint unique_Codigodevalidacao_CartaodeCredito unique (Codigodevalidacao),
    constraint unique_CPF_CartaodeCredito unique (CPF),
  constraint fk_CartaodeCredito_IdCartaodeCredito foreign key (IdCartaodeCredito) references Formadepagamento (IdCartaodeCredito)
    );
    
    insert into CartaodeCredito (IdPessoaJ,IdPessoaF,IdCartaodeCredito,IdFormadepagamento,Nomedotitular,CPF,Numerodocartao,Datadevalidade,Codigodevalidacao) values 
(005,null,null,7,null,null,null,null),
(006,null,2,6,'Carlos Magalhaes (EMPRESA.2)',11111111111,5462-9573-0445-3716,20-11-2027,457),
(007,null,2,6,'José Gonçalves (EMPRESA.3)',222222222222,5462-9573-0445-5478,11-10-2029,254),
(008,null,null,7,null,null,null,null),
(null,0001,null,7,null,null,null,null),
(null,0002,null,7,null,null,null,null),
(null,0003,2,6,'Mastercard',7,'Jose',333333333,5462-9573-0445-5778,20-11-2027,687),
(null,0004,2,6,'Mastercard',7,'Joanal',444444444,5462-9573-0445-4578,09-09-2029,124)
;

create table relacaoprodutopedido (
IDPedido int,
Idproduto int,
primary key (IDPedido,IdProduto),
Quantidade int default 1,
constraint fk_relacaoprodutopedido_IDPedido  foreign key (IDPedido) references Pedido (IDPedido),
constraint fk_relacaoprodutopedido_Idproduto foreign key (Idproduto) references Produto (Idproduto)
); 

insert into relacaoprodutopedido (IDPedido,Idproduto,Quantidade) values
(1,'Headset Gamer',5),
(2,'Max Steel',1),
(3,'Arroz',3),
(4,'Micro-ondas',1),
(5,'Guarda-Roupas',1),
(6,'Lavadora',1),
(7,'Cooktop a Gás',1),
(7,'Feijão',1)
;

Create table Produto (
Idproduto int auto_increment primary key, 
classificacaokids bool,
categoria enum ('Eletrônico','Vestimenta','Brinquedo','Alimentos','Eletrodomésticos','Móveis') not null,
avaliacao float default 0,
size varchar (10),
Descricao varchar (255)
);

insert into Produto (Idproduto,Classificacaokids,categoria,avaliacao,size) values
('Headset Gamer',false,'Eletrônico','5',null),
('Max Steel',true,'Brinquedo','4',null),
('Arroz',false,'Alimento','5',null),
('Micro-ondas',false,'Eletrôdomésticos','5',null),
('Guarda-Roupas',false,'Móveis','3',null),
('Lavadora',false,'Eletrôdomésticos','4',null),
('Cooktop a Gás',false,'Eletrôdomésticos','4',null),
('Feijão',false,'Alimento','5',null)
;

Create table Estoque (
idEstoque int auto_increment primary key,
Localidade varchar (255),
Quantidade int default 0
);

insert into Estoque (idEstoque,Localidade,Quantidade) values (
(0000000001,'Rio de Janeiro', 14),
(000000002,'Rio de Janeiro', 6),
(000000003,'Rio de Janeiro', 4),
(000000004,'Rio de Janeiro', 2),
(000000005,'Rio de Janeiro', 20),
(000000006,'Rio de Janeiro', 17),
(000000007,'Rio de Janeiro', 16),
(000000008,'Rio de Janeiro', 12)
);

create table DisponibilidadeEstoque (
IdProduto int,
IdEstoque int,
primary key (IdProduto,IdEstoque),
Quantidade int default 0,
constraint fk_DisponibilidadeEstoque_IdProduto  foreign key (IdProduto) references Produto (IdProduto),
constraint fk_DisponibilidadeEstoque_IdEstoque  foreign key (IdEstoque) references Estoque (IdEstoque)
);

insert into DisponibilidadeEstoque(IdProduto,IdEstoque,Quantidade) values 
('Headset Gamer',0000000001,14),
('Max Steel',000000002,6),
('Arroz',0000000003,4),
('Micro-ondas',0000000004,2),
('Guarda-Roupas',0000000005,20),
('Lavadora',0000000006,17),
('Cooktop a Gás',0000000007,16),
('Feijão',0000000008,12)
;

Create table fornecedordisponibilizandoproduto (
IdFornecedor int,
IdProduto int,
Quantidade int default 1,
primary key (IdFornecedor,IdProduto),
constraint fk_fornecedordisponibilizandoproduto_IdFornecedor foreign key (IdFornecedor) references Fornecedor (IdFornecedor),
constraint fk_fornecedordisponibilizandoproduto_IdProduto  foreign key (IdProduto) references Produto (IdProduto)
);

insert into fornecedordisponibilizandoproduto (Idfornecedor,Idproduto,Quantidade) values (
('Fornecedora X', 'Headset Gamer', 50),
('Fornecedora X', 'Max Steel', 75),
('Fornecedora X', 'Arroz', 100),
('Fornecedora X', 'Micro-ondas', 30),
('Fornecedora X','Guarda-Roupas', 15),
('Fornecedora X', 'Lavadora', 8),
('Fornecedora X','Cooktop a Gás', 10),
('Fornecedora X','Feijão', 100)
);
Create table Fornecedor (
Idfornecedor int auto_increment primary key,
RazaoSocial varchar (255) not null,
CNPJ char (15) not null,
Contato char (11) not null,
constraint unique_CNPJ unique (CNPJ)
);

insert into Fornecedor (Idfornecedor,RazaoSocial,CNPJ,Contato) values
('Fornecedora X','Aleatório LTDA',124578945102145,21999999999);

Create table Terceirovendedor (
Idterceirovendedor int primary key,
Razaosocial varchar (255),
CNPJ char (15) not null,
CPF char (11) not null, 
Contato char (11) not null, 
Localidade varchar (255),
constraint unique_CPF_Terceirovendedor unique (CPF),
constraint unique_CNPJ_Terceirovendedor unique (CNPJ)
);

insert into Terceirovendedor (Idterceirovendedor,Razaosocial,CNPJ,CPF,Contato,Localidade) values 
('EcommercePrime','Ecommerce LTDA',124579845712467,12457945714,21999874512,'Rio de Janeiro')
;

Create table Produtosporvendedor (
IdVendedorterceiro int,
IdProduto int,
Quantidade int default 1,
primary key (IdVendedorterceiro,IdProduto),
constraint fk_Produtosporvendedor_Idterceirovendedoro foreign key (Idterceirovendedor) references Terceirovendedor (Idterceirovendedor),
constraint fk_Produtosporvendedor_IdProduto  foreign key (IdProduto) references Produto (IdProduto)
);

insert into Produtosporvendedor (IdVendedorterceiro,IdProduto,Quantidade) values
 ('EcommercePrime','Headset Gamer',2),
 ('EcommercePrime','Max Steel',5),
 ('EcommercePrime','Arroz',10),
 ('EcommercePrime','Micro-ondas',7),
 ('EcommercePrime','Guarda-Roupas',3),
 ('EcommercePrime','Lavadora',4),
 ('EcommercePrime','Cooktop a Gás',8),
 ('EcommercePrime','Feijão',11) ;
 
 -----------------------------------------------------------------------------------------
 SELECT * FROM Cliente_PF;
 
 SELECT DISTINCT * FROM Cliente_PF
 
SELECT DISTINCT  IdPessoaJ, RazaoSocial
FROM Cliente_PJ
WHERE RazaoSocial IN ('3')

SELECT DISTINCT  IdPessoaJ, RazaoSocial
FROM Cliente_PJ
WHERE RazaoSocial LIKE '%LTDA%'

SELECT * FROM Cliente_PJ ORDER BY RazaoSocial ASC  
SELECT * FROM Cliente_PJ ORDER BY IdPessoaJ DESC 

SELECT COUNT (IdPessoaF), Nome
FROM Cliente_PF
GROUP BY Nome
HAVING COUNT (IdPessoaF) > 02;

SELECT * FROM Cliente_PF
WHERE Nome='Jose';

SELECT Estoque.idEstoque,DisponibilidadeEstoque.idPProduto,Estoque.Quantidade
FROM Estoque
INNER JOIN DisponibilidadeEstoque
ON Estoque.idEstoque=DisponibilidadeEstoque.idPProduto;



 
 
 

