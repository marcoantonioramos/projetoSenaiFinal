create database gestor_ibe;
use gestor_ibe;
create table painel(
codigo int primary key,
nome varchar(50),
nascimento date,
sexo varchar(9),
telefone varchar(15),
email varchar(50),
endereco varchar(50),
bairro varchar(50),
cep varchar(10),
cidade varchar(50),
uf varchar(2),
profissao varchar(20),
escolaridade varchar(20),
estado_civil varchar(20),
conjuge varchar(50)
);