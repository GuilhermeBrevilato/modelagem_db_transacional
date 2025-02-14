-- Views de Relatórios

-- Relatório de Vendas por Loja
-- Esta view junta as tabelas Loja, Vendedor, TransacaoVenda e Cliente para fornecer um relatório 
-- de todas as vendas realizadas em cada loja, incluindo detalhes do vendedor e do cliente.

CREATE VIEW dsap2.RelatorioVendasPorLoja AS
SELECT L.Nome AS Loja, V.Nome AS Vendedor, C.Nome AS Cliente, TV.DataHora, TV.ValorTotal
FROM dsap2.Loja L
JOIN dsap2.Vendedor V ON L.LojaID = V.LojaID
JOIN dsap2.TransacaoVenda TV ON V.VendedorID = TV.VendedorID
JOIN dsap2.Cliente C ON TV.ClienteID = C.ClienteID;

-- Relatório de Produtos em Promoção
-- Esta view junta as tabelas Produto, Categoria e Promocao para listar todos os produtos que estão atualmente em promoção, 
-- junto com detalhes da categoria e da promoção.

CREATE VIEW dsap2.RelatorioProdutosPromocao AS
SELECT P.Nome AS Produto, C.Nome AS Categoria, Pr.Descricao AS DescricaoPromocao, Pr.Validade
FROM dsap2.Produto P
JOIN dsap2.Categoria C ON P.CategoriaID = C.CategoriaID
JOIN dsap2.Promocao Pr ON P.PromoID = Pr.PromoID;

-- Relatório de Estoque por Loja
-- Esta view junta as tabelas Estoque, Produto e Loja para mostrar a quantidade de cada produto disponível em cada loja.

CREATE VIEW dsap2.RelatorioEstoquePorLoja AS
SELECT L.Nome AS Loja, P.Nome AS Produto, E.Quantidade
FROM dsap2.Estoque E
JOIN dsap2.Produto P ON E.ProdutoID = P.ProdutoID
JOIN dsap2.Loja L ON E.LojaID = L.LojaID;

-- Relatório de Métodos de Pagamento nas Transações
-- Esta view junta as tabelas TransacaoVenda, MetodoPagamento e Cliente para mostrar quais métodos de pagamento 
-- são mais utilizados pelos clientes em suas transações.

CREATE VIEW dsap2.RelatorioMetodoPagamentoTransacoes AS
SELECT MP.Tipo AS MetodoPagamento, C.Nome AS Cliente, TV.DataHora, TV.ValorTotal
FROM dsap2.TransacaoVenda TV
JOIN dsap2.MetodoPagamento MP ON TV.MetodoPagamentoID = MP.MetodoPagamentoID
JOIN dsap2.Cliente C ON TV.ClienteID = C.ClienteID;

-- Relatório de Detalhes das Vendas de Produtos
-- Esta view junta as tabelas ProdutoTransacao, Produto, TransacaoVenda e Cliente para fornecer um relatório detalhado 
-- de cada produto vendido, incluindo a quantidade, o valor total e informações do cliente.

CREATE VIEW dsap2.RelatorioDetalhesVendasProdutos AS
SELECT P.Nome AS Produto, PT.Quantidade, TV.ValorTotal, C.Nome AS Cliente, TV.DataHora
FROM dsap2.ProdutoTransacao PT
JOIN dsap2.Produto P ON PT.ProdutoID = P.ProdutoID
JOIN dsap2.TransacaoVenda TV ON PT.TransacaoID = TV.TransacaoID
JOIN dsap2.Cliente C ON TV.ClienteID = C.ClienteID;

