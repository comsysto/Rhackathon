# read data
data <- read.csv("data/techism-events-local-tz.csv", 
                 sep=",", fileEncoding="UTF-8", stringsAsFactors=FALSE)

# set empty date_time_end to NA
emptyid <- which( data[, "date_time_end"]=="" )
data[emptyid, "date_time_end"] <- NA

# transform date
format <- "%Y-%m-%dT%H:%M:%S"
tmp <- as.POSIXlt( data[, "date_time_begin"], format=format)
tmp2 <- as.POSIXlt( data[, "date_time_end"], format=format)
data <- cbind(data,date_time_begin_new=tmp,date_time_end_new=tmp2)

save(data, file="data/data_clean.Rdata")