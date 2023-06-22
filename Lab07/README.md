# BD: Guião 7


## ​7.2 
 
### *a)*

```
Está na Primeira Forma Normal pois não contém atributos compostos ou multivalor (são todos atómicos), nem relações dentro de relações (nested relations). Porém contém dependências parciais (excluindo a hipótese de 2FN e 3FN)
```

### *b)* 

```
2FN:
Livro(__Titulo_Livro__, __Nome_Autor__, Tipo_Livro, Preco, NoPaginas, Editor, Endereco_Editor Ano_Publicacao)

Autor(__Nome_Autor__, Afiliacao_Autor)	

Assim, a tabela é decomposta de forma a que as dependêcias parciais são retiradas para uma nova tabela, separando Livro e Autor

---

3FN:
Livro(__Titulo_Livro__, __Nome_Autor__, Tipo_Livro, Preco, NoPaginas, Ano_Publicacao)

Autor(__Nome_Autor__, Afiliacao_Autor)

Editor(__Editor__, Endereco_Editor)


Assim, a tabela é decomposta de forma a que as dependêcias parciais e transitivas sejam retiradas para novas tabelas, separando Livro, Autor e Editor.

```




## ​7.3
 
### *a)*

```
{A,B}
```


### *b)* 

```
R1(A,B,C)
R2(A,D,E,I,J)
R3(B,F,G,H)
```


### *c)* 

```
R1(A,B,C)

R2_1(A,D,E)
R2_2(D,I,J)

R3_1(B,F)
R3_2(F,G,H)
```


## ​7.4
 
### *a)*

```
{A,B}
```


### *b)* 

```
R1(A,B,C,D)
R2(D,E)
```


### *c)* 

```
R1(A,B,C,D)
R2(D,E)
R3(C,A)

A deixa de ser chave.
```



## ​7.5
 
### *a)*

```
{A, B}
```

### *b)* 

```
R1({A, C}, {D}) 
R2({A, B}, {C, E})
```


### *c)* 

```
R1({A, B}, {C}),
R2({A}, {D, E})
R3({C}, {D})
```

### *d)* 

```
R1({A, B, C})
R2({A, B, D, E})
```
