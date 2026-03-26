CREATE DATABASE bco_relacional;

USE bco_relacional;

CREATE TABLE clientes (
id INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL);

CREATE TABLE pedidos (
id INT PRIMARY KEY,
cliente_id INT,
total DECIMAL(10,2),
FOREIGN KEY (cliente_id) REFERENCES clientes(id));

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "C:/Users/igor.queiroz/Desktop/clientes.csv"
INTO TABLE clientes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, nome);

LOAD DATA INFILE "C:/Users/igor.queiroz/Desktop/pedidos.csv"
INTO TABLE pedidos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, cliente_id, total);

SELECT clientes.nome, pedidos.id, pedidos.total
FROM clientes
JOIN pedidos ON clientes.id = pedidos.cliente_id;

SELECT clientes.nome, pedidos.id, pedidos.total
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;

SELECT clientes.nome, pedidos.id, SUM(pedidos.total) AS total_gasto
FROM clientes
JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nome
ORDER BY total_gasto
DESC;
