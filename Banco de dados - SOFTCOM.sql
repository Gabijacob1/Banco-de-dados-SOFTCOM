CREATE DATABASE SOFTCOM;

USE SOFTCOM;

CREATE TABLE Funcionarios (
  Codigo INT PRIMARY KEY,
  PrimeiroNome VARCHAR(50),    
  SegundoNome VARCHAR(50), 
  UltimoNome VARCHAR(50), 
  DataNasci DATE, 
  CPF VARCHAR(14), 
  RG VARCHAR(20), 
  Endereco VARCHAR(100), 
  CEP VARCHAR(9), 
  Cidade VARCHAR(50), 
  Fone VARCHAR(20), 
  CodigoDepartamento INT, 
  Funcao VARCHAR(50), 
  Salario DECIMAL(10, 2));

INSERT INTO Funcionarios (Codigo, PrimeiroNome, SegundoNome, UltimoNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, CodigoDepartamento, Funcao, Salario) 
VALUES 
(1, 'João', 'Silva', 'Pereira', '1990-05-01', '123.456.789-10', '12.345.678-9', 'Rua A, 123', '12345-678', 'São Paulo', '(11) 1234-5678', 1, 'Gerente', 5000.00),
(2, 'Maria', 'Ferreira', 'Santos', '1995-02-10', '234.567.890-21', '23.456.789-0', 'Rua B, 456', '23456-789', 'Rio de Janeiro', '(21) 2345-6789', 2, 'Analista', 3500.00),
(3, 'Pedro', 'Almeida', 'Souza', '1985-07-15', '345.678.901-32', '34.567.890-1', 'Rua C, 789', '34567-890', 'Belo Horizonte', '(31) 3456-7890', 3, 'Desenvolvedor', 4000.00),
(4, 'Ana', 'Rodrigues', 'Costa', '1998-12-03', '456.789.012-43', '45.678.901-2', 'Rua D, 101', '45678-901', 'Curitiba', '(41) 4567-8901', 4, 'Supervisor', 4500.00),
(5, 'Lucas', 'Mendes', 'Oliveira', '1987-09-20', '567.890.123-54', '56.789.012-3', 'Rua E, 202', '56789-012', 'Porto Alegre', '(51) 5678-9012', 2, 'Analista', 3500.00),
(6, 'Carla', 'Nunes', 'Ribeiro', '1993-06-18', '678.901.234-65', '67.890.123-4', 'Rua F, 303', '67890-123', 'Campinas', '(19) 6789-0123', 3, 'Desenvolvedor', 4000.00),
(7, 'Fernando', 'Lima', 'Sousa', '1980-03-11', '789.012.345-76', '78.901.234-5', 'Rua G, 404', '78901-234', 'Brasília', '(61) 7898-23-23', 2, 'Analista', 3500.00),
(8, 'Mariana', 'Nascimento', 'Costa', '1991-06-25', '654.321.987-00', '654321987', 'Rua F, 678', '67890-000', 'Fortaleza', '(85) 6789-0123', 2, 'Analista', 5000.00),
(9, 'Gustav', 'Silva', 'Lima', '1988-05-10', '321.654.987-00', '321654987', 'Rua E, 345', '56789-000', 'Curitiba', '(41) 5678-9012', 3, 'Desenvolvedor', 4800.00),
(10, 'Adriana', 'Ferreira', 'Sanches', '1991-06-25', '234.567.987-00', '657364434', 'Rua 65, 432', '67345-000', 'São Paulo', '(11) 2435-6789', 2, 'Analista', 5000.00);


CREATE TABLE Departamentos (
   Codigo INT PRIMARY KEY,   
   Nome VARCHAR(50),   
   Localizacao VARCHAR(50),   
   CodigoFuncionarioGerente INT );

INSERT INTO Departamentos VALUES 
(1, 'Gerente', 'São Paulo', 3),
(2, 'Analista', 'Rio de Janeiro', 5),
(3, 'Desenvolvedor', 'Belo Horizonte', 7),
(4, 'Supervisor', 'Salvador', 2);
 
 select PrimeiroNome, SegundoNome, UltimoNome
 from Funcionarios 
 order by UltimoNome;
 
 select * 
from funcionarios
order by Cidade;


select PrimeiroNome, SegundoNome, UltimoNome, salario from Funcionarios
where salario > 1000;

select PrimeiroNome, DataNasci from funcionarios order by DataNasci asc;

select  PrimeiroNome, Fone from funcionarios order by PrimeiroNome;

select sum( Salario)
as folha_pagamento
from funcionarios;

select  PrimeiroNome, SegundoNome, concat('$', ROUND (salario / 5.4, 2))
as salario_em_dolar
from funcionarios; 

select UltimoNome,PrimeiroNome, SegundoNome, Fone, Endereco, Cidade 
from funcionarios
 order by PrimeiroNome, SegundoNome, UltimoNome;

select count(Codigo) 
as quantidade_Funcionarios 
from Funcionarios;

select cidade, avg(salario)
as salario_medio
from Funcionarios
group by Cidade 
having salario_medio > 4000;

select  avg(salario)
as salario_medio_empresa
from Funcionarios;

select funcao, avg(salario)
as salario_medio_funcao
from Funcionarios
group by funcao;

select PrimeiroNome, SegundoNome, cidade, funcao
from Funcionarios
where cidade = "São Paulo";

select PrimeiroNome, SegundoNome, cidade, funcao
from Funcionarios
where funcao = "gerente";

select PrimeiroNome, SegundoNome, salario, funcao
from Funcionarios
where funcao = "desenvolvedor";

select PrimeiroNome, SegundoNome, salario, funcao
from Funcionarios
where funcao = "analista" and salario > 4000;
