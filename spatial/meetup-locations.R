library("ggplot2")
library("googleVis")
library("ggmap")

dat <- read.csv("../data/techism-eventdata-20130725.csv")
dat <- na.omit(dat)

format="%Y-%m-%dT%H:%M:%S+00:00"
dat$date_time_begin <- as.POSIXlt(dat$date_time_begin, format=format)
dat$date_time_begin <- as.POSIXlt(dat$date_time_end, format=format)
dat$year <-    format(dat$date_time_begin, "%Y")
tail(dat)

mamap <- get_map(location = c(lon = median(dat$location_lng), lat = median(dat$location_lat)), zoom = 12, maptype = "hybrid")
ggmap(mamap) +
    stat_density2d(geom = "polygon", aes(y = location_lat, x = location_lng, fill = ..level.., alpha = ..level..), dat) +
    scale_alpha(range = c(.1, .5), guide = FALSE) +
    geom_point(aes(y = location_lat, x = location_lng), dat, size = 1) +
    facet_grid(.~ year)







