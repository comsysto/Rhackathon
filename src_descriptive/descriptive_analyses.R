load("data/data_clean.Rdata")

# which time the most meetup
time_start <- format(data[, "date_time_begin"], "%X")
sort( table(time_start) )
time_end <- format(data[, "date_time_end"], "%X")
sort( table(time_end) )

# how long is a meetup
runtime <- as.numeric( data[, "date_time_end"] - data[, "date_time_begin"] )/60
sort(table(runtime))
summary(runtime)

# best weekday
weekday <- format(data[, "date_time_begin"], "%A")
table(weekday)
hist(as.numeric(as.factor(weekday)), axes=FALSE, xlab="weekdays")
axis(1, seq(1,7,1), levels(as.factor(weekday) ))