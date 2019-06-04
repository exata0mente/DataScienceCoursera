library(readr)
library(dplyr)

## Lendo o arquivo
class <- c("numeric", "character", "factor", "numeric", "numeric")
pollution <- read.csv(file = "recursos/avgpm25.csv",colClasses = class)

## Dando uma olhada na embalagem

head(pollution)
tail(pollution)

## Vamos dar uma olhada na estrutura do dataset

str(pollution)

## Resumos simples

## Five-number Summary
fivenum(pollution$pm25)
summary(pollution$pm25)

## Boxplots
boxplot(pollution$pm25, col = "blue")

library(maps)
map("county", "california")
with(dplyr::filter(pollution, pm25 > 15), points(longitude, latitude))

## Histograma
hist(pollution$pm25, col = 'green')
rug(pollution$pm25)


hist(pollution$pm25, col = 'green', breaks = 100)
rug(pollution$pm25)

## Overlaying Features
boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = 'green')
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

### Barplot
table(pollution$region) %>% barplot(col = "wheat")

## Resumos de duas dimensões
## Multiplos boxplots
boxplot(pm25 ~ region, data = pollution, col = "red")

## Multiplus gráficos de barras
par(mfrow = c(2,1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

## Gráfico de dispersão
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2)

with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)

## Múltiplos gráficos de dispersão

par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))
