create database gestor_ibe;
use gestor_ibe;
create table membros_ibe(
cod int primary key auto_increment,
codigo int(11),
nome varchar(50),
nascimento varchar(8),
sexo varchar(9),
fone varchar(11),
email varchar(50),
cep varchar(8),
endereco varchar(50),
bairro varchar(50),
cidade varchar(50),
uf varchar(2),
profissao varchar(20),
escolaridade varchar(20),
estado_civil varchar(20),
conjuge varchar(50)
);