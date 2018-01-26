# Utilizaremos o conjunto de dados United States National Oceanographic and Atmospheric Administration

link_dados <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url = link_dados, destfile = "file.txt")

# Definição da largura de cada coluna. Utilizar um editor de texto para contagem das coluna
larguras <- c(10, 9, 4, 9, 4, 9, 4, 9, 4)
# Definição dos nomes da coluna, apenas para melhor compreensão dos dados
nome_colunas <- c("Semana", "nino1_sst", "nino1_ssta", "nino2_sst", "nino2_ssta", "nino3_sst", "nino3_ssta", "nino4_sst", "nino4_ssta")

# O conjunto de dados no arquivo texto pode ser separado por colunas de tamanho fixo. A melhor forma de fazer esta separação
# já transformando os dados em um "data frame" é utilizar a função read.fwf(), onde:
#
# file: É o arquivo local onde o conjunto de dados foi salvo
# widths: É onde deve ser seperado a(s) coluna(s). No nosso caso usamos um vetor atribuido a variável "larguras"
# skip: Iniciar a leitura do arquivo apartir da linha x. Pulamos inclusive o cabeçalho do arquivo
# col.names: Nome(s) a ser(em) atribuído(s) ao data frame.

data_fwf <- read.fwf(file = "file.txt", widths = larguras, skip = 4, col.names = nome_colunas)

sum(data_fwf[,4])

# Referências:
# 
# https://pt.stackoverflow.com/questions/8056/apply-sapply-mapply-lapply-vapply-rapply-tapply-replicate-aggregate-by-e
# https://github.com/lgreski/datasciencectacontent/blob/master/markdown/cleaningData-week2Q5.md