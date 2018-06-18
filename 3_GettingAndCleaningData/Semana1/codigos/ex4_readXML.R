if(!file.exists("data")){
  dir.create("data")
}

require("XML")

urlFile = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(urlFile,destfile = "data/restaurants.xml")

xmlData <- xmlTreeParse("data/restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(xmlData)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcodes=="21231")