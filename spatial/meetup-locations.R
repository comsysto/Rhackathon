library("ggplot2")
library("googleVis")
library("ggmap")

dat <- read.csv("../techism-eventdata-20130725.csv")
dat <- na.omit(dat)
mamap <- get_map(location = c(lon = median(dat$location_lng), lat = median(dat$location_lat)), zoom = 11, maptype = "roadmap")
ggmap(mamap) +  geom_point(aes(y = location_lat, x = location_lng), position = "jitter", dat, size = 2) 



