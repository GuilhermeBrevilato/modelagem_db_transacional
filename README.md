Modelagem de Banco de Dados Transacional para Rede de Varejo

**Visão Geral**

Este projeto tem como objetivo modelar um banco de dados transacional para uma rede de varejo. O banco de dados foi projetado para armazenar e gerenciar informações sobre clientes, vendedores, produtos, transações de venda, métodos de pagamento, promoções, estoque e lojas.




📊 Objetivo

Criar um banco de dados relacional estruturado, garantindo:

Integridade dos dados: Definição correta de chaves primárias e estrangeiras.

Otimização de consultas: Modelagem eficiente para consultas rápidas.

Escalabilidade: Estrutura que permite futuras expansões, como vendas online.

## 📂 Estrutura do Projeto [modelagem_db_transacional](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/README.md)

1. **modelagem_db_transacional**
   - [`README.md`](https://github.com/GuilhermeBrevilato/modelagem_db_transacional/blob/main/README.md)  (este arquivo)

2. **modelagem**
   - `modelo_conceitual`
     -  `modelo_conceitual.pdf`
     -  `modelo_conceitual.png`
   - `modelo_logico`
     - `modelo_logico.pdf`
     - `modelo_logico.png`  
   - `modelo_fisico`
      - `modelo_fisico.sql`

3. **scripts**
   - `create_tables.sql`
   - `insert_data.sql`
   - `queries_exemplos.sql`

4. **docs**
   - `relatorio_modelagem.pdf`

5. **LICENSE**



🏢 Entidades Principais

Cliente 🧑‍💼

Informações pessoais como nome, CPF, endereço e telefone.

Vendedor 🏪

Dados do funcionário, incluindo histórico de vendas.

Produto 📦

Identificação do item, nome, descrição, preço e estoque.

Categoria 📂

Classificação dos produtos por segmento (eletrodomésticos, vestuário, etc.).

Loja 🏢

Unidades físicas da rede, com endereço e telefone.

Transação de Venda 🛒

Registros de compras realizadas pelos clientes.

Método de Pagamento 💳

Formas de pagamento aceitas (cartão, dinheiro, etc.).

Promoção 🔥

Descontos aplicáveis aos produtos.

Estoque 📊

Quantidade de produtos disponíveis por loja.

ProdutoTransação 🔄

Relação muitos-para-muitos entre produtos e transações.
