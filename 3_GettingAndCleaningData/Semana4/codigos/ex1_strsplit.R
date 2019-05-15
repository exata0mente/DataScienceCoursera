library(dplyr)

obj_dir <- "/home/bezerra/Projetos/DataScienceCoursera/3_GettingAndCleaningData/Semana4/"
obj_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
obj_path <- paste0(obj_dir,"recursos/Fss06hid.csv")

if(!file.exists(obj_path))
  download.file(url = obj_url, destfile = obj_path)

df <- read.csv(file = obj_path, sep = ",", stringsAsFactors = FALSE)
splitnames <- df %>% names() %>% strsplit(split = 'wgtp')
splitnames[[123]] %>% print()

