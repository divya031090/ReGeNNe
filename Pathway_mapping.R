pathway_mapping<-read.csv("/Users/divvi/Documents/Survival LSTM/Jasper/pathway_mapping_R.csv",header = TRUE, stringsAsFactors = FALSE,sep=",")
geneset<-read.csv("/Users/divvi/Documents/Survival LSTM/Jasper/geneset.csv",header = TRUE, stringsAsFactors = FALSE,sep=",")

geneset$OccurrenceIndex <-  match(geneset$sample, pathway_mapping[,])

for (i in 1:10)
{
for (row in 1: nrow(pathway_mapping))
  {
  
  for (col in 1:ncol(pathway_mapping))
  {
   
  if (pathway_mapping[row,col] == geneset$sample[i])
  {
  print(row)
  }
  }
  }
}
    
geneset["UBE2Q1" %in% pathway_mapping[1:1377,],  ]

for (i in 1:ncol(pathway_mapping))
{
if(match('UBE2Q1',pathway_mapping[,i])
break
}

pathway_mapping[pathway_mapping=='UBE2Q1',]


which(pathway_mapping==geneset[1,1], arr.ind=TRUE)
indexarray<-NULL
for (i in 1:10)
{
  indexarray[i]<-list(which(pathway_mapping==geneset[i,1], arr.ind=TRUE)[,1])
}


#heatmap

pathway_transform<-read.csv("pathway_ztransform.csv",header = TRUE, stringsAsFactors = FALSE,sep=",")

heatmap_pathway_transform=data.matrix(pathway_transform[1:10,2:100], rownames.force = NA)

corr_mat=cor(t(heatmap_pathway_transform),method="pearson",use = "complete.obs")

library(reshape2)
co=melt(corr_mat)
head(co)

hp<-ggplot((co), aes(Var1, Var2)) + # x and y axes => Var1 and Var2
  geom_tile(aes(fill = value)) + # background colours are mapped according to the value column
  # write the values
  scale_fill_gradient2(breaks=c(1,0.425,-0.15), labels=c("High", "Mid", "Low")) + # determine the colour
  
  
  ggtitle("Correlation Plot") + 
  theme(legend.title=element_text(face="bold", size=10)) + 
  labs(fill="")+
  
hp+theme_bw() + theme(axis.text.x = element_text(angle=90, hjust = 1,vjust=1,size = 10,face = "bold"),
                      plot.title = element_text(size=10,face="bold"),
                      axis.text.y = element_text(size = 10,face = "bold"),
                      axis.title.x = element_blank(),
                      axis.title.y = element_blank(),legend.position = c(0.2, 0.7)) 




###pathway heatmap

pathways<-read.csv("/Users/divvi/Documents/Survival LSTM/Jasper/pathway_ztransform.csv",header = TRUE, stringsAsFactors = FALSE,sep=",")

###canonical correlation map

install.packages("candisc")
library("candisc")

test_type<-pathway_transform[1:10,2:15]
test_type<-as.matrix(test_type)
test_type<-abs(test_type)

colnames(test_type)<-c("ID1","ID2","ID3","ID4","ID5","ID6","ID7","ID8","ID9","ID10","ID11","ID12","ID13","ID14")

cc <- cancor(test_type[1:10,2:10],test_type[1:10,11:14])

data(Rohwer, package="heplots")
X <- as.matrix(Rohwer[,6:10])
Y <- as.matrix(Rohwer[,3:5])
cc <- cancor(X, Y, set.names=c("PA", "Ability"))

###canonical correlation map updated

library("igraph")

heatmap_pathway_transform=data.matrix(pathway_transform[1:30,2:100], rownames.force = NA)

corr_mat=cor(t(heatmap_pathway_transform),method="pearson",use = "complete.obs")



network <- graph_from_adjacency_matrix( corr_mat, weighted=T, mode="undirected", diag=F)

plot(network,edge.color="red",           # Edge color
     edge.width=seq(1,10),                        # Edge width, defaults to 1
     edge.arrow.size=1,                           # Arrow size, defaults to 1
     edge.arrow.width=1,                          # Arrow width, defaults to 1
     edge.lty=c("solid")                           # Line type, could be 0 or “blank”, 1 or “solid”, 2 or “dashed”, 3 or “dotted”, 4 or “dotdash”, 5 or “longdash”, 6 or “twodash”
     )
