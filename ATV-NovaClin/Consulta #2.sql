 CREATE TABLE recepcionista(
 idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nomeRecepcionista VARCHAR(50) NOT NULL,
 loginRecepcionsita VARCHAR(20) NOT NULL,
 senha CHAR(6) NOT NULL,
 celular CHAR(11)  NULL,
 cpf CHAR(11) NOT NULL
 );
 
 
 CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cel CHAR(11) NOT NULL,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL DEFAULT 'Não informado',
tiposanguineo VARCHAR(3) NOT NULL,
doencasPreexistentes VARCHAR(255)NULL,
CONSTRAINT chk_tipoSanguineo CHECK (tipoSanguineo= 'A-' OR tipoSanguineo= 'AB+' OR tipoSanguineo= 'AB-' OR tipoSanguineo= 'B+' OR tipoSanguineo= 'B-' OR tipoSanguineo= 'O+' OR tipoSanguineo= 'O-')
);
 