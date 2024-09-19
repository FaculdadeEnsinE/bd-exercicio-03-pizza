-- Quantas orders foram criadas após às 20h
SELECT COUNT(*) total
FROM orders o
WHERE time > '20:00:00';


-- Quantas ordens da pizza pepperoni_l foram criadas
-- -> buscar por ingrediante pepperoni
SELECT COUNT(*) quantidadeOrdens
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE pt.ingredients LIKE '%pepperoni%';

-- -> buscar por pizza_id pepperoni_l
SELECT COUNT(*) quantidadeOrdens
FROM order_details od
WHERE od.pizza_id = 'pepperoni_l';


-- Quantas ordens para a pizza mediterraneo tamanho L foram emitidas
SELECT COUNT(*) quantidadeOrdens
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
WHERE od.pizza_id = 'mediterraneo_l'
AND p.size = 'L';

SELECT COUNT(*) quantidadeOrdens
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
WHERE od.pizza_id LIKE 'mediterraneo%'
AND p.size = 'L';


--Retorne o pedido com maior quantidade de pizzas
SELECT *
FROM order_details od
ORDER BY quantity DESC
LIMIT 0,1;

SELECT
	MAX(quantity), -- MAX >> retornar o maior valor / máximo
	MIN(quantity)  -- MIN >> retornar o menor valor / mínimo
FROM order_details od;

SELECT order_id, SUM(*) quantidade
FROM order_details od
GROUP BY order_id
ORDER BY quantidade DESC
LIMIT 0,1;

SELECT order_id,SUM(quantity)
FROM order_details od
WHERE order_id = 18845;

--Retorne o somatório de pizzas de cada sabor vendidas
SELECT
	pt.nome as nomepizza,
	od.quantity,
	p.price,
	SUM(quantity) total,
	(SUM(od.quantity) * p.price) valorTotal
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.nome
ORDER BY total DESC;


--Retorne o tipo de pizza mais pedido nas compras
SELECT
pizza_id,COUNT(*) total
FROM order_details od
GROUP BY pizza_id
ORDER BY total DESC
LIMIT 0,1; -- LIMIT >> inicio da consulta, quantidade de registros


--Retorne a quantidade de pedidos feitos dentro do mes de janeiro de 2015
SELECT COUNT(*)
FROM orders
WHERE date >= '2015-01-01' AND date <= '2015-01-31';

SELECT COUNT(*)
FROM orders o
WHERE date BETWEEN '2015-01-01' AND '2015-01-31'; -- BETWEEN  >> entre primeiro e o ultimo valor nos campos data e numeros

SELECT COUNT(*)
FROM orders o
WHERE date LIKE '2015-01-%';


--Retorne o mês com maior quantidade de pedidos no ano de 2015
SELECT strftime('%m', o.date) as mes,COUNT(*) as total
FROM orders o
WHERE date LIKE '2015%'
GROUP BY strftime('%m', o.date)
ORDER BY total DESC;


-- Quantas pessoas pediram mais de uma pizza
SELECT COUNT(*)
FROM order_details od
WHERE quantity > 1;


-- Quantas pizzas vegetarianas foram pedidas
SELECT COUNT(*), SUM(quantity)
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE pt.category ='Veggie';


-- Quantas pizzas vendidas nos domingos
SELECT
	date,COUNT(quantity)
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
WHERE date NOT IN( -- o IN recebe uma lista de parâmentros
	-- subselect
	SELECT DISTINCT date(date, 'weekday 0') FROM orders o2
)
GROUP BY date;


-- funções de data no sqlite
SELECT DISTINCT date(date, 'weekday 0') FROM orders o2;

select datetime('now', 'weekday 0'); -- Domingo
select datetime('now', 'weekday 1'); -- Segunda-feira
select datetime('now', 'weekday 2'); -- Terça-feira
select datetime('now', 'weekday 3'); -- Quarta-feira
select datetime('now', 'weekday 4'); -- Quinta-feira
select datetime('now', 'weekday 5'); -- Sexta-feira
select datetime('now', 'weekday 6'); -- Sábado


-- Quantas pizzas foram pedidas do tamanho grande (L)
SELECT
	o.date,
	od.quantity,
	p.size
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
WHERE p."size" = 'L'
GROUP BY o.date;
-- HAVING od.quantity > 1 -- é um filtro no GROUP BY


-- Qual o preço por tamanho de pizza no dia 01-01-2015
SELECT
REPLACE(REPLACE(REPLACE(REPLACE(p."size",'XL','EXTRA GRANDE'),'M','MEDIO'),'S','PEQUENO'),'L','GRANDE') tamanho,
CASE
	WHEN p."size" = 'XL' THEN 'EXTRA GRANDE'
	WHEN p."size" = 'M' THEN 'MEDIO'
	WHEN p."size" = 'L' THEN 'GRANDE'
	ELSE 'PEQUENO'
END as TamanhoCase,
ROUND(AVG(p.price),4) mediaPorTamanho
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
WHERE o.date = '2015-01-01'
GROUP BY p."size"
ORDER BY p."size";
