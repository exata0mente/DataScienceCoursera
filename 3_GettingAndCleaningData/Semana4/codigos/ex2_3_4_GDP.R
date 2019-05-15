library(dplyr)
library(stringr)

obj_dir <- "/home/bezerra/Projetos/DataScienceCoursera/3_GettingAndCleaningData/Semana4/"
obj_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
obj_path <- paste0(obj_dir,"recursos/gdp.csv")

if(!file.exists(obj_path))
  download.file(url = obj_url, destfile = obj_path)

df <- read.csv2(
  file = obj_path, 
  sep = ",", 
  skip = 5,
  nrows = 190,
  header = FALSE,
  stringsAsFactors = FALSE
)

df <- df %>% 
  select("ShortCode" = V1, 
         "Ranking" = V2, 
         "Economy" = V4, 
         "US Dollar" = V5) %>%
  na.omit()

############################ Exercício 2 ############################

df$`US Dollar` %>% 
  str_trim() %>%  # Retira os espações em branco
  gsub(pattern = ",", replacement = "") %>% # Retira as virgulas que estão sendo usadas como separador de centenas
  as.numeric() %>% # Converte para numérico
  mean() %>% # Faz a média 
  print()


############################ Exercício 3 ############################

df <- df %>% rename("countryName" = Economy)

############################ Exercício 4 ############################
library(lubridate)
df2 <- read.csv2(file = paste0(obj_dir, "recursos/educational.csv"), sep = ",")

dfMerge <- merge(df, df2, by.x = "ShortCode", by.y = "CountryCode")
dfMerge %>% sapply(function(x){a <- grep(x = x, pattern = "fiscal", ignore.case = TRUE)})
# Aqui podemos ver quais das listas possuem a expressão regular "fiscal"

tmp <- dfMerge %>% filter(Special.Notes != "") %>% select(Special.Notes)
tmp[[1]] %>% 
  grep(pattern = "fiscal year end", ignore.case = TRUE, value = TRUE) %>%
  grep(pattern = "June") %>% 
  length() %>%
  print()

rm(tmp)