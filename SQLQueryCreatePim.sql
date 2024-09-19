--SCRIPT CRIAÇÃO DAS TABELAS



CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    idEndereco INT,
    cpf VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY IDENTITY(1,1),
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    idCidade INT
);

CREATE TABLE Cidade (
    idCidade INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    idUF INT
);

CREATE TABLE UF (
    idUF INT PRIMARY KEY IDENTITY(1,1),
    sigla VARCHAR(2) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Pet (
    idPet INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE,
    idRaca INT,
    idCliente INT
);

CREATE TABLE Especie (
    idEspecie INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Raca (
    idRaca INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    idEspecie INT
);

CREATE TABLE Patologia (
    idPatologia INT PRIMARY KEY IDENTITY(1,1),
    descricao VARCHAR(200) NOT NULL,
    idTipo INT NOT NULL
);

CREATE TABLE TipoPatologia (
    idTipo INT PRIMARY KEY IDENTITY(1,1),
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE Vacina (
    idVacina INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200)
);

CREATE TABLE PetVacina (
    idPetVacina INT PRIMARY KEY IDENTITY(1,1),
    idPet INT,
    idVacina INT,
    dataAplicacao DATE
);

CREATE TABLE Veterinario (
    idVeterinario INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    idEspecialidade INT
);

CREATE TABLE Especialidade (
    idEspecialidade INT PRIMARY KEY IDENTITY(1,1),
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE Clinica (
    idClinica INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    idEndereco INT
);

CREATE TABLE VetClinica (
    idVetClinica INT PRIMARY KEY IDENTITY(1,1),
    idVeterinario INT,
    idClinica INT
);

CREATE TABLE VetEspecialidade (
    idVetEspecialidade INT PRIMARY KEY IDENTITY(1,1),
    idVeterinario INT,
    idEspecialidade INT
);


--QUERY PARA ADICIONAR UMA COLUNA NOVA, OBS: RODAR SEPARADO


ALTER TABLE Vacina ADD periodicidade VARCHAR(20);