setwd(dir = "~/Projetos/DataScienceCoursera/3_GettingAndCleaningData/Semana3/objetos/data/")

if(!file.exists("fss06hid.csv"))
  download.file(
    url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
    destfile = "~/Projetos/DataScienceCoursera/3_GettingAndCleaningData/Semana3/objetos/data/fss06hid.csv"
  )

df <- read.csv(file = "fss06hid.csv")
(df$ACR == 3 & df$AGS == 6) %>%
  which() %>%
  head(n = 3)
