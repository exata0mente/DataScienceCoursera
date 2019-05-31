### Ler o dado.
library(readr)
library(dplyr)
ozone <- read_csv("recursos/hourly_44201_2014.csv.bz2",  ## Conforme manual da função: "Files ending in .gz, .bz2, .xz, or .zip will be automatically uncompressed."
                  col_types = "ccccinnccccccncnncccccc",
                  n_max = 15000)                         ## O data set é muito grande!!

names(ozone) <- ozone %>% names() %>% make.names()

### Checar a embalagem
nrow(ozone)
ncol(ozone)

### Executar o str()
str(ozone)

### Olhar o início e o fim do seu dado
ozone %>% select(Latitude, Longitude, Date.Local) %>% head()
ozone %>% select(Latitude, Longitude, Date.Local) %>% tail()

### Valide os seus 'n's
table(ozone$Time.Local)

