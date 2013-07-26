load("data//data_clean.Rdata")

# wordloud for tags
library(wordcloud)

tags <- data[, "tags"]

tags <- unlist( strsplit(tags, "\\|") )

sort(table(tags))

wordcloud(tags)

