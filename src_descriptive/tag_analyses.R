load("data//data_clean.Rdata")

# wordloud for tags
library(wordcloud)

tags <- data[, "tags"]
tags <- unlist( strsplit(tags, "\\|") )
sort(table(tags))
wordcloud(tags)

#time analyses for tags
tags <- data[, c("tags", "date_time_begin_new")]
# remove empty entries
id <- which( tags== "")
tags <- tags[-id, ]

tags_new <- NULL
for( i in 1:dim(tags)[1]){
  
  #print(tags[i,])
  if( length( grep("\\|", tags[i,]) ) !=0 ){
    #print("split")
    tmp <- unlist( strsplit(tags[i,1], "\\|") )
    #print(tmp)
    for ( j in tmp){
      #print(c(j, tags[i,2]))
      tags_new <- rbind(tags_new, c(j, as.character(tags[i,2])))
    }
  } else{
    tags_new <- rbind(tags_new,  tags[i,])
  }
  #print(tags_new)
}


sort( table( format(tags_new[,2], "%x") ) )


id <- which( tags_new[,1] == "ccc")
date <- tags_new[id,2]
plot(date)


