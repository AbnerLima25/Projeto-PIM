--INSERTS DAS TABELAS


-- Alimenta��o da tabela UF
INSERT INTO UF (sigla, nome) VALUES
('SP', 'S�o Paulo'),
('RJ', 'Rio de Janeiro'),
('MG', 'Minas Gerais'),
('RS', 'Rio Grande do Sul'),
('SC', 'Santa Catarina');

-- Alimenta��o da tabela Cidade
INSERT INTO Cidade (nome, idUF) VALUES
('S�o Paulo', 1),
('Rio de Janeiro', 2),
('Belo Horizonte', 3),
('Porto Alegre', 4),
('Florian�polis', 5);

-- Alimenta��o da tabela Cliente
INSERT INTO Cliente (nome, email, telefone, idEndereco, cpf) VALUES
('Jo�o', 'joao@email.com', '11987654321', 1, '12345678901'),
('Maria', 'maria@email.com', '21987654321', 2, '23456789012'),
('Jos�', 'jose@email.com', '31987654321', 3, '34567890123'),
('Ana', 'ana@email.com', '41987654321', 4, '45678901234'),
('Carlos', 'carlos@email.com', '51987654321', 5, '56789012345');

-- Alimenta��o da tabela Endereco
INSERT INTO Endereco (rua, numero, complemento, bairro, cep, idCidade) VALUES
('Rua A', '123', 'Apto 101', 'Centro', '01000-000', 1),
('Rua B', '456', 'Casa', 'Copacabana', '22000-000', 2),
('Rua C', '789', NULL, 'Savassi', '30100-000', 3),
('Rua D', '321', 'Sala 201', 'Moinhos de Vento', '90400-000', 4),
('Rua E', '654', 'Loja 01', 'Centro', '88000-000', 5);

-- Alimenta��o da tabela Especie
INSERT INTO Especie (nome) VALUES
('Cachorro'),
('Gato'),
('P�ssaro'),
('Roedor'),
('R�ptil');

-- Alimenta��o da tabela Raca
INSERT INTO Raca (nome, idEspecie) VALUES
('Labrador', 1),
('Siames', 2),
('Can�rio', 3),
('Hamster', 4),
('Calango', 5);

-- Alimenta��o da tabela Patologia
INSERT INTO Patologia (descricao, idTipo) VALUES
('Dermatite al�rgica', 1),
('C�ncer', 2),
('Gripe', 2),
('Apendicite', 2),
('Fratura', 3);

-- Alimenta��o da tabela TipoPatologia
INSERT INTO TipoPatologia (descricao) VALUES
('Alergia'),
('Doen�a'),
('Outro');

-- Alimenta��o da tabela Vacina
INSERT INTO Vacina (nome, descricao) VALUES
('V8', 'Vacina polivalente para c�es'),
('Antirr�bica', 'Vacina contra raiva'),
('V3', 'Vacina polivalente para gatos'),
('Gripe Avi�ria', 'Vacina para aves'),
('Gripe do Rato', 'Vacina para roedores');

-- Alimenta��o da tabela Veterinario
INSERT INTO Veterinario (nome, idEspecialidade) VALUES
('Dr. Silva', 1),
('Dr. Santos', 2),
('Dr. Almeida', 3),
('Dr. Souza', 4),
('Dra. Oliveira', 5);

-- Alimenta��o da tabela Clinica
INSERT INTO Clinica (nome, idEndereco) VALUES
('Cl�nica Veterin�ria S�o Paulo', 1),
('Cl�nica Veterin�ria Rio de Janeiro', 2),
('Cl�nica Veterin�ria Belo Horizonte', 3),
('Cl�nica Veterin�ria Porto Alegre', 4),
('Cl�nica Veterin�ria Florian�polis', 5);

-- Alimenta��o da tabela PetVacina
INSERT INTO PetVacina (idPet, idVacina, dataAplicacao) VALUES
(1, 1, '2022-01-10'),
(2, 2, '2021-12-20'),
(3, 3, '2021-11-15'),
(4, 4, '2021-10-25'),
(5, 5, '2021-09-30');

-- Alimenta��o da tabela VetClinica
INSERT INTO VetClinica (idVeterinario, idClinica) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Alimenta��o da tabela VetEspecialidade
INSERT INTO VetEspecialidade (idVeterinario, idEspecialidade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Alimenta��o da tabela Pet
INSERT INTO Pet (nome, dataNascimento, idRaca, idCliente) VALUES
('Tot�', '2018-05-20', 1, 1),
('Bolinha', '2019-02-10', 2, 2),
('Pirata', '2020-07-15', 3, 3),
('Rex', '2017-11-30', 4, 4),
('Thor', '2016-09-05', 5, 5);

-- Alimenta��o da tabela Especialidade
INSERT INTO Especialidade (descricao) VALUES
('Cl�nica Geral'),
('Cirurgia'),
('Cardiologia'),
('Dermatologia'),
('Oftalmologia');