CREATE DATABASE book_store; #cria o banco de dados | lembrar de sempre terminar com ;
USE book_store; #abre o banco de dados para trabalhar com ele

CREATE TABLE clients (
	id_client INT PRIMARY KEY AUTO_INCREMENT, #criar um id para cada cliente para serem únicos | Primary key relaciona com outras tabelas | int = numero inteiro | auto_increment gera um numero novo para cada cliente
    nome VARCHAR (100) NOT NULL CHECK (TRIM(nome) <> ''), #VARCHAR = Variable Characters | não pode ser nulo e nem ter strings vazias
    email VARCHAR (100) NOT NULL CHECK (TRIM(email) <> '') #TRIM = tudo que for espaço em branco vai ser removido
);

SELECT * FROM clients; #visualizar tabela

INSERT INTO clients (nome, email) VALUES
	('Beatriz', 'bia@email.com'), 
    ('Matheus', 'matheus@email.com');

INSERT INTO clients (nome, email) VALUES
	('',''); #se eu tentar adicionar valores nulos ou espaços ele vai me retornar um erro
    
   #DROP TABLE clients #deleta tabela 
    
    
    CREATE TABLE books (
		id_book INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(100) NOT NULL,
        info TEXT,
        price DECIMAL(10,2) NOT NULL, #números antes e depois da virgula
        stock INT NOT NULL
    
    );
    
    SELECT * FROM books;
    
    INSERT INTO books (nome, info, price, stock) VALUES
		('Livro do Show', 'Uma aventura no show do Offspring no Allianz Park', 70.99, 10),
        ('DSA', 'DSA para engenharia de dados', 7.42, 100),
        ('Python para DSA', 'Aprenda python no contexto de ciencia de dados', 199.99, 5);
        
UPDATE books SET nome = 'MBA - DSA' WHERE id_book = 2;
    
#DELETE FROM clients WHERE id_client =2; #deletar dados

SELECT * FROM books
	WHERE stock > 20;
    
SELECT * FROM books
	WHERE price < 100 and stock > 5;
    
SELECT * FROM books
	ORDER BY price DESC;
    
    
    
    
    