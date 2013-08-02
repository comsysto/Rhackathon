library("ggplot2")
library("googleVis")
library("ggmap")

#loading data
load("data//data_clean.Rdata")
data <- na.omit(data)

# creating plot
mamap <- get_map(location = c(lon = median(data$location_lng), lat = median(data$location_lat)), zoom = 12, maptype = "hybrid")
ggmap(mamap) +
    stat_density2d(geom = "polygon", aes(y = location_lat, x = location_lng, fill = ..level.., alpha = ..level..), data) +
    scale_alpha(range = c(.1, .5), guide = FALSE) +
    geom_point(aes(y = location_lat, x = location_lng), data, size = 1) +
    facet_grid(.~ year)
