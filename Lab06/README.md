# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
select * from authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
select au_fname, au_lname, phone from authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
select au_fname, au_lname, phone from authors order by au_fname, au_lname
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
select au_fname as first_name, au_lname as last_name, phone as telephone from authors order by au_fname, au_lname
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
select au_fname as first_name, au_lname as last_name, phone as telephone 
from authors 
where state = 'CA' and au_lname != 'Ringer'
order by au_fname, au_lname
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
select pub_id, pub_name from publishers
where pub_name like '%Bo%'
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
select distinct pub_name as nome_editora 
from publishers, titles
where type = 'Business'
```

### *h)* Número total de vendas de cada editora; 

```
select pub_name, sum(ytd_sales) as total_sales
from publishers, titles
where titles.pub_id = publishers.pub_id
group by pub_name

```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
select pub_name, title, sum(ytd_sales) as total_sales
from publishers, titles
where publishers.pub_id = titles.pub_id
group by pub_name, title
order by pub_name

```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
select title as titles_on_bookbeat
from titles, sales, stores
where titles.title_id = sales.title_id and sales.stor_id = stores.stor_id and stor_name = 'Bookbeat'
order by title
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
select au_fname, au_lname, COUNT(DISTINCT type) as num_differentTypes
FROM titleauthor, authors, titles
WHERE titleauthor.au_id = authors.au_id AND titles.title_id = titleauthor.title_id
GROUP BY au_fname, au_lname
HAVING COUNT(DISTINCT type) > 1;

```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
select type as tipo_livro, pub_name as editora, avg(titles.price) as media_preço, sum(ytd_sales) as total_vendas
from titles join publishers on titles.pub_id = publishers.pub_id
group by type, pub_name
having avg(titles.price) is not null;
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
select title, advance, average
FROM titles JOIN (select titles.type, AVG(advance) as average
				  FROM titles
				  WHERE advance IS NOT NULL
				  GROUP BY titles.type) AS grp
	ON titles.type = grp.type AND advance > 1.5*average;
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
select title, au_fname+' '+au_lname as name, sum(ytd_sales) as money_made
from authors join titleauthor on authors.au_id = titleauthor.au_id join titles on titles.title_id = titleauthor.title_id join sales on titles.title_id = sales.title_id
group by title, au_fname+' '+au_lname
order by title, au_fname+' '+au_lname
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
select DISTINCT titles.title, ytd_sales, 
				ytd_sales*price as facturacao,
				ytd_sales*royalty*price/100 as auths_revenue,
				ytd_sales*price*(100-royalty)/100 as pub_revenue
FROM titles, sales
WHERE titles.title_id = sales.title_id;
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
select DISTINCT titles.title, au_fname+' '+au_lname as name, ytd_sales, 
				ytd_sales*price as facturacao,
				ytd_sales*royalty*price/100 as auths_revenue,
				ytd_sales*price*(100-royalty)/100 as pub_revenue
FROM titles, sales, titleauthor, authors
WHERE titles.title_id = sales.title_id and titles.title_id = titleauthor.title_id and titleauthor.au_id = authors.au_id;
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
select stor_name, COUNT(DISTINCT title) as different
FROM stores, sales, titles
WHERE stores.stor_id = sales.stor_id AND sales.title_id = titles.title_id
GROUP BY stor_name
HAVING COUNT(DISTINCT title) = (select COUNT(title) FROM titles) ;
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
select stor_name, sum(qty) AS sum_qty
FROM sales JOIN stores
ON sales.stor_id=stores.stor_id
GROUP BY stor_name
HAVING sum(qty) > (	select avg(sum_qty)
						FROM (	select sum(qty) AS sum_qty, stor_id AS stid
								FROM sales
								GROUP BY stor_id) as T
					);
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
select title 
FROM titles
EXCEPT
select title
FROM titles, stores, sales
WHERE stores.stor_id = sales.stor_id AND titles.title_id = sales.title_id AND stores.stor_name = 'Bookbeat';
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
(select pub_name, stor_name
FROM stores, publishers )
EXCEPT
(select pub_name, stor_name
FROM publishers JOIN (	select pub_id AS ppid, sales.stor_id, stor_name
						FROM titles JOIN sales
						ON titles.title_id=sales.title_id
						JOIN stores
						ON sales.stor_id=stores.stor_id) AS T			
ON pub_id=ppid);
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT Ssn, Fname, Lname, Pno FROM (Business.dbo.WORKS_ON 
	JOIN Business.dbo.EMPLOYEE ON Essn=Ssn);
```

##### *b)* 

```
SELECT Employee1.Fname FROM (Business.dbo.EMPLOYEE AS Employee1 
	JOIN Business.dbo.EMPLOYEE AS Employee2 ON Employee1.Super_ssn=Employee2.Ssn) 
WHERE Employee2.Fname='Carlos' AND Employee2.Lname='Gomes';
```

##### *c)* 

```
SELECT sum(Hours) AS HorasSemana, Pname FROM (Business.dbo.PROJECT 
	JOIN Business.dbo.WORKS_ON ON Pnumber=Pno) 
GROUP BY Pname;
```

##### *d)* 

```
SELECT Fname, Lname FROM (Business.dbo.EMPLOYEE 
	JOIN (Business.dbo.PROJECT 
		JOIN Business.dbo.WORKS_ON ON Pnumber=Pno) ON Ssn=Essn ) 
WHERE Hours > 20 AND Dno = 3;
```

##### *e)* 

```
SELECT Fname FROM (Business.dbo.EMPLOYEE 
	LEFT OUTER JOIN Business.dbo.WORKS_ON ON Ssn=Essn) 
WHERE Essn IS NULL
```

##### *f)* 

```
SELECT Dname, avg(Salary) AS AvgFSalary FROM (Business.dbo.EMPLOYEE 
	JOIN Business.dbo.DEPARTMENT ON Dnumber=Dno) 
WHERE Sex='F' 
GROUP BY Dname;
```

##### *g)* 

```
SELECT Fname, Lname, count(Dependent_name) AS DepNumber FROM (Business.dbo.EMPLOYEE 
	JOIN Business.dbo.DEPENDENT ON Ssn=Essn) 
GROUP BY Fname, Lname HAVING count(Dependent_name) > 2;
```

##### *h)* 

```
SELECT Fname, Lname, Super_ssn, Mgr_ssn FROM (Business.dbo.EMPLOYEE 
	JOIN Business.dbo.DEPARTMENT ON Ssn=Mgr_ssn) 
WHERE Super_ssn is null
```

##### *i)* 

```
SELECT Fname, Address FROM (((Business.dbo.Works_on 
	JOIN Business.dbo.EMPLOYEE ON Ssn=Essn) 
JOIN Business.dbo.Dept_locations ON Dno=Dnumber) 
JOIN Business.dbo.Project ON Pno=Pnumber) 
WHERE Dlocation!='Aveiro' AND Plocation='Aveiro'
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT NIF,Nome FROM (Stocks.dbo.ENCOMENDA 
RIGHT OUTER JOIN Stocks.dbo.FORNECEDOR ON NIF=NIF) 
WHERE numero_encomenda IS NULL
```

##### *b)* 

```
SELECT codigo_produto, avg(quantidade) AS MediaDeUnidades FROM (
	Stocks.dbo.PRODUTO JOIN Stocks.dbo.CONTEM ON codigo=codigo_produto) 
GROUP BY codigo_produto; 
```


##### *c)* 

```
SELECT avg(quantidade) AS NumProdutos FROM Stocks.dbo.CONTEM 
GROUP BY numero_encomenda;
```


##### *d)* 

```
SELECT f.nome as NomeFornecedor, p.nome as NomeProduto, c.quantidade as QuantidadeFornecida FROM FORNECEDOR f
INNER JOIN ENCOMENDA e ON f.NIF = e.NIF_fornecedor
INNER JOIN CONTEM c ON e.numero_encomenda = c.numero_encomenda
INNER JOIN PRODUTO p ON c.codigo_produto = p.codigo
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT Prescricao_Meds.dbo.PACIENTE.numUtente, Prescricao_Meds.dbo.PACIENTE.nome FROM Prescricao_Meds.dbo.PACIENTE
LEFT JOIN Prescricao_Meds.dbo.PRESCRICAO ON Prescricao_Meds.dbo.PACIENTE.numUtente = Prescricao_Meds.dbo.PRESCRICAO.numUtente
WHERE Prescricao_Meds.dbo.PRESCRICAO.numPresc IS NULL
```

##### *b)* 

```
SELECT Prescricao_Meds.dbo.MEDICO.especialidade, COUNT(*) AS num_prescricoes FROM Prescricao_Meds.dbo.MEDICO
	JOIN Prescricao_Meds.dbo.PRESCRICAO ON Prescricao_Meds.dbo.MEDICO.numSNS = Prescricao_Meds.dbo.PRESCRICAO.numMedico
GROUP BY Prescricao_Meds.dbo.MEDICO.especialidade
```


##### *c)* 

```
SELECT Prescricao_Meds.dbo.FARMACIA.nome AS nome_farmacia, COUNT(*) AS num_prescricoes FROM Prescricao_Meds.dbo.PRESCRICAO
	JOIN Prescricao_Meds.dbo.FARMACIA ON Prescricao_Meds.dbo.PRESCRICAO.nome_farmacia = Prescricao_Meds.dbo.FARMACIA.nome
GROUP BY Prescricao_Meds.dbo.FARMACIA.nome
```


##### *d)* 

```
SELECT Prescricao_Meds.dbo.FARMACO.nome AS nome_farmaco FROM Prescricao_Meds.dbo.FARMACO
WHERE Prescricao_Meds.dbo.FARMACO.numRegFarm = 906
AND NOT EXISTS (SELECT * FROM Prescricao_Meds.dbo.PRESC_FARMACO WHERE Prescricao_Meds.dbo.PRESC_FARMACO.numRegFarm = FARMACO.numRegFarm)
```

##### *e)* 

```
SELECT Prescricao_Meds.dbo.FARMACIA.nome AS nome_farmacia, Prescricao_Meds.dbo.FARMACEUTICA.nome AS nome_farmaceutica, COUNT(DISTINCT Prescricao_Meds.dbo.FARMACO.numRegFarm) AS num_farmacos_vendidos FROM Prescricao_Meds.dbo.FARMACIA
	JOIN Prescricao_Meds.dbo.PRESCRICAO ON Prescricao_Meds.dbo.PRESCRICAO.nome_farmacia = Prescricao_Meds.dbo.FARMACIA.nome
	JOIN Prescricao_Meds.dbo.PRESC_FARMACO ON Prescricao_Meds.dbo.PRESCRICAO.numPresc = Prescricao_Meds.dbo.PRESC_FARMACO.numPresc
	JOIN Prescricao_Meds.dbo.FARMACO ON Prescricao_Meds.dbo.PRESC_FARMACO.numRegFarm = Prescricao_Meds.dbo.FARMACO.numRegFarm
	JOIN Prescricao_Meds.dbo.FARMACEUTICA ON Prescricao_Meds.dbo.FARMACO.numRegFarm = Prescricao_Meds.dbo.FARMACEUTICA.numReg
GROUP BY FARMACIA.nome, FARMACEUTICA.nome
```

##### *f)* 

```
SELECT DISTINCT Prescricao_Meds.dbo.PACIENTE.*
FROM Prescricao_Meds.dbo.PACIENTE
JOIN (
  SELECT numUtente
  FROM Prescricao_Meds.dbo.PRESCRICAO
  GROUP BY numUtente
  HAVING COUNT(DISTINCT numMedico) > 1
) AS P
ON Prescricao_Meds.dbo.PACIENTE.numUtente = P.numUtente;
```
