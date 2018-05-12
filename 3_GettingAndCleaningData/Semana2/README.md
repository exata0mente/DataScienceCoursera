# Notas de Aula [Semana 2]

## Lendo de um banco de dados _MySql_

Observação: Irei utilizar o MariaDB.

mysql - livre, amplamente utilizado em diversas aplicações na internet 
estrutura: bd > tabelas > campos.. Cada linha é chamada de registro (_record_)
Uma tabela no bd pode ser correspondente a um data.frame em R

instalar MySql

pacote RMySQL

## Conectando e listando bases, tabelas e campos

Iremos utilizar o repositório online da USCS neste [link](http://genome.ucsc.edu/goldenPath/help/mysql.html).

* Para estabelecer conexão - `dbConnect(drv = MariaDB(), username="genome", host="genome-mysql.cse.ucsc.edu")`
* Envio de query - `dbGetQuery(conn, statement)`
 * Observação: o `statement` é uma *string* com um comando SQL.
* Desconectar do banco - `dbDisconnect(conn)`

É de extrema importância encerrar uma conexão que você não irá mais utilizar.

Lembrando que temos banco de dados -> tabelas -> campos -> registros. No primeiro comando apenas estabelecemos uma conexão com o **servidor** MySQL da UCSC.

* Para estabelecer conexão já em uma base - `dbConnect(drv, username, db, host)
 * Exemplo: `ucscDb <- dbConnect(drv = MariaDB(), username="genome", host="genome-mysql.cse.ucsc.edu")`
* Para listagem de todas as tabelas - `dbListTables(conn)`- retorna um vetor de caracteres.
 * Exemplo: `allTables <- dbListTables(hg19)`
* Para listagem de todos os campos de determinada tabela - `dbListFields(db, "tabela").
 * Exemplo: `dbListFields(hg19, "affyU133Plus2")`

## Lendo um tabela

* Retorna um data.frame com o conteudo da tabela - ´dbReadTable(conn, table, ..)´

## Lendo um subconjunto específico

Atenção. Aqui gera dúvidas.

Para obtermos subconjuntos, utilizamos a função `dbSendQuery(conn, statement,...)`. Então surge a dúvida, qual a diferença entre o dbSendQuery e dbGetQuery?

O `dbGetQuery(conn, statement, ...)` retorna todos os registros existenes na query enviada. Isto pode sobrecarregar a memória do computador se utilizado incorretamete. Seu retorno é um **data.frame**.  
Já o `dbSendQuery(conn, statement, ...)` retornar um objeto com informações do resultado da *query* que podem ser extraído subconjunto a partir do comando `dbFetch(query)`. Podemos então fazer:

    dbFetch(query, n=10)
    


