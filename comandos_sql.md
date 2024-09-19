O comando **SELECT** em SQL é um dos mais poderosos e versáteis, permitindo a recuperação de dados de um banco de dados. Aqui estão os principais parâmetros e cláusulas que podem ser usados com o comando SELECT e seus significados:

### Parâmetros e Cláusulas do SELECT

1. **SELECT**: Especifica as colunas que você deseja recuperar.
   ```sql
   SELECT coluna1, coluna2 FROM tabela;
   ```

2. **FROM**: Especifica a tabela de onde os dados serão recuperados.
   ```sql
   SELECT coluna1 FROM tabela;
   ```

3. **WHERE**: Filtra os registros com base em uma condição.
   ```sql
   SELECT coluna1 FROM tabela WHERE condição;
   ```

4. **GROUP BY**: Agrupa os registros com base em uma ou mais colunas.
   ```sql
   SELECT coluna1, COUNT(*) FROM tabela GROUP BY coluna1;
   ```

5. **HAVING**: Filtra grupos de registros após a aplicação do GROUP BY.
   ```sql
   SELECT coluna1, COUNT(*) FROM tabela GROUP BY coluna1 HAVING COUNT(*) > 1;
   ```

6. **ORDER BY**: Ordena os registros em ordem ascendente (ASC) ou descendente (DESC).
   ```sql
   SELECT coluna1 FROM tabela ORDER BY coluna1 ASC;
   ```

7. **JOIN**: Combina registros de duas ou mais tabelas com base em uma condição relacionada.
   - **INNER JOIN**: Retorna registros que têm correspondência em ambas as tabelas.
     ```sql
     SELECT a.coluna1, b.coluna2 FROM tabela1 a INNER JOIN tabela2 b ON a.coluna_comum = b.coluna_comum;
     ```
   - **LEFT JOIN**: Retorna todos os registros da tabela à esquerda e os registros correspondentes da tabela à direita.
     ```sql
     SELECT a.coluna1, b.coluna2 FROM tabela1 a LEFT JOIN tabela2 b ON a.coluna_comum = b.coluna_comum;
     ```
   - **RIGHT JOIN**: Retorna todos os registros da tabela à direita e os registros correspondentes da tabela à esquerda.
     ```sql
     SELECT a.coluna1, b.coluna2 FROM tabela1 a RIGHT JOIN tabela2 b ON a.coluna_comum = b.coluna_comum;
     ```
   - **FULL JOIN**: Retorna todos os registros quando há uma correspondência em uma das tabelas.
     ```sql
     SELECT a.coluna1, b.coluna2 FROM tabela1 a FULL JOIN tabela2 b ON a.coluna_comum = b.coluna_comum;
     ```

8. **DISTINCT**: Remove duplicatas e retorna apenas registros únicos.
   ```sql
   SELECT DISTINCT coluna1 FROM tabela;
   ```

9. **LIMIT**: Especifica o número máximo de registros a serem retornados.
   ```sql
   SELECT coluna1 FROM tabela LIMIT 10;
   ```

10. **OFFSET**: Especifica o número de registros a serem ignorados antes de começar a retornar os registros.
    ```sql
    SELECT coluna1 FROM tabela LIMIT 10 OFFSET 5;
    ```

11. **UNION**: Combina os resultados de duas ou mais consultas SELECT.
    ```sql
    SELECT coluna1 FROM tabela1 UNION SELECT coluna1 FROM tabela2;
    ```

12. **SUBQUERIES**: Consultas aninhadas dentro de outra consulta.
    ```sql
    SELECT coluna1 FROM tabela WHERE coluna2 IN (SELECT coluna2 FROM tabela2 WHERE condição);
    ```







#### Fonte conversa com o Copilot, 11/09/2024
(1) SQL SELECT: Um Guia para Iniciantes em SQL - DevMedia. https://www.devmedia.com.br/sql-select-guia-para-iniciantes/29530.

(2) Guia Completo(Com Exemplos): SQL SELECT e SELECT WHERE - Covil do Dev. https://www.covildodev.com.br/artigo/select-sql.

(3) Como aprender a declaração SELECT em SQL - LearnSQL.com.br. https://learnsql.com.br/blog/como-aprender-a-declaracao-select-em-sql/.

(4) SQL SELECT - Introdução ao comando Select - Curso de SQL - Aula 12. https://www.youtube.com/watch?v=rbMTbONNV9k.

(5) SQL SERVER - 09 - SELECT - Tudo o que você precisa saber. https://www.youtube.com/watch?v=tzD23cgmA0s.

(6) Comando SELECT: O que é e como usar para consultar dados em SQL [2023]. https://bing.com/search?q=todos+os+par%c3%a2metros+do+comando+SELECT+em+SQL+e+o+que+significa+cada+um.
