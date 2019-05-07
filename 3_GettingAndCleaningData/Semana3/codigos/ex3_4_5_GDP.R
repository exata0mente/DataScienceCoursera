library(dplyr)
library(tidyr)
obj_dir <- "~/Projetos/DataScienceCoursera/3_GettingAndCleaningData/Semana3/objetos/data/"

ds <- list()
ds$nm_file <- c("gdp", "educational")
ds$url_file <- c("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
                 "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

for (i in 1:length(ds)){
  if(!file.exists(paste0(obj_dir, ds$nm_file[i], ".csv")))
    download.file(
      url = ds$url_file[i],
      destfile = paste0(obj_dir, ds$nm_file[i], ".csv"),
    )
}

df_gdp <- read.csv2(
  file = paste0(obj_dir, ds$nm_file[1], ".csv"), 
  sep = ",", 
  skip = 5,
  nrows = 195,
  header = FALSE,
  stringsAsFactors = FALSE
)
df_edu <- read.csv2(file = paste0(obj_dir, ds$nm_file[2], ".csv"),  sep = ",")

######################### Exercício 3 #########################

df_gdp <- df_gdp %>% 
  select("ShortCode" = V1, 
         "Ranking" = V2, 
         "Economy" = V4, 
         "US Dollar" = V5) %>%
  na.omit()

# Mescla as tabelas pela coluna com valores em comum
m1 <- merge(df_gdp, df_edu, by.x = "ShortCode", by.y = "CountryCode")
m2 <- m1 %>% arrange(Ranking) %>% filter(Ranking == 13) %>% select(ShortCode, Long.Name)

paste(dim(m1)[1], "Matches, 13th country is", m2$Long.Name)

rm(m2)
######################### Exercício 4 #########################

# Os valores numéricos estão sendo apresentados como texto. É necessário realizar este tratamento
# convertendo para numérico (não tão trivial como parece)

tmp <- m1$`US Dollar` %>% 
  gsub(pattern = " ", replacement = "") %>% # Retira os espaços em branco
  gsub(pattern = ",", replacement = "") %>% # Retira as virgulas pois são valores inteiros
  as.factor()

m1 <- m1 %>%mutate(`US Dollar` = as.numeric(levels(tmp))[tmp])
m1 %>% group_by(Income.Group) %>%
  summarise(mean = mean(Ranking)) %>%
  filter(Income.Group %in% c('High income: OECD', 'High income: nonOECD'))

rm(tmp)
######################### Exercício 5 #########################
m1$Ranking %>% quantile()
tmp <- m1 %>% filter(Ranking <= 38 & Income.Group == 'Lower middle income')
