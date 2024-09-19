--PROCEDURES--

-- Procedure para incluir um novo cliente
-- Recebe o nome, email, telefone, endere�o e cidade do cliente
-- Verifica se a cidade j� existe, se n�o existir, insere uma nova cidade
-- Insere o endere�o do cliente
-- Insere o cliente com o endere�o correspondente
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

    -- Verifica se a cidade j� existe, se n�o existir, insere
    IF NOT EXISTS (SELECT 1 FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    BEGIN
        INSERT INTO Cidade (nome, estado) VALUES (@nomeCidade, @estadoCidade)
        SET @idCidade = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idCidade = (SELECT idCidade FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    END

    -- Insere o endere�o
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




-- Procedure para incluir uma nova ra�a de animal
-- Recebe o nome da ra�a e o nome da esp�cie � qual a ra�a pertence
-- Verifica se a esp�cie j� existe, se n�o existir, insere uma nova esp�cie
-- Insere a ra�a com a esp�cie correspondente
CREATE PROCEDURE IncluirRaca
    @nomeRaca VARCHAR(100),
    @nomeEspecie VARCHAR(100)
AS
BEGIN
    DECLARE @idEspecie INT

    -- Verifica se a esp�cie j� existe, se n�o existir, insere
    IF NOT EXISTS (SELECT 1 FROM Especie WHERE nome = @nomeEspecie)
    BEGIN
        INSERT INTO Especie (nome) VALUES (@nomeEspecie)
        SET @idEspecie = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idEspecie = (SELECT idEspecie FROM Especie WHERE nome = @nomeEspecie)
    END

    -- Insere a ra�a
    INSERT INTO Raca (nome, idEspecie)
    VALUES (@nomeRaca, @idEspecie)
END





--ATUALIZADAS ABAIXO--

-- PROCEDURES --

-- Procedure para incluir um novo cliente
-- Recebe o nome, email, telefone, endere�o e cidade do cliente
-- Verifica se a cidade j� existe, se n�o existir, insere uma nova cidade
-- Insere o endere�o do cliente
-- Insere o cliente com o endere�o correspondente
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
    -- Verifica��o de campos obrigat�rios
    IF @nome IS NULL OR @nome = '' OR @email IS NULL OR @email = '' 
    OR @telefone IS NULL OR @telefone = '' OR @rua IS NULL OR @rua = '' 
    OR @numero IS NULL OR @numero = '' OR @bairro IS NULL OR @bairro = '' 
    OR @nomeCidade IS NULL OR @nomeCidade = '' OR @estadoCidade IS NULL OR @estadoCidade = ''
    BEGIN
        RAISERROR ('Todos os campos obrigat�rios devem ser preenchidos.', 16, 1)
        RETURN
    END

    DECLARE @idCidade INT

    -- Verifica se a cidade j� existe, se n�o existir, insere
    IF NOT EXISTS (SELECT 1 FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    BEGIN
        INSERT INTO Cidade (nome, estado) VALUES (@nomeCidade, @estadoCidade)
        SET @idCidade = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idCidade = (SELECT idCidade FROM Cidade WHERE nome = @nomeCidade AND estado = @estadoCidade)
    END

    -- Insere o endere�o
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
    -- Verifica��o se o ID do cliente e o novo telefone foram fornecidos
    IF @idCliente IS NULL OR @novoTelefone IS NULL OR @novoTelefone = ''
    BEGIN
        RAISERROR ('ID do cliente e o novo telefone s�o obrigat�rios.', 16, 1)
        RETURN
    END

    -- Verifica��o se o cliente existe
    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE idCliente = @idCliente)
    BEGIN
        RAISERROR ('Cliente n�o encontrado.', 16, 1)
        RETURN
    END

    -- Atualiza o telefone do cliente
    UPDATE Cliente
    SET telefone = @novoTelefone
    WHERE idCliente = @idCliente
END


-- Procedure para incluir uma nova ra�a de animal
-- Recebe o nome da ra�a e o nome da esp�cie � qual a ra�a pertence
-- Verifica se a esp�cie j� existe, se n�o existir, insere uma nova esp�cie
-- Insere a ra�a com a esp�cie correspondente
CREATE PROCEDURE IncluirRaca
    @nomeRaca VARCHAR(100),
    @nomeEspecie VARCHAR(100)
AS
BEGIN
    -- Verifica��o de campos obrigat�rios
    IF @nomeRaca IS NULL OR @nomeRaca = '' OR @nomeEspecie IS NULL OR @nomeEspecie = ''
    BEGIN
        RAISERROR ('Nome da ra�a e nome da esp�cie s�o obrigat�rios.', 16, 1)
        RETURN
    END

    DECLARE @idEspecie INT

    -- Verifica se a esp�cie j� existe, se n�o existir, insere
    IF NOT EXISTS (SELECT 1 FROM Especie WHERE nome = @nomeEspecie)
    BEGIN
        INSERT INTO Especie (nome) VALUES (@nomeEspecie)
        SET @idEspecie = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
        SET @idEspecie = (SELECT idEspecie FROM Especie WHERE nome = @nomeEspecie)
    END

    -- Insere a ra�a
    INSERT INTO Raca (nome, idEspecie)
    VALUES (@nomeRaca, @idEspecie)
END
