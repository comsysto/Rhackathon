# read data
data <- read.csv("data/techism-eventdata-20130725.csv", 
                 sep=",", fileEncoding="UTF-8", stringsAsFactors=FALSE)

# set empty date_time_end to NA
emptyid <- which( data[, "date_time_end"]=="" )
data[emptyid, "date_time_end"] <- NA

# transform date
format <- "%Y-%m-%dT%H:%M:%S+00:00"
tmp <- as.POSIXlt( data[, "date_time_begin"], format=format)
tmp2 <- as.POSIXlt( data[, "date_time_end"], format=format)
data <- cbind(data,date_time_begin=tmp,date_time_end=tmp2)

save(data, file="data_clean.Rdata")