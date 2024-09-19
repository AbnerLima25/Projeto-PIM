--SELECTS DAS TABELAS--

--Lista dos pets com suas raças e espécies, e os nomes dos seus donos

SELECT Pet.nome AS NomePet,
 Raca.nome AS NomeRaca, 
Especie.nome AS NomeEspecie, 
Cliente.nome AS NomeDono 
FROM Pet 
JOIN Raca ON Pet.idRaca = Raca.idRaca 
JOIN Especie ON Raca.idEspecie = Especie.idEspecie 
JOIN Cliente ON Pet.idCliente = Cliente.idCliente;


--Lista dos veterinários com suas especialidades e as clínicas onde trabalham

SELECT Veterinario.nome AS NomeVeterinario, 
Especialidade.descricao AS Especialidade, 
Clinica.nome AS NomeClinica 
FROM Veterinario 
JOIN VetEspecialidade ON Veterinario.idVeterinario = VetEspecialidade.idVeterinario 
JOIN Especialidade ON VetEspecialidade.idEspecialidade = Especialidade.idEspecialidade 
JOIN VetClinica ON Veterinario.idVeterinario = VetClinica.idVeterinario 
JOIN Clinica ON VetClinica.idClinica = Clinica.idClinica;

--Lista de clientes com seus endereços completos e cidades


SELECT Cliente.nome AS NomeCliente, 
CONCAT(Endereco.rua, ', ', Endereco.numero, ' ', Endereco.complemento, ', ', Endereco.bairro) AS EnderecoCompleto,
Cidade.nome AS NomeCidade 
FROM Cliente 
JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco 
JOIN Cidade ON Endereco.idCidade = Cidade.idCidade;