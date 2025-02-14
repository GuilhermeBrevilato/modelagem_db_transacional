--Criação de uma Stored Procedure (SP) para inserção dos dados no DB

CREATE OR REPLACE PROCEDURE dsap2.carga_etl()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Inserindo dados na tabela Cliente
    INSERT INTO dsap2.Cliente (Nome, CPF, Endereco, Telefone) VALUES 
    ('Cora Coralina', '12345678901', 'Rua das Flores, 10', '1123456789'),
    ('Jorge Amado', '43456789012', 'Avenida da Chuva, 100', '3123456790'),
    ('Machado de Assis', '23456789012', 'Avenida do Sol, 20', '2123456790');

    -- Inserindo dados na tabela Loja
    INSERT INTO dsap2.Loja (Nome, Endereco, Telefone) VALUES 
    ('Loja Central', 'Praça Central, 1', '1134567890'),
    ('Loja Sul', 'Rua Sul, 50', '1134567891');

    -- Inserindo dados na tabela Vendedor
    INSERT INTO dsap2.Vendedor (Nome, IdentificacaoFunc, LojaID) VALUES 
    ('Bob Silva', 'V001', 1),
    ('Mary Queen', 'V002', 2);

    -- Inserindo dados na tabela Categoria
    INSERT INTO dsap2.Categoria (Nome, Descricao) VALUES 
    ('Eletrônicos', 'Produtos eletrônicos como TVs, smartphones, etc.'),
    ('Vestuário', 'Roupas e acessórios');

    -- Inserindo dados na tabela Promoção
    INSERT INTO dsap2.Promocao (Descricao, Validade) VALUES 
    ('Desconto de 10% em Eletrônicos', '2023-12-31'),
    ('Compre 1 e Leve 2 em Vestuário', '2023-11-30');

    -- Inserindo dados na tabela Produto
    INSERT INTO dsap2.Produto (Nome, Descricao, Preco, CategoriaID, PromoID) VALUES 
    ('Smartphone DSA', 'Smartphone com tela de 6 polegadas', 1500.00, 1, 1),
    ('Gaming Laptop DSA', 'Computador pessoal', 3500.00, 1, 1),
    ('Headphone DSA', 'Gaming Headphone', 700.00, 1, 1),
    ('Camisa Polo DSA', 'Camisa polo de algodão', 80.00, 2, 2);

    -- Inserindo dados na tabela MétodoPagamento
    INSERT INTO dsap2.MetodoPagamento (Tipo, Descricao) VALUES 
    ('Cartão de Crédito', 'Pagamento via cartão de crédito'),
    ('Boleto Bancário', 'Pagamento via boleto bancário');

    -- Inserindo dados na tabela TransaçãoVenda
    INSERT INTO dsap2.TransacaoVenda (DataHora, ClienteID, VendedorID, LojaID, MetodoPagamentoID, ValorTotal) VALUES 
    ('2024-10-10 10:00:00', 1, 1, 1, 1, 1500.00),
    ('2024-10-10 11:00:00', 3, 1, 1, 1, 3500.00),
    ('2024-10-11 14:20:00', 3, 1, 1, 1, 1700.00),
    ('2024-10-12 15:30:00', 2, 2, 2, 2, 80.00);

    -- Inserindo dados na tabela Estoque
    INSERT INTO dsap2.Estoque (ProdutoID, LojaID, Quantidade) VALUES 
    (1, 1, 31),
    (2, 1, 50),
    (2, 1, 42),
    (2, 2, 100);

    -- Inserindo dados na tabela ProdutoTransação
    INSERT INTO dsap2.ProdutoTransacao (ProdutoID, TransacaoID, Quantidade) VALUES 
    (1, 1, 1),
    (2, 2, 3),
    (3, 3, 1),
    (2, 4, 1);

END;
$$;

-- Executa a SP
CALL dsap2.carga_etl();


