
barplot_movies <- function(data,fill,y,x,title,xlab,ylab){
  
  g <- ggplot(data=my_data, aes(fill=fill, y, x)) + 
    geom_bar(position="dodge", stat="identity") +
    ggtitle(title) +
    theme_classic() +
    ylab (ylab)+
    xlab(xlab)
  
  g
}


