if(!file.exists("data")){
  dir.create("data")
}

require("data.table")

urlFile = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(urlFile,destfile = "data/housing2006.csv")

DT <- fread("data/housing2006.csv")
