create database Exercicios01;
use Exercicios01;
create table VENDEDOR(
nrvendedor tinyint not null primary key,
nomevendedor varchar(60) not null,
idade tinyint not null,
salario double(10,2) not null
);

create table PEDIDO(
nr_pedido tinyint not null primary key,
nrvendedor tinyint not null,
nrcliente tinyint not null,
quantidade_itens tinyint not null,
valor_total double(10,2) not null,
foreign key(nrcliente) references CLIENTE(nrcliente),
foreign key(nrvendedor) references VENDEDOR(nrvendedor)
);

create table CLIENTE(
nrcliente tinyint not null primary key,
nomecliente varchar(60) not null,
cidade varchar(120) not null,
tipo varchar(60) not null
);

-- Inserts for VENDEDOR table
INSERT INTO VENDEDOR (nrvendedor, nomevendedor, idade, salario) VALUES
(1, 'John Doe', 30, 50000.00),
(2, 'Jane Smith', 28, 48000.50),
(3, 'Robert Johnson', 35, 55000.75),
(4, 'Mary White', 25, 46000.25),
(5, 'Michael Brown', 40, 60000.00);
update VENDEDOR
set nomevendedor = "João"
where nrvendedor = 4;
-- Vendedores sem pedidos
INSERT INTO VENDEDOR (nrvendedor, nomevendedor, idade, salario) VALUES
(6, 'Emily Green', 28, 48000.50),
(7, 'Daniel Lee', 33, 52000.25),
(8, 'Sophia Turner', 29, 49000.75),
(9, 'William Clark', 31, 51000.00),
(10, 'Olivia Davis', 26, 47000.50);


-- Inserts for CLIENTE table
INSERT INTO CLIENTE (nrcliente, nomecliente, cidade, tipo) VALUES
(1, 'Customer1', 'City1', 'TypeA'),
(2, 'Customer2', 'City2', 'TypeB'),
(3, 'Customer3', 'City3', 'TypeC'),
(4, 'Customer4', 'City4', 'TypeA'),
(5, 'Customer5', 'City5', 'TypeB');
update CLIENTE
set tipo = "Indústria"
where nrcliente = 1;


-- Inserts for PEDIDO table
INSERT INTO PEDIDO (nr_pedido, nrvendedor, nrcliente, quantidade_itens, valor_total) VALUES
(1, 1, 1, 5, 200.50),
(2, 2, 3, 3, 150.75),
(3, 3, 2, 8, 300.00),
(4, 4, 4, 6, 250.25),
(5, 5, 5, 4, 180.50);
select nomevendedor from VENDEDOR;

SELECT
    VENDEDOR.nrvendedor FROM PEDIDO
INNER JOIN
  VENDEDOR on PEDIDO.nrcliente = VENDEDOR.nrvendedor;
  
  select VENDEDOR.nomevendedor
  from 
  VENDEDOR
  join
  PEDIDO ON VENDEDOR.nrvendedor = PEDIDO.nrvendedor
  join
  CLIENTE ON PEDIDO.nrcliente = CLIENTE.nrcliente
  where
  CLIENTE.tipo = "Indústria";
  
  -- selecionar tipo to cliente que foi atendido pelo vendedor João
  select CLIENTE.tipo
  from CLIENTE
  join
  PEDIDO on CLIENTE.nrcliente = PEDIDO.nrcliente
  join
  VENDEDOR on PEDIDO.nrvendedor = VENDEDOR.nrvendedor
  where
  VENDEDOR.nomevendedor = "João";
  
  select CLIENTE.nomecliente, CLIENTE.tipo
  from CLIENTE
  join PEDIDO on CLIENTE.nrcliente = PEDIDO.nrcliente
  where
  PEDIDO.valor_total > 180;
  
  
  
  
  create table ALUNO(
  aluno_id tinyint not null primary key,
nome varchar(60) not null,
curso varchar(60) not null,
nível tinyint not null,
idade tinyint not null
);
create table TURMA(
  turma_id tinyint not null primary key,
nometurma varchar(60) not null,
sala tinyint not null,
horário time not null
);

create table MATRICULA(
matricula_id tinyint not null primary key,
aluno_id tinyint not null,
turma_id tinyint not null,
nota_1 tinyint not null,
nota_2 tinyint not null,
nota_3 tinyint not null,
nota_final tinyint not null,
numerofaltas tinyint not null
);
alter table MATRICULA
modify column turma_id tinyint,
modify column nota_1 tinyint,
modify column nota_2 tinyint,
modify column nota_3 tinyint,
modify column nota_final tinyint,
modify column numerofaltas tinyint;
-- Inserções na tabela ALUNO
INSERT INTO ALUNO (aluno_id, nome, curso, nível, idade) VALUES
(1, 'João Silva', 'Engenharia', 1, 20),
(2, 'Maria Oliveira', 'Medicina', 2, 22),
(3, 'Carlos Santos', 'Administração', 1, 21),
(4, 'Ana Pereira', 'Ciência da Computação', 3, 23),
(5, 'Lucas Rodrigues', 'Direito', 2, 22);

-- Inserções na tabela TURMA
INSERT INTO TURMA (turma_id, nometurma, sala, horário) VALUES
(1, 'Turma A', 101, '08:00:00'),
(2, 'Turma B', 102, '10:30:00'),
(3, 'Turma C', 103, '14:00:00'),
(4, 'Turma D', 104, '16:30:00'),
(5, 'Turma E', 105, '19:00:00');

-- Inserções na tabela MATRICULA
INSERT INTO MATRICULA (matricula_id, aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, numerofaltas) VALUES
(1, 1, null, null, null, null, null, null),
(2, 2, 2, 90, 85, 88, 87, 1),
(3, 3, 3, 75, 80, 78, 76, 3),
(4, 4, 4, 95, 92, 90, 93, 0),
(5, 5, 5, 88, 86, 89, 87, 1);

INSERT INTO ALUNO (aluno_id, nome, curso, nível, idade) VALUES
(6, 'MEDINHO', 'Engenharia', 2, 28);
INSERT INTO TURMA (turma_id, nometurma, sala, horário) VALUES
(6, 'Turma do MEDINHO', 30, '08:00:00');
INSERT INTO MATRICULA (matricula_id, aluno_id, turma_id, nota_1, nota_2, nota_3, nota_final, numerofaltas) VALUES
(6, 6, 6, 90, 70, 85, 82, 0);


-- Adicionando chave estrangeira para aluno_id
ALTER TABLE MATRICULA
ADD CONSTRAINT fk_aluno
FOREIGN KEY (aluno_id) 
REFERENCES ALUNO(aluno_id);

-- Adicionando chave estrangeira para turma_id
ALTER TABLE MATRICULA
ADD CONSTRAINT fk_turma
FOREIGN KEY (turma_id) 
REFERENCES TURMA(turma_id);
-- 1
select nome from ALUNO;

-- 2
select MATRICULA.matricula_id from MATRICULA
inner join ALUNO on MATRICULA.aluno_id = ALUNO.aluno_id;

-- 3
select MATRICULA.matricula_id from MATRICULA
inner join ALUNO on MATRICULA.aluno_id = ALUNO.aluno_id
where MATRICULA.turma_id is null;

-- 4
select ALUNO.aluno_id from ALUNO
 join MATRICULA on ALUNO.aluno_id = MATRICULA.aluno_id
 join TURMA on MATRICULA.turma_id = TURMA.turma_id
where TURMA.sala = 30;

-- 5
select TURMA.horário from TURMA
join MATRICULA on TURMA.turma_id = MATRICULA.turma_id
join ALUNO on MATRICULA.aluno_id = ALUNO.aluno_id
where ALUNO.nome = "MEDINHO";


-- 6
select ALUNO.nome from ALUNO
join MATRICULA on ALUNO.aluno_id = MATRICULA.aluno_id
join TURMA on MATRICULA.turma_id = TURMA.turma_id
where TURMA.sala = 30;

-- 7
select ALUNO.nome from ALUNO
join MATRICULA on ALUNO.aluno_id = MATRICULA.aluno_id
join TURMA ON MATRICULA.turma_id = TURMA.turma_id
where TURMA.sala != 30;

-- 8 
select TURMA.nometurma from TURMA
join MATRICULA ON TURMA.turma_id = MATRICULA.turma_id
join ALUNO ON MATRICULA.aluno_id = ALUNO.aluno_id
where MATRICULA.nota_final >= 80;










 
  
  
  
