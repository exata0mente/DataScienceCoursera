library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

library(lubridate)
sampleTimes %>% lubridate::year() %>% table()
wdaysSampleTimes <- sampleTimes[year(sampleTimes) == 2012] %>% lubridate::wday()
sum(wdaysSampleTimes == 2)
