if(!file.exists("data")){
  dir.create("data")
}

require("data.table")

urlFile = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(urlFile,destfile = "data/housingII2006.csv")

DT <- fread("data/housingII2006.csv")
