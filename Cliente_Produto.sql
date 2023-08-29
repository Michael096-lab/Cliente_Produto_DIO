-- Tabelas principais
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE PessoaFisica (
    pf_id INT PRIMARY KEY,
    cpf VARCHAR(14),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE PessoaJuridica (
    pj_id INT PRIMARY KEY,
    cnpj VARCHAR(18),
    razao_social VARCHAR(100),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Produto (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Estoque (
    estoque_id INT PRIMARY KEY,
    produto_id INT,
    fornecedor_id INT,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

CREATE TABLE FormaPagamento (
    pagamento_id INT PRIMARY KEY,
    cliente_id INT,
    tipo_pagamento VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Entrega (
    entrega_id INT PRIMARY KEY,
    pedido_id INT,
    status VARCHAR(50),
    codigo_rastreio VARCHAR(20),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

-- Tabelas intermediárias
CREATE TABLE PedidoProduto (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);


-- pedidos feitos por cada cliente
SELECT c.nome AS cliente, COUNT(p.pedido_id) AS total_pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nome;

-- vendedor também é fornecedor
SELECT DISTINCT c.nome AS vendedor_fornecedor
FROM Cliente c
JOIN Pedido p ON c.cliente_id = p.cliente_id
JOIN PedidoProduto pp ON p.pedido_id = pp.pedido_id
JOIN Produto pd ON pp.produto_id = pd.produto_id
JOIN Estoque e ON pd.produto_id = e.produto_id
JOIN Fornecedor f ON e.fornecedor_id = f.fornecedor_id;

-- relação de produtos fornecedores e estoques
SELECT pd.nome AS produto, f.nome AS fornecedor, e.quantidade AS estoque
FROM Produto pd
JOIN Estoque e ON pd.produto_id = e.produto_id
JOIN Fornecedor f ON e.fornecedor_id = f.fornecedor_id;

-- relação de nomes dos fornecedores e nomes dos produtos
SELECT f.nome AS fornecedor, pd.nome AS produto
FROM Fornecedor f
JOIN Estoque e ON f.fornecedor_id = e.fornecedor_id
JOIN Produto pd ON e.produto_id = pd.produto_id;


