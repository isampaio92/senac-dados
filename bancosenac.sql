CREATE DATABASE bancosenac;
USE bancosenac;

CREATE TABLE vendas (
data DATE,
produto VARCHAR(100),
categoria VARCHAR(100),
valor_unitario DECIMAL(10,2),
quantidade INT,
cliente VARCHAR(100),
cidade VARCHAR(100),
estado VARCHAR(2)
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "C:/Users/igor.queiroz/Desktop/vendas.csv"
INTO TABLE vendas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, produto, categoria, valor_unitario,
quantidade, cliente, cidade, estado);

SELECT * FROM vendas
LIMIT 10;

SELECT produto, valor_unitario FROM vendas;

SELECT data, produto, valor_unitario, cidade FROM vendas
WHERE cidade = "Rio de Janeiro";

SELECT produto, SUM(valor_unitario * quantidade) AS valor_vendido
FROM vendas
WHERE categoria = "Eletrônicos"
GROUP BY produto
HAVING valor_vendido > 2000
ORDER BY valor_vendido
DESC;

SELECT * FROM vendas;

SELECT * FROM vendas
WHERE categoria = "Informática";

SELECT * FROM vendas
WHERE estado = "RJ";

SELECT * FROM vendas
WHERE valor_unitario > 500;

SELECT * FROM vendas
WHERE cliente = "Ana Souza";

SELECT * FROM vendas
WHERE categoria = "Vestuário"
AND estado = "PR";

SELECT produto, categoria, valor_unitario FROM vendas
WHERE estado = "SP";

SELECT *, (valor_unitario * quantidade) AS valor_vendido
FROM vendas;

SELECT produto, quantidade, cliente, (valor_unitario * quantidade) AS valor_vendido
FROM vendas
WHERE quantidade > 1;

SELECT *, (valor_unitario * quantidade) AS valor_vendido
FROM vendas
HAVING valor_vendido > 1000;

SELECT *, (valor_unitario * quantidade) AS valor_vendido
FROM vendas
WHERE categoria = "Eletrônicos";

SELECT *, (valor_unitario * quantidade) AS valor_vendido
FROM vendas
HAVING valor_vendido > 2000;

SELECT categoria, SUM(valor_unitario * quantidade) AS valor_vendido
FROM vendas
GROUP BY categoria
ORDER BY valor_vendido
DESC;

SELECT categoria, SUM(quantidade) AS quantidade_total
FROM vendas
GROUP BY categoria
ORDER BY quantidade
DESC;

SELECT estado, SUM(valor_unitario * quantidade) AS valor_vendido
FROM vendas
GROUP BY estado
ORDER BY valor_vendido
DESC;

SELECT cliente, SUM(valor_unitario * quantidade) AS valor_gasto
FROM vendas
GROUP BY cliente
ORDER BY valor_gasto
DESC;

SELECT cidade, SUM(quantidade) AS quantidade_de_vendas
FROM vendas
GROUP BY cidade
ORDER BY quantidade_de_vendas
DESC;

SELECT categoria, AVG(valor_unitario) AS media_valor_unitario
FROM vendas
GROUP BY categoria
ORDER BY media_valor_unitario
DESC;

SELECT categoria, SUM(valor_unitario * quantidade) AS valor_vendido
FROM vendas
GROUP BY categoria
HAVING valor_vendido > 10000
ORDER BY valor_vendido
DESC;

SELECT cliente, SUM(valor_unitario * quantidade) AS valor_gasto
FROM vendas
GROUP BY cliente
HAVING valor_gasto > 5000
ORDER BY valor_gasto
DESC;

SELECT estado, SUM(quantidade) AS quantidade_total
FROM vendas
GROUP BY estado
HAVING quantidade_total > 3
ORDER BY quantidade_total
DESC;

SELECT categoria, SUM(quantidade) AS quantidade_total
FROM vendas
GROUP BY categoria
HAVING quantidade_total > 5
ORDER BY quantidade_total
DESC;

SELECT cliente, SUM(quantidade) AS quantidade_total
FROM vendas
GROUP BY cliente
HAVING quantidade_total > 2
ORDER BY quantidade_total
DESC;

SELECT categoria, SUM(valor_unitario * quantidade) AS valor_vendido
FROM vendas
GROUP BY categoria
ORDER BY valor_vendido
DESC
LIMIT 1;

SELECT cliente, SUM(valor_unitario * quantidade) AS valor_gasto
FROM vendas
GROUP BY cliente
ORDER BY valor_gasto
DESC
LIMIT 1;

SELECT produto, SUM(quantidade) AS quantidade_total
FROM vendas
GROUP BY produto
ORDER BY quantidade_total
DESC
LIMIT 1;

SELECT cliente, SUM(valor_unitario * quantidade) AS valor_gasto
FROM vendas
GROUP BY cliente
ORDER BY valor_gasto
DESC
LIMIT 3;

SELECT estado, AVG(valor_unitario * quantidade) AS media_de_vendas
FROM vendas
GROUP BY estado
ORDER BY media_de_vendas
DESC;