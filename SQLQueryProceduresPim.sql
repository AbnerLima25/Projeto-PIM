--PROCEDURES--

-- Procedure para incluir um novo cliente
-- Recebe o nome, email, telefone, endereço e cidade do cliente
-- Verifica se a cidade já existe, se não existir, insere uma nova cidade
-- Insere o endereço do cliente
-- Insere o cliente com o endereço correspondente
CREATE PROCEDURE IncluirCliente
    @nome VARCHAR(100),
    @email VARCHAR(100),
    @telefone VARCHAR(20),
    @rua VARCHAR(100),
    @numero VARCHAR(10),
    @complemento VARCHAR(50),
    @bairro VARCHAR(50),
    @nomeCidade VARCHAR(100),
    @estadoCidade VARCHAR(2)
AS
BEGIN
    DECLARE @idCidade INT

    -- Verifica se a cidade já existe, se não existir, insere
    IF NOT EXISTS (SELECT 1 FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    BEGIN
        INSERT INTO Cidade (nome, estado) VALUES (@nomeCidade, @estadoCidade)
        SET @idCidade = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idCidade = (SELECT idCidade FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    END

    -- Insere o endereço
    INSERT INTO Endereco (rua, numero, complemento, bairro, idCidade)
    VALUES (@rua, @numero, @complemento, @bairro, @idCidade)

    DECLARE @idEndereco INT = SCOPE_IDENTITY()

    -- Insere o cliente
    INSERT INTO Cliente (nome, email, telefone, idEndereco)
    VALUES (@nome, @email, @telefone, @idEndereco)
END



-- Procedure para alterar o telefone de um cliente
-- Recebe o ID do cliente e o novo telefone
-- Atualiza o telefone do cliente com o ID fornecido
CREATE PROCEDURE AlterarTelefoneCliente
    @idCliente INT,
    @novoTelefone VARCHAR(20)
AS
BEGIN
    UPDATE Cliente
    SET telefone = @novoTelefone
    WHERE idCliente = @idCliente
END




-- Procedure para incluir uma nova raça de animal
-- Recebe o nome da raça e o nome da espécie à qual a raça pertence
-- Verifica se a espécie já existe, se não existir, insere uma nova espécie
-- Insere a raça com a espécie correspondente
CREATE PROCEDURE IncluirRaca
    @nomeRaca VARCHAR(100),
    @nomeEspecie VARCHAR(100)
AS
BEGIN
    DECLARE @idEspecie INT

    -- Verifica se a espécie já existe, se não existir, insere
    IF NOT EXISTS (SELECT 1 FROM Especie WHERE nome = @nomeEspecie)
    BEGIN
        INSERT INTO Especie (nome) VALUES (@nomeEspecie)
        SET @idEspecie = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idEspecie = (SELECT idEspecie FROM Especie WHERE nome = @nomeEspecie)
    END

    -- Insere a raça
    INSERT INTO Raca (nome, idEspecie)
    VALUES (@nomeRaca, @idEspecie)
END





--ATUALIZADAS ABAIXO--

-- PROCEDURES --

-- Procedure para incluir um novo cliente
-- Recebe o nome, email, telefone, endereço e cidade do cliente
-- Verifica se a cidade já existe, se não existir, insere uma nova cidade
-- Insere o endereço do cliente
-- Insere o cliente com o endereço correspondente
CREATE PROCEDURE IncluirCliente
    @nome VARCHAR(100),
    @email VARCHAR(100),
    @telefone VARCHAR(20),
    @rua VARCHAR(100),
    @numero VARCHAR(10),
    @complemento VARCHAR(50),
    @bairro VARCHAR(50),
    @nomeCidade VARCHAR(100),
    @estadoCidade VARCHAR(2)
AS
BEGIN
    -- Verificação de campos obrigatórios
    IF @nome IS NULL OR @nome = '' OR @email IS NULL OR @email = '' 
    OR @telefone IS NULL OR @telefone = '' OR @rua IS NULL OR @rua = '' 
    OR @numero IS NULL OR @numero = '' OR @bairro IS NULL OR @bairro = '' 
    OR @nomeCidade IS NULL OR @nomeCidade = '' OR @estadoCidade IS NULL OR @estadoCidade = ''
    BEGIN
        RAISERROR ('Todos os campos obrigatórios devem ser preenchidos.', 16, 1)
        RETURN
    END

    DECLARE @idCidade INT

    -- Verifica se a cidade já existe, se não existir, insere
    IF NOT EXISTS (SELECT 1 FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    BEGIN
        INSERT INTO Cidade (nome, estado) VALUES (@nomeCidade, @estadoCidade)
        SET @idCidade = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idCidade = (SELECT idCidade FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    END

    -- Insere o endereço
    INSERT INTO Endereco (rua, numero, complemento, bairro, idCidade)
    VALUES (@rua, @numero, @complemento, @bairro, @idCidade)

    DECLARE @idEndereco INT = SCOPE_IDENTITY()

    -- Insere o cliente
    INSERT INTO Cliente (nome, email, telefone, idEndereco)
    VALUES (@nome, @email, @telefone, @idEndereco)
END


-- Procedure para alterar o telefone de um cliente
-- Recebe o ID do cliente e o novo telefone
-- Atualiza o telefone do cliente com o ID fornecido
CREATE PROCEDURE AlterarTelefoneCliente
    @idCliente INT,
    @novoTelefone VARCHAR(20)
AS
BEGIN
    -- Verificação se o ID do cliente e o novo telefone foram fornecidos
    IF @idCliente IS NULL OR @novoTelefone IS NULL OR @novoTelefone = ''
    BEGIN
        RAISERROR ('ID do cliente e o novo telefone são obrigatórios.', 16, 1)
        RETURN
    END

    -- Verificação se o cliente existe
    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE idCliente = @idCliente)
    BEGIN
        RAISERROR ('Cliente não encontrado.', 16, 1)
        RETURN
    END

    -- Atualiza o telefone do cliente
    UPDATE Cliente
    SET telefone = @novoTelefone
    WHERE idCliente = @idCliente
END


-- Procedure para incluir uma nova raça de animal
-- Recebe o nome da raça e o nome da espécie à qual a raça pertence
-- Verifica se a espécie já existe, se não existir, insere uma nova espécie
-- Insere a raça com a espécie correspondente
CREATE PROCEDURE IncluirRaca
    @nomeRaca VARCHAR(100),
    @nomeEspecie VARCHAR(100)
AS
BEGIN
    -- Verificação de campos obrigatórios
    IF @nomeRaca IS NULL OR @nomeRaca = '' OR @nomeEspecie IS NULL OR @nomeEspecie = ''
    BEGIN
        RAISERROR ('Nome da raça e nome da espécie são obrigatórios.', 16, 1)
        RETURN
    END

    DECLARE @idEspecie INT

    -- Verifica se a espécie já existe, se não existir, insere
    IF NOT EXISTS (SELECT 1 FROM Especie WHERE nome = @nomeEspecie)
    BEGIN
        INSERT INTO Especie (nome) VALUES (@nomeEspecie)
        SET @idEspecie = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idEspecie = (SELECT idEspecie FROM Especie WHERE nome = @nomeEspecie)
    END

    -- Insere a raça
    INSERT INTO Raca (nome, idEspecie)
    VALUES (@nomeRaca, @idEspecie)
END
