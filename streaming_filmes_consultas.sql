USE streaming_filmes;

SELECT * FROM filmes;
SELECT * FROM usuarios;
SELECT * FROM avaliacoes;

SELECT usuarios.nome, filmes.titulo, avaliacoes.nota
FROM avaliacoes
INNER JOIN usuarios
ON usuarios.id = avaliacoes.usuario_id
INNER JOIN filmes
ON filmes.id = avaliacoes.filme_id
ORDER BY usuarios.nome;

SELECT filmes.titulo, avaliacoes.nota, usuarios.nome
FROM avaliacoes
INNER JOIN filmes
ON filmes.id = avaliacoes.filme_id
INNER JOIN usuarios
ON usuarios.id = avaliacoes.usuario_id
ORDER BY filmes.titulo;

SELECT filmes.titulo, usuarios.nome
FROM avaliacoes
INNER JOIN filmes
ON filmes.id = avaliacoes.filme_id
INNER JOIN usuarios
ON usuarios.id = avaliacoes.usuario_id
WHERE avaliacoes.nota = 5;

SELECT usuarios.nome,COUNT(avaliacoes.id) AS total_avaliacoes
FROM avaliacoes
INNER JOIN usuarios
ON usuarios.id = avaliacoes.usuario_id
GROUP BY usuarios.nome
ORDER BY total_avaliacoes
DESC;

SELECT filmes.titulo, ROUND(AVG(avaliacoes.nota), 2) AS media_notas
FROM avaliacoes
INNER JOIN filmes
ON filmes.id = avaliacoes.filme_id
GROUP BY filmes.titulo
ORDER BY media_notas
DESC;

SELECT filmes.titulo, filmes.genero, COUNT(avaliacoes.id) AS total_avaliacoes
FROM avaliacoes
LEFT JOIN filmes
ON filmes.id = avaliacoes.filme_id
GROUP BY filmes.titulo
ORDER BY total_avaliacoes
DESC;

SELECT filmes.titulo, filmes.genero
FROM avaliacoes
LEFT JOIN filmes
ON filmes.id = avaliacoes.filme_id
WHERE avaliacoes.id IS NULL;

SELECT usuarios.nome, usuarios.pais, filmes.titulo
FROM avaliacoes
INNER JOIN usuarios
ON usuarios.id = avaliacoes.usuario_id
INNER JOIN filmes
ON filmes.id = avaliacoes.filme_id
WHERE usuarios.plano = 'Premium';

SELECT filmes.titulo, filmes.genero, COUNT(avaliacoes.id) AS avaliacoes_brasil
FROM avaliacoes
INNER JOIN filmes
ON filmes.id = avaliacoes.filme_id
INNER JOIN usuarios
ON usuarios.id = avaliacoes.usuario_id
WHERE usuarios.pais = 'Brasil'
GROUP BY filmes.titulo
ORDER BY avaliacoes_brasil
DESC;

SELECT usuarios.nome, filmes.titulo, avaliacoes.nota
FROM avaliacoes
INNER JOIN usuarios
ON usuarios.id = avaliacoes.usuario_id
INNER JOIN filmes
ON filmes.id = avaliacoes.filme_id
WHERE avaliacoes.assistiu_completo = 'N'
ORDER BY usuarios.nome;

