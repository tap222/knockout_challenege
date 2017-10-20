setwd('/home/tapas/Downloads/Assignment_Knockout/')
df <- read.csv('wisc_bc_data.csv')
df_t<-df[,c(1,2)]
df<- df[,c(3:32)]
str(df)
standardize<- function(df){
  for(i in 1:length(colnames(df))) {
    if(class(df[,i]) == "numeric" || class(df[,i]) == "integer") {
      df[,i] <- as.vector(scale(df[,i])) }
  }
  return(df)
}
df<- standardize(df)

tr<- df[1:469,]
te<-df[470:569,]

label<-df_t[c(1:469),2]
label_t<-df_t[c(470:569),2]

install.packages('class')
library(class)
install.packages('gmodels')
library(gmodels)

model <- knn(tr, te, label, k = 3, prob=TRUE)

CrossTable(model,label_t, expected = TRUE, format="SAS")
