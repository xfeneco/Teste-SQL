inserir um registro na tabela de produtos com os valores fornecidos

INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod)
VALUES (170, 2, 'LEITE CONDENSADO MOÇOCA', '2010-12-30', 45.4);

Para atualizar o preço do produto com base no índice

UPDATE produtos
SET preco_prod = 95.4
WHERE cod_prod = 170 AND loj_prod = 2;


Para trazer todos os registros das lojas 1 e 2:

SELECT *
FROM produtos
WHERE loj_prod IN (1, 2);

Para encontrar a maior e a menor data de inclusão do produto

SELECT MAX(dt_inclu_prod) AS maior_data, MIN(dt_inclu_prod) AS menor_data
FROM produtos;

Para obter a quantidade total de registros na tabela:

SELECT COUNT(*) AS quantidade_registros
FROM produtos;

Para listar todos os produtos que começam com a letra "L"

SELECT *
FROM produtos
WHERE desc_prod LIKE 'L%';


Para calcular a soma dos preços dos produtos totalizados por loja

SELECT loj_prod, SUM(preco_prod) AS total_precos
FROM produtos
GROUP BY loj_prod;

Para trazer a soma dos preços dos produtos totalizados por loja, onde a soma seja maior que R$100.000

SELECT loj_prod, SUM(preco_prod) AS total_precos
FROM produtos
GROUP BY loj_prod
HAVING SUM(preco_prod) > 100000;

QUESTAO 2

Para trazer os campos solicitados da tabela de produtos e estoque para a loja com código 1

SELECT p.loj_prod, l.desc_loj, p.cod_prod, p.desc_prod, p.preco_prod, e.qtd_prod
FROM produtos p
JOIN lojas l ON p.loj_prod = l.loj_prod
LEFT JOIN estoque e ON p.cod_prod = e.cod_prod AND p.loj_prod = e.loj_prod
WHERE p.loj_prod = 1;

Para encontrar os produtos que existem na tabela de produtos mas não na tabela de estoque

SELECT p.cod_prod, p.desc_prod
FROM produtos p
LEFT JOIN estoque e ON p.cod_prod = e.cod_prod AND p.loj_prod = e.loj_prod
WHERE e.cod_prod IS NULL;

Para encontrar os produtos que existem na tabela de estoque mas não na tabela de produtos

SELECT e.cod_prod, p.desc_prod
FROM estoque e
LEFT JOIN produtos p ON e.cod_prod = p.cod_prod AND e.loj_prod = p.loj_prod
WHERE p.cod_prod IS NULL;
