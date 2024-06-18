 DATABASE BD_senaclin
 /*Mostrar BD*/
 SHOW DATABASES
 /*Selecionar BD*/
 USE BD_senaclin
 /*Apagar BD*/
 SHOW TABLES
 /*Criar BD*/
 CREATE DATABASE BD_senaclin
 /*Apagar BD*/
 DROP DATABASE test
 /*Criação de tabelas BD*/
 CREATE TABLE medico(
 idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nomeMedico VARCHAR(50) NOT NULL,
 loginMedico VARCHAR(50) NOT NULL,
 senha CHAR(8) NOT NULL,
 CRM CHAR(8) NOT NULL
 );
 SHOW TABLES /*mostra as tabelas do banco de dados selecionado*/
 /*DROP TABLE medico - apaga a tabela do banco de dados*/
 
 CREATE TABLE recepcionista(
 idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nomeRecepcionista VARCHAR(50) NOT NULL,
 loginREcepcionsita VARCHAR(50) NOT NULL,
 senha CHAR(8) NOT NULL,
 celular CHAR(11) NOT NULL,
 nomelougradouro VARCHAR(50) NOT NULL,
 numero VARCHAR(7) NOT NULL,
 complemento VARCHAR(10) NOT NULL,
 cep CHAR(8) NOT NULL,
 cidade VARCHAR(30) NOT NULL,
 estado CHAR(2) NOT NULL
 );

CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL DEFAULT 'Não informado',
tiposanguineo VARCHAR(3) NOT NULL,
doencasPreexistentes VARCHAR(255)NULL,
CONSTRAINT chk_tipoSanguineo CHECK (tipoSanguineo= 'A-' OR tipoSanguineo= 'AB+' OR tipoSanguineo= 'AB-' OR tipoSanguineo= 'B+' OR tipoSanguineo= 'B-' OR tipoSanguineo= 'O+' OR tipoSanguineo= 'O-')
);

CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
TipoConsulta SMALLINT DEFAULT 0,
/*0 primeira vez 1-Retorno*/
observacoes VARCHAR(255),
valor DECIMAL(7,2),
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);

/*Inserindo massa de dados*/
INSERT INTO medico(nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Olavo','olavodoctor@gamil.com','12345678','222333SP');

/*Buscando Dados*/
SELECT*FROM medico
SELECT nomeMedico,crm FROM medico

/*Alterar  ou atualizar dados8*/
UPDATE medico
SET senha='8765321',
loginMedico='olavodoctor@hotmail.com'
WHERE idMedico=1

/*Inserindo dois ou mais registros*/
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dra.Rosana','rosana@gmail.com','12345678','666333MG');
 
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Heitor','heitor@gmail.com','12345678','555333SP');
 
SELECT * FROM medico
 
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES  ('Dr.Ricardo','ricardo@gmail.com','12345678','777222MG'),
('Dr.Graziella','graziella@gmail.com','12345678','555111RJ');
 
SELECT nomeMedico,crm FROM medico /*Escolhendo algumas colunas*/
SELECT * FROM medico /*Trazendo todas as colunas*/
 
/*Insert Explícito*/
INSERT INTO medico (crm, nomeMedico,senha,loginMedico)
VALUES ('666111SP','Dra Ana Maria de novo','anamaria@gmail.com');
tem menu de contexto

/*Insert Implícito*/
INSERT	INTO medico
VALUES (6,'Dr Ana Paula','anapaula@gmail.com','11223344','121111SP');

/*Excluir Registros*/
DELETE FROM medico 
WHERE idMedico = 6


/*Buscar com Filtros*/
SELECT*FROM medico
WHERE idmedico 6

UPDATE medico
SET nomeMedico='Dra.Ana Maria de novo',
loginMedico='anamaria@gmail.com'
WHERE idMedico=6

/*Ordenando resultados de uma consulta*/
SELECT*FROM medico
ORDER BY loginMedico ASC/*Crescente*/

SELECT*FROM medico
ORDER BY loginMedico ASC/*Decrescente*/



SELECT*FROM paciente

SELECT idMedico,nomeMedico,crm FROM medico
WHERE idmedico BETWEEN 2 AND 5

/*Filtro com Like*/
SELECT nomeMedico,crm,loginMedico FROM medico
WHERE nomeMedico LIKE 'Dr An%'


/*INSERIR 03 pacientes e 03 recepcionista no BD*/
INSERT INTO paciente(idPaciente,nome,cpf,dataNascimento,email,doencasPreexistentes,tiposanguineo)
VALUES('1','Filipe Diniz','54421170801','2005-10-10 23:30','filipeDiniz@gmail.com','nc','AB+')

INSERT INTO paciente(nome,cpf,dataNascimento,email,doencasPreexistentes,tiposanguineo)
VALUES('Mariah Helena','52267890801','2007-06-23 11:30','bananinha123@gmail.com','CÂNCER','A-')

INSERT INTO paciente(nome,cpf,dataNascimento,email,doencasPreexistentes,tiposanguineo)
VALUES('Kaun Matheus','47793334401','2007-02-24 00:00','Abbysmahito@gmail.com',' Varíola','B-')

INSERT INTO recepcionista(nomeRecepcionista,loginREcepcionsita,senha,celular,nomeLougradouro,numero,complemento,cep,cidade,estado)
VALUES('Lívia Rosa','Lívinha444@gmail.com','Rosinha','13990456140','Rua Evaristo Veiga','24','ApTo','12345678','Santos','SP'),
('Arley Siaci','ArleyAugusto@gmail.com','coxinha','13994560023','Rua Carlos Gomes','192','Casa','87654321','Santos','SP'),
('Kaun Matheus','AbbysMahito@gmail.com','mahito','13993075595','Rua Alfredo Albertini','123','Casa','54321678','Santos','SP');

SELECT*FROM recepcionista



/*Inserindo Consulta*/
 INSERT INTO consulta(idMedico,idPaciente,idRecepcionista,dataHoraConsulta,TipoConsulta)
VALUES
(2,3,2,'2024-06-24 18:30',0)

SELECT*FROM consulta

INSERT INTO consulta(idMedico,idPaciente,idRecepcionista,dataHoraConsulta,TipoConsulta)
VALUES
(1,2,3,'2024-06-24 19:30',0)


CREATE TABLE paciente(
/*Exclusão Lógica*/
STATUS SMALLINT
);
UPDATE paciente
SET STATUS = 0
WHERE idPaciente = ?
