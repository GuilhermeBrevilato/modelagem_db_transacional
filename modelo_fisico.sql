
-- Criação de um SCHEMA para inserção dos dados
CREATE SCHEMA dsap2 AUTHORIZATION dsa;

CREATE TABLE dsap2.Cliente (
    ClienteID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    Endereco TEXT,
    Telefone VARCHAR(15)
);

CREATE TABLE dsap2.Loja (
    LojaID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco TEXT NOT NULL,
    Telefone VARCHAR(15)
);

CREATE TABLE dsap2.Vendedor (
    VendedorID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    IdentificacaoFunc VARCHAR(100) NOT NULL,
    LojaID INTEGER REFERENCES dsap2.Loja(LojaID) ON DELETE CASCADE
);

CREATE TABLE dsap2.Categoria (
    CategoriaID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT
);

CREATE TABLE dsap2.Promocao (
    PromoID SERIAL PRIMARY KEY,
    Descricao TEXT NOT NULL,
    Validade DATE NOT NULL
);

CREATE TABLE dsap2.Produto (
    ProdutoID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10,2) NOT NULL,
    CategoriaID INTEGER REFERENCES dsap2.Categoria(CategoriaID) ON DELETE CASCADE,
    PromoID INTEGER REFERENCES dsap2.Promocao(PromoID) ON DELETE SET NULL
);

CREATE TABLE dsap2.MetodoPagamento (
    MetodoPagamentoID SERIAL PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL,
    Descricao TEXT
);

CREATE TABLE dsap2.TransacaoVenda (
    TransacaoID SERIAL PRIMARY KEY,
    DataHora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ClienteID INTEGER REFERENCES dsap2.Cliente(ClienteID) ON DELETE CASCADE,
    VendedorID INTEGER REFERENCES dsap2.Vendedor(VendedorID) ON DELETE CASCADE,
    LojaID INTEGER REFERENCES dsap2.Loja(LojaID) ON DELETE CASCADE,
    MetodoPagamentoID INTEGER REFERENCES dsap2.MetodoPagamento(MetodoPagamentoID) ON DELETE SET NULL,
    ValorTotal DECIMAL(10,2) NOT NULL
);

CREATE TABLE dsap2.Estoque (
    EstoqueID SERIAL PRIMARY KEY,
    ProdutoID INTEGER REFERENCES dsap2.Produto(ProdutoID) ON DELETE CASCADE,
    LojaID INTEGER REFERENCES dsap2.Loja(LojaID) ON DELETE CASCADE,
    Quantidade INTEGER NOT NULL CHECK (Quantidade >= 0)
);

CREATE TABLE dsap2.ProdutoTransacao (
    ProdutoID INTEGER REFERENCES dsap2.Produto(ProdutoID) ON DELETE CASCADE,
    TransacaoID INTEGER REFERENCES dsap2.TransacaoVenda(TransacaoID) ON DELETE CASCADE,
    Quantidade INTEGER NOT NULL CHECK (Quantidade > 0),
    PRIMARY KEY (ProdutoID, TransacaoID)
);
