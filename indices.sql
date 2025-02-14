-- Para otimizar a performance do banco de dados com base nas tabelas fornecidas, a criação de índices é uma 
-- estratégia eficaz. Índices são utilizados para acelerar a recuperação de dados nas tabelas. A escolha de colunas 
-- para indexação deve ser feita com base na frequência e no tipo de consultas realizadas. 

-- Aqui estão algumas sugestões de índices para as tabelas do esquema dsap2:

-- Tabela Cliente:

-- Índice no CPF: Como o CPF é único para cada cliente e pode ser frequentemente utilizado para pesquisar clientes, um índice aqui ajudará a melhorar a performance dessas consultas.
-- Índice no Nome: Se houver consultas frequentes procurando clientes pelo nome, um índice nessa coluna pode ser benéfico.

CREATE INDEX idx_cliente_cpf ON dsap2.Cliente(CPF);
CREATE INDEX idx_cliente_nome ON dsap2.Cliente(Nome);

-- Tabela Loja:

-- Índice no Nome: Se as lojas são frequentemente pesquisadas pelo nome, um índice nesta coluna pode acelerar essas consultas.

CREATE INDEX idx_loja_nome ON dsap2.Loja(Nome);

-- Tabela Vendedor:

-- Índice no LojaID: Como os vendedores podem ser frequentemente consultados com base na loja em que trabalham, um índice aqui pode ser útil.

CREATE INDEX idx_vendedor_lojaid ON dsap2.Vendedor(LojaID);

-- Tabela Produto:

-- Índice no CategoriaID e PromoID: Estes índices podem acelerar consultas que buscam produtos por categoria ou promoção.

CREATE INDEX idx_produto_categoriaid ON dsap2.Produto(CategoriaID);
CREATE INDEX idx_produto_promoid ON dsap2.Produto(PromoID);

-- Tabela TransacaoVenda:

-- Índice na coluna DataHora: Para consultas que buscam transações em um intervalo de tempo específico.
-- Índices compostos no ClienteID, VendedorID e LojaID: Úteis se as transações são frequentemente consultadas com base nestes critérios.

CREATE INDEX idx_transacaovenda_datahora ON dsap2.TransacaoVenda(DataHora);
CREATE INDEX idx_transacaovenda_clienteid ON dsap2.TransacaoVenda(ClienteID);
CREATE INDEX idx_transacaovenda_vendedorid ON dsap2.TransacaoVenda(VendedorID);
CREATE INDEX idx_transacaovenda_lojaid ON dsap2.TransacaoVenda(LojaID);

-- Tabela Estoque:

-- Índices compostos no ProdutoID e LojaID: Úteis para consultas que buscam o estoque de um produto específico em uma loja específica.

CREATE INDEX idx_estoque_prodid_lojaid ON dsap2.Estoque(ProdutoID, LojaID);





