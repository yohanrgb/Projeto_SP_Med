CREATE DATABASE SP_Medical_Group

USE SP_Medical_Group

CREATE TABLE TipoUsuario
(
    idTipoUsuario    INT PRIMARY KEY IDENTITY
    ,Titulo            VARCHAR(200)
);


CREATE TABLE Usuario
(
    idUsuario			INT PRIMARY KEY IDENTITY
    ,idTipoUsusario		INT FOREIGN KEY REFERENCES TipoUsuario(idTipoUsuario)
    ,Email				VARCHAR(200) UNIQUE NOT NULL
    ,Senha				VARCHAR(200) 
);


CREATE TABLE Paciente
(
    idPaciente			INT PRIMARY KEY IDENTITY
    ,idUsuario			INT FOREIGN KEY REFERENCES Usuario(idUsuario)
    ,NomePaciente		VARCHAR(200)NOT NULL
    ,DataNascimento		DATE
    ,Telefone			VARCHAR(15)
    ,RG					VARCHAR(12) NOT NULL
    ,CPF				VARCHAR(15) NOT NULL
    ,Endere�o			VARCHAR(200) NOT NULL
);



CREATE TABLE Especialidade
(
    idEspecialidade		INT PRIMARY KEY IDENTITY
    ,Especialidade		VARCHAR(200) NOT NULL
);


CREATE TABLE Clinica
(
    idClinica			INT PRIMARY KEY IDENTITY
    ,CNPJ				VARCHAR(20) NOT NULL
    ,Endereco			VARCHAR(200) NOT NULL
    ,RazaoSocial		VARCHAR(200) NOT NULL
	,NomeFantasia		VARCHAR(200) NOT NULL
);


CREATE TABLE Medico
(
    idMedico			INT PRIMARY KEY IDENTITY
    ,idUsuario			INT FOREIGN KEY REFERENCES Usuario(idUsuario)
    ,idEspecialidade	INT FOREIGN KEY REFERENCES Especialidade(idEspecialidade)
    ,idClinica			INT FOREIGN KEY REFERENCES Clinica(idClinica)
    ,CRM				VARCHAR(15) NOT NULL
    ,NomeMedico			VARCHAR(200) NOT NULL
);


CREATE TABLE Situacao
(
    idSituacao			INT PRIMARY KEY IDENTITY
    ,Estado				VARCHAR(200) NOT NULL
);


CREATE TABLE Consulta
(
    idConsulta			INT PRIMARY KEY IDENTITY
    ,idPaciente			INT FOREIGN KEY REFERENCES Paciente(idPaciente)
    ,idMedico			INT FOREIGN KEY REFERENCES Medico(idMedico)
    ,idSituacao			INT FOREIGN KEY REFERENCES Situacao(idSituacao)
	,DataConsulta		DATETIME
);

