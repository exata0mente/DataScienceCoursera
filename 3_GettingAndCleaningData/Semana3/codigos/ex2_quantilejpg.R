library(jpeg)

obj_dir <- "~/Projetos/DataScienceCoursera/3_GettingAndCleaningData/Semana3/objetos/data/"
url_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
nm_file <- "jeff.jpg"

if(!file.exists(nm_file))
  download.file(
    url = url_file,
    destfile = paste0(obj_dir, nm_file),
  )

paste0(obj_dir, nm_file) %>% # Caminho completo do arquivo baixado
  jpeg::readJPEG(native = TRUE) %>%
  quantile(c(0.3, 0.8))