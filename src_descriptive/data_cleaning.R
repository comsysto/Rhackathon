# read data
temporaryFile <- tempfile()
download.file("https://www.techism.de/static/export/techism-events.csv",destfile=temporaryFile, method="curl")
data <- read.csv(temporaryFile, sep=",", fileEncoding="UTF-8", stringsAsFactors=FALSE)

# fix date format problems
format="%Y-%m-%dT%H:%M:%S"
data$date_time_begin <- as.POSIXlt(data$date_time_begin, format=format)
data$date_time_end <- as.POSIXlt(data$date_time_end, format=format)
data$year <- format(data$date_time_begin, "%Y")

# set empty date_time_end to NA
emptyid <- which( data[, "date_time_end"]=="" )
data[emptyid, "date_time_end"] <- NA

# save data
save(data, file="data/data_clean.Rdata")