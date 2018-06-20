if(!file.exists("data")){
  dir.create("data")
}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url = url, destfile = "data/wksst8110.for")

# Ignora as primeiras 28 colunas e conta 4 apartir das ignoradas.
colsWidth <- c(-28, 4)
# skip = 4 para pularmos os cabeçalhos
wksst8119 <- read.fwf(file = "data/wksst8110.for", skip = 4, widths = colsWidth)
sum(wksst8119[,1])