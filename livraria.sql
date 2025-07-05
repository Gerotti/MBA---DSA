CREATE DATABASE livraria;
USE livraria;

CREATE TABLE autores (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200)
);

CREATE TABLE generos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200)
);

CREATE TABLE livros(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200),
    idioma VARCHAR(200),
    ano_publicacao INT,
    vendas DECIMAL(10,2),
    autor_id INT,
    genero_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id), #TABELA VAI SE RELACIONAR COM OUTRAS TABELAS
    FOREIGN KEY (genero_id) REFERENCES generos(id)
);

CREATE TABLE comentarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    comentario text,
    FOREIGN KEY (id_livro) REFERENCES livros(id)
);

SELECT * FROM autores;
SELECT * FROM generos;
SELECT * FROM livros;
SELECT * FROM comentarios;

-- Buscar todos os livros publicados após 2010
SELECT nome FROM livros
WHERE ano_publicacao > 2010;

-- Listar livros com vendas acima de 100
SELECT nome, vendas
FROM livros
WHERE vendas > 100;

-- Listar livros com nome do autor
SELECT l.nome AS livro, a.nome AS autor
FROM livros l
JOIN autores a on l.autor_id = a.id;

-- Contar quantos livros cada autor publicou
SELECT autor_id, COUNT(*) AS total_livros
FROM livros
GROUP BY autor_id;

-- Listar livro, autor e gênero
SELECT l.nome AS livro, a.nome AS autor, g.nome AS genero
FROM livros l
JOIN autores a ON l.autor_id = a.id
JOIN generos g on l.genero_id = g.id;

-- livros cujo gênero seja exatamente 'desconhecido'
select l.*
from livros l
join generos g on l.genero_id = g.id
where g.nome = 'desconhecido';

-- resumo estatístico
select
  min(vendas) as min_vendas,
  max(vendas) as max_vendas,
  avg(vendas) as media_vendas
from livros
where vendas is not null;

-- vendas por autor
select 
    a.nome as autor, 
    sum(l.vendas) as total_vendas, 
    count(l.id) as livros_publicados
from livros l
join autores a on l.autor_id = a.id
group by a.nome
order by total_vendas desc;

-- Listar top 5 gêneros com maior faturamento total
select 
    g.nome as genero,
    sum(l.vendas) as faturamento_total
from livros l
join generos g on l.genero_id = g.id
group by g.nome
order by faturamento_total desc
limit 5;

-- total de vendas por autor e por gênero
select 
  a.nome as autor,
  g.nome as genero,
  count(l.id) as total_livros,
  sum(l.vendas) as total_vendas,
  avg(l.vendas) as media_vendas
from livros l
join autores a on l.autor_id = a.id
join generos g on l.genero_id = g.id
where l.vendas is not null
group by a.nome, g.nome
order by total_vendas desc;
