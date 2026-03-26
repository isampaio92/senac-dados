CREATE DATABASE streaming_filmes;

USE streaming_filmes;

CREATE TABLE usuarios (
id INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
pais VARCHAR(100) NOT NULL,
plano VARCHAR(100) NOT NULL,
data_cadastro DATE
);

CREATE TABLE filmes (
id INT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
genero VARCHAR(100) NOT NULL,
ano_lancamento INT,
duracao INT,
classificacao VARCHAR(100),
imdb DECIMAL(10, 1)
);

CREATE TABLE avaliacoes (
id INT PRIMARY KEY,
usuario_id INT,
filme_id INT,
nota INT,
data_avaliacao DATE,
assistiu_completo VARCHAR(1) NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (filme_id) REFERENCES filmes(id)
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "C:/Users/igor.queiroz/Documents/senac-dados/usuarios.csv"
INTO TABLE usuarios
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, nome, email, pais, plano, data_cadastro);

LOAD DATA INFILE "C:/Users/igor.queiroz/Documents/senac-dados/filmes.csv"
INTO TABLE filmes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, titulo, genero, ano_lancamento, duracao, classificacao, imdb);

SELECT * FROM filmes;

DROP TABLE avaliacoes;
DROP TABLE filmes;
