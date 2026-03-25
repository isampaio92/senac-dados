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

SELECT * FROM vendas;

SELECT produto, valor_unitario FROM vendas;

SELECT data, produto, valor_unitario, cidade FROM vendas
WHERE cidade = "Rio de Janeiro";

SELECT produto, SUM(valor_unitario * quantidade) AS valor_venda FROM vendas
GROUP BY produto
ORDER BY valor_venda
DESC;
