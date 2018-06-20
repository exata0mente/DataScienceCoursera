# Notas de Aula [Semana 3]

## Subconjuntos (subsettig)

### Rápida revisão.

Tendo o código

```r
set.seed(13435)
X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5),]
X$var2[c(1,3)] = NA
X
```

```r
  var1 var2 var3
1    2   NA   15
4    1   10   11
2    3   NA   12
3    5    6   14
5    4    9   13
```
Podemos extrair os seguintes subconjuntos

```r
```
```r
X[,1] # Um vetor com o conteúdo da primeira coluna
```
```r
X[,"var1"] # Um vetor com o conteúdo da coluna de nome "var1", neste caso também a primeira coluna
```
```r
X[1:2,"var2"] # Um vetor com o conteúdo da primeira até a segunda linha da coluna "var2"
```
```r
X[(X$var1 <= 3 & x$var3 > 11),] # Um tipo de data.frame com as linhas onde apenas os valores atendam
                                # a comparação lógica 
```
```r
X[which(X$var2 > 8),] # Um vetor com o conteúdo da coluna "var2" onde apenas haja resultados válidos
```
Sobre este último subconjunto, utilizamos a função `which()`. Esta função retorna o índice de um vetor em que o valor seja `TRUE`. Na coluna "var2" temos dois registros que são `NA`. Se fizermos apenas o `X$var2 > 8` teriamos o seguinte retorno:

```r
[1]    NA  TRUE    NA FALSE  TRUE
```
Desta forma, o resultado do subconjunto seria todas as linhas em que o resultado é TRUE (2 e 5) e NA para as linhas 1 e 3:
```r
X[X$var2 > 8,]
```

```r
     var1 var2 var3
NA     NA   NA   NA
4       1   10   11
NA.1   NA   NA   NA
5       4    9   13
```

Utilizando o comando `which()` os valores `NA` são ignorados trazendo apenas os índices dos resultados TRUE, ou seja, linhas 2 e 5.

## Ordenando

- `sort(vet)` - ordena um vetor em ordem crescente.
- `sort(vet, decreasing=TRUE)` - ordena um vetor em ordem decrescente.
- `sort(vet, na.last=TRUE)` - ordena um vetor em ordem crescente mantendo os NAs nas últimas posições.

A função `sort()` recebe como parâmetro um vetor, ou seja, não é possível ordenar arbritariamente um data.frame. Precisamos definir uma variável (coluna) em que o data.frame deverá ser ordenado. Utilizamos a função `order()` no subconjunto de um data.frame.

Com os exemplos anteriores:

```r
X[order(X$var1),] # ordena em ordem crescente da coluna "var1"
X[order(X$var1,X$var3),] # ordena em ordem crescente da coluna "var1", em seguida a coluna "var3"
```
### Ordenando com plyr

Pacote **plyr**

- `arrange(df,var)` - ordena, em ordem crescente, um data.frame df de acordo com a coluna var.
- `arrange(df,desc(var))` - ordena, em ordem decrescente, um data.frame df de acordo com a coluna var.

## Adicionando linhas e colunas

```r
X$var4 <- rnorm(5)  # adiciona, se não existir, uma coluna de nome "var4" e associa os valores retornados da função `rnorm(5)`
                    # lembrando que o retorno tem que ser da mesma dimensão das linhas do data.frame
```
```r
Y <- cbind(X,rnorm(5)) # adiciona à variável Y o conteúdo de X (df) e adiciona uma nova coluna com o valor do `rnorm(5)`
```

### Dicas do Peng

[Notas de Aulas de Andrew Jaffe](http://www.biostat.jhsph.edu/%7Eajaffe/lec_winterR/Lecture%202.pdf)

![mindmap8](recursos/subset_order.png)