-- =====================================================
-- CONSULTAS SIMPLES (SELECT, WHERE, ORDER BY)
-- =====================================================

-- 1. Listar todos os clientes ordenados por nome
SELECT nome, cidade, data_cadastro
FROM clientes
ORDER BY nome;

-- 2. Buscar transações acima de R$ 200
SELECT *
FROM transacoes
WHERE valor > 200
ORDER BY valor DESC;

-- 3. Buscar clientes de uma cidade específica
SELECT nome, cidade
FROM clientes
WHERE cidade = 'São Paulo';


-- =====================================================
-- CONSULTAS COM JOIN
-- =====================================================

-- 4. Listar todas as transações com o nome do cliente
SELECT
    c.nome AS cliente,
    t.valor,
    t.categoria,
    t.data
FROM transacoes t
JOIN clientes c ON t.cliente_id = c.id
ORDER BY t.data;

-- 5. Transações de eletrônicos com dados do cliente
SELECT
    c.nome AS cliente,
    c.cidade,
    t.valor,
    t.data
FROM transacoes t
JOIN clientes c ON t.cliente_id = c.id
WHERE t.categoria = 'Eletrônicos';


-- =====================================================
-- CONSULTAS COM AGREGAÇÃO (GROUP BY)
-- =====================================================

-- 6. Total gasto por cliente
SELECT
    c.nome AS cliente,
    SUM(t.valor) AS total_gasto
FROM transacoes t
JOIN clientes c ON t.cliente_id = c.id
GROUP BY c.nome
ORDER BY total_gasto DESC;

-- 7. Total gasto por categoria
SELECT
    categoria,
    SUM(valor) AS total_categoria,
    COUNT(*) AS quantidade_transacoes
FROM transacoes
GROUP BY categoria
ORDER BY total_categoria DESC;

-- 8. Cliente com maior gasto médio por transação
SELECT
    c.nome AS cliente,
    AVG(t.valor) AS gasto_medio
FROM transacoes t
JOIN clientes c ON t.cliente_id = c.id
GROUP BY c.nome
ORDER BY gasto_medio DESC
LIMIT 1;
