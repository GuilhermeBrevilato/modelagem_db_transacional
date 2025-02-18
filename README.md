## Modelagem de Banco de Dados Transacional para Rede de Varejo

**Visão Geral**

Este projeto tem como objetivo modelar um banco de dados transacional para uma rede de varejo. O banco de dados foi projetado para armazenar e gerenciar informações sobre clientes, vendedores, produtos, transações de venda, métodos de pagamento, promoções, estoque e lojas.




📊 Objetivos

Criar um banco de dados relacional estruturado, garantindo:

Integridade dos dados: Definição correta de chaves primárias e estrangeiras.

Otimização de consultas: Modelagem eficiente para consultas rápidas.

Escalabilidade: Estrutura que permite futuras expansões, como vendas online.

## 📂 Estrutura do Projeto [modelagem_db_transacional](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/README.md)

1. **modelagem_db_transacional**
   - [`README.md`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/README.md)  

2. **modelagem**
   - `modelo_conceitual`
     -  [`modelo de negócio`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/descricao_modelo_de_negocio.pdf)
     -  [`modelo_conceitual.pdf`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional_ecommerce/blob/main/Modelo_Conceitual.pdf)
     -  [`modelo_conceitual.png`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/diagrama_entidade_relacionamento.png)
   - `modelo_logico`
     - [`modelo_logico.pdf`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional_ecommerce/blob/main/modelo_logico.pdf)
     - [`modelo_logico.png`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/diagrama_modelo_logico.png)
   - `modelo_fisico`
      - [`modelo_fisico.sql`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/modelo_fisico.sql)
      - [`carga_ETL.sql`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/Carga_ETL.sql)
      - [`views.sql`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/views_relatorios.sql)
      - [`Indexação.sql`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/indices.sql)



3. **LICENSE**
   - [`license`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/license)



---

## 🛠️ **Descrição do Projeto**

Para utilizar este banco de dados, siga os passos abaixo:

### **1️⃣ Configurar o Banco de Dados**
1. Instale um **SGBD** compatível: **PostgreSQL, MySQL ou SQL Server**.  
2. Crie um banco de dados no seu sistema.  

```sql
CREATE DATABASE varejo_db;

```
2️⃣ Criar as Tabelas


Execute o seguinte comando para criar as tabelas:
```sql
psql -U usuario -d varejo_db -f modelagem/modelo_fisico/modelo_fisico.sql
```

3️⃣ Inserir Dados

Se desejar popular o banco com dados de exemplo, execute:
```sql
psql -U usuario -d varejo_db -f modelagem/modelo_fisico/carga_ETL.sql
```

4️⃣ Criar Índices e Views (Opcional)

Para melhorar a performance, rode os scripts adicionais:
```sql 
psql -U usuario -d varejo_db -f modelagem/modelo_fisico/Indexacao.sql
psql -U usuario -d varejo_db -f modelagem/modelo_fisico/views.sql
```


## 📜 **Exemplos de Consultas SQL**

1️⃣ Listar os produtos mais vendidos

```sql
SELECT p.Nome, SUM(pt.Quantidade) AS TotalVendido
FROM Produto p
JOIN ProdutoTransacao pt ON p.ProdutoID = pt.ProdutoID
GROUP BY p.Nome
ORDER BY TotalVendido DESC;
```
2️⃣ Obter o total de vendas por cliente

```sql
SELECT c.Nome, SUM(t.ValorTotal) AS TotalGasto
FROM Cliente c
JOIN TransacaoVenda t ON c.ClienteID = t.ClienteID
GROUP BY c.Nome
ORDER BY TotalGasto DESC;
```

