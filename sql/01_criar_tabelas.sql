-- =====================================================
-- Criação das tabelas do banco de dados fictício
-- Simulação de um banco digital: clientes e transações
-- =====================================================

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cidade TEXT NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE transacoes (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    valor REAL NOT NULL,
    categoria TEXT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- =====================================================
-- Inserindo dados fictícios de exemplo
-- =====================================================

INSERT INTO clientes (id, nome, cidade, data_cadastro) VALUES
(1, 'Ana Souza',      'São Paulo',      '2023-01-15'),
(2, 'Bruno Lima',     'Rio de Janeiro', '2023-02-20'),
(3, 'Carla Mendes',   'Belo Horizonte', '2023-03-05'),
(4, 'Diego Alves',    'Curitiba',       '2023-04-10'),
(5, 'Elisa Ramos',    'Poços de Caldas','2023-05-18');

INSERT INTO transacoes (id, cliente_id, valor, categoria, data) VALUES
(1, 1,  150.00, 'Alimentação',   '2023-06-01'),
(2, 1,  320.50, 'Transporte',    '2023-06-03'),
(3, 2,   89.90, 'Alimentação',   '2023-06-02'),
(4, 2,  500.00, 'Eletrônicos',   '2023-06-05'),
(5, 3,  200.00, 'Lazer',         '2023-06-04'),
(6, 3,   45.00, 'Alimentação',   '2023-06-06'),
(7, 4,  700.00, 'Eletrônicos',   '2023-06-07'),
(8, 4,  120.00, 'Transporte',    '2023-06-08'),
(9, 5,   60.00, 'Alimentação',   '2023-06-09'),
(10,5,  310.00, 'Lazer',         '2023-06-10');
