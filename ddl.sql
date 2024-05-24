/*DDL*/

create database aulaDDL;

create table TB_Pessoa(
idPessoa int primary key auto_increment,
nome varchar(50) not null,
dataNsc date not null,
cpf numeric(11) unique,
numPis varchar(20)
);

create table TB_Empregado(
idEmpregado int auto_increment primary key,
idPessoa int not null unique ,
dataAdmissao date not null,
dataDemissao date,
salario decimal(10,2),
foreign key (idPessoa) references auladdl.tb_pessoa(idPessoa)
);

insert into TB_Pessoa (nome, dataNsc, cpf, numPis) values ("CAROLINA LEONE", '2001-09-13', 03846532940, "");
SELECT * FROM TB_Pessoa;
insert into TB_Pessoa (nome, dataNsc, cpf, numPis) values ("RENATA ZOMER", '2004-11-01', 05227932905, "202145602298");

insert into TB_Empregado (idPessoa, dataAdmissao, salario) values (2, '2020-09-02', 2360.50);
SELECT * FROM TB_Empregado;

select *  from tb_pessoa  where cpf = '05227932905';

SELECT * FROM TB_PESSOA;

select *  from tb_pessoa  where cpf = '5227932905';

alter table tb_empregado add column cargo varchar(50);
alter table tb_empregado change column `cargo` `cargo` int;



ALTER TABLE `auladdl`.`tb_empregado` 
DROP FOREIGN KEY `tb_empregado_ibfk_1`;
ALTER TABLE `auladdl`.`tb_empregado` 
DROP INDEX `idPessoa` ;


drop table tb_pessoa;
