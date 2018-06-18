library("sqldf")

ss06pid <- "3_GettingAndCleaningData/Semana2/objetos/data/getdata_data_ss06pid.csv"
if(!file.exists(ss06pid))
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",ss06pid)
acs <- read.csv(ss06pid)

pwgtp1Less50 <- sqldf("select pwgtp1 from acs where AGEP < 50")
names(pwgtp1Less50)