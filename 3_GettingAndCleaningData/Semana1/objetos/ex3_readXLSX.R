if(!file.exists("data")){
  dir.create("data")
}

require("xlsx")

urlFile = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(urlFile,destfile = "data/getdata_data_DATA.gov_NGAP")

dat <- read.xlsx("data/getdata_data_DATA.gov_NGAP.xlsx",
                 sheetIndex = 1, 
                 rowIndex = 18:23, 
                 colIndex = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T)
