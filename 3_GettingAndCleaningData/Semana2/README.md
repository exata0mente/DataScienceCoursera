# Notas de Aula [Semana 2]


Observação: A grande maioria dos exemplos aqui expostos foram extraídos dos cursos do Coursera ou do repositório dos conteúdos https://github.com/DataScienceSpecialization/courses/tree/master/03_GettingData

## Lendo de um banco de dados _MySql_

Observação: Irei utilizar o MariaDB.

**Pacote**: [RMariaDB](https://github.com/r-dbi/RMariaDB)

No curso é abordado o MySQL porém optei por utilizar o MariaDB. As sintaxes são basicamente as mesmas, não havendo mudanças nos comandos utilizados na aula.

Um ponto importante é, para esta aula, não é necessário instalar o MySQL pois iremos acessar um servidor remoto. 

No meu caso, precisei instalar uma *cliente library*, conforme explicado no [README](https://github.com/r-dbi/RMariaDB#mysql-client-library) do RMariaDB

## Conectando e listando bases, tabelas e campos

Iremos utilizar o servidor online da UCSC neste [link](http://genome.ucsc.edu/goldenPath/help/mysql.html).

Comandos básicos:
* `dbConnect(drv = MariaDB(), username="genome", host="genome-mysql.cse.ucsc.edu")` - Para estabelecer conexão
* `dbGetQuery(conn, statement)` - Retorna todos os registros da query passada por parâmetro.
 * Observação: o `statement` é uma *string* com um comando SQL.
* `dbDisconnect(conn)` - Desconectar do banco.

É de extrema importância encerrar uma conexão que você não irá mais utilizar.

Lembrando que temos banco de dados -> tabelas -> campos -> registros. No primeiro comando apenas estabelecemos uma conexão com o **servidor** MySQL da UCSC.

* `dbConnect(drv, username, db, host) - Para estabelecer conexão já em uma base
 * Exemplo: `ucscDb <- dbConnect(drv = MariaDB(), username="genome", host="genome-ysql.cse.ucsc.edu")`
* `dbListTables(conn)` - Para listagem de todas as tabelas, retorna um vetor de caracteres.
 * Exemplo: `allTables <- dbListTables(hg19)`
* `dbListFields(db, "tabela") - Para listagem de todos os campos de determinada tabela.
 * Exemplo: `dbListFields(hg19, "affyU133Plus2")`

## Lendo um tabela

* ´dbReadTable(conn, table, ..)´ - Retorna um data.frame com o conteudo da tabela.

## Lendo um subconjunto específico

**Atenção**. Este tópico pode deixar dúvidas.

Para obtermos subconjuntos, utilizamos a função `dbSendQuery(conn, statement,...)`. Então surge a dúvida, qual a diferença entre o dbSendQuery e dbGetQuery?

O `dbGetQuery(conn, statement, ...)` retorna todos os registros existentes na query enviada e salva-o na memória (se associado a alguma variável). Isto pode sobrecarregar a memória do computador caso o conjunto de dados seja grande. Seu retorno é um **data.frame**.

Já o `dbSendQuery(conn, statement, ...)` sincroniza sua query com o servidor de forma que as consultas possam ser realizadas interativamente utilizando o `dbFetch()`. Por exemplo, para trazermos apenas os 10 primeiros resultados de determida `query`, podemos sincronizar com o servidor utilizando o `dbSendQuery(conn, statement = query)` e então enviar o comando de *fetch*:

    dbFetch(query, n=10)

que em SQL seria algo correspondente a `limit 10`.

**Não esquecer de fechar as conexões**

## Considerações

É importante ressaltar que quando acessarmos servidores abertos de banco de dados, usar apenas comandos de consultas (select) e jamais comandos de inserção (insert), atualização (update), mesclagem (join), delete (delete), etc.. Lembre-se, seremos cientistas modernos zelando da reprodutibilidade.
Nestes casos, se necessário manuseamento dos dados, copiá-los a um servidor local.

![mindmap5](recursos/pacote_RMariaDB.png)

## Lendo HDF5

**Pacote**:

Descrição:
* Usado para grandes conjuntos de dados.
* Armazena diversos tipos de dados.
* Formato de dados hierarquicos.
* Um data.frame no R pode ser considerado um elemento no HDFs
* Bastante utilizado na genômica.

## O pacote rhdf5

A instalação recomendada é através do [bioconductor](http://bioconductor.org/)

## Funções de criação

* `h5createFile(file)`: Cria no disco um arquivo hdf5.
* `h5createGroup(file, group): Cria um grupo e subgrupos no arquivo.
* `h5ls(file)`: lista os grupos de um arquivo hdf5.

Veja com a estrutura é como a de um grupo de diretórios

```r
created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

group   name     otype dclass dim
0     /    baa H5I_GROUP           
1     /    foo H5I_GROUP           
2  /foo foobaa H5I_GROUP           
```

## Escrevendo nos grupos

Pode-se utilizar a função `h5write(obj, file, name, ...)`

Alguns exemplos:

```r
A = matrix(1:10,nr=5,nc=2)
h5write(A, "example.h5","foo/A")
B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5","foo/foobaa/B")
h5ls("example.h5")
```

Temos uma matriz, um array, é possível escrever também data.frames compostos:

```r
df = data.frame(1L:5L,seq(0,1,length.out=5),
  c("ab","cde","fghi","a","s"), stringsAsFactors=FALSE)
h5write(df, "example.h5","df")
h5ls("example.h5")
```
## Lendo os dados

A função de leitura é parecida com a de escrita: `h5read(obj, file)`.

## Leitura e escrita em _chunks_ (pedaços) 

Uma das vantagens do arquivo hd5 é que é possível escrever ou ler em "pedaços" por meio do parâmetro `index`. Por exemplo:

```r
C <- matrix(sample(1:5, 8, TRUE), 4, 2)
h5write(C, "example.h5", "/foo/C")
h5read("example.h5", "/foo/C")
     [,1] [,2]
[1,]    3    1
[2,]    3    2
[3,]    5    2
[4,]    5    1
h5write(c(9,9,9,9), "example.h5", "/foo/C", index=list(1:4,2))
h5read("example.h5", "/foo/C")
     [,1] [,2]
[1,]    3    9
[2,]    3    9
[3,]    5    9
[4,]    5    9

```