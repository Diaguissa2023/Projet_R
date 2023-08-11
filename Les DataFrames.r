#######################################
# Les dataframes
#######################################

mon_dataframe=data.frame(c(18,26,54,78), c(56,84,76,62), c("M", "F", "M", "F"), c(TRUE,TRUE,TRUE,FALSE))
colnames(mon_dataframe)=c("Age", "Poids", "Sexe", "Ma valeur booléenne")
rownames(mon_dataframe)=c("Jean", "Zoé", "Lucas", "Chloé")

data_iris=read.table("iris.csv", header = TRUE, sep=",")
data_iris=read.table("iris.csv", header = TRUE, sep=",", row.names=1)
data_iris=read.csv("iris.csv", row.names=1)
data("iris")
ls()
write.table(data_iris, file="iris_2.csv", sep=",", row.names=TRUE)
write.csv(data_iris, file="iris_2.csv", row.names=TRUE)
save(data_iris, file="iris.Rdata")
load("iris.Rdata")

data_iris[,1]
data_iris[,c(1:3)]
head(data_iris[,c(1:3)])
head(data_iris[c(1,50,60),c(1:3)])
head(data_iris[c(1,50,60),c("Sepal.Length","Sepal.Width","Petal.Length")])
head(data_iris$Species)

data_iris[data_iris$Species == "setosa",]
dim(data_iris[data_iris$Species == "setosa",])
data_iris$Species == "setosa"
data_iris[which(data_iris$Species == "setosa"),]
which(data_iris$Species == "setosa")

data_iris[which(data_iris$Species == "setosa" & data_iris$Petal.Length == 1.4),]
which(data_iris$Species == "setosa" & data_iris$Petal.Length == 1.4)

data_iris[data_iris$Species %in% c("setosa", "versicolor"),]
data_iris$Species %in% c("setosa", "versicolor")

subset(data_iris, Species="setosa" & Petal.Length == 1.4)

subset(data_iris, Species="setosa" & Petal.Length == 1.4, select=c("Petal.Length"))

class(iris$Species)
head(iris$Species)
colnames(iris)=c("Longueur des sépales","Largeur des sépales","Longueur des pétales","Largeur des pétales","Espèce")
rownames(iris)=paste("iris_", rownames(iris), sep="")
summary(iris)

min(iris[iris$"Espèce" == "setosa",3])
mean(iris[iris$"Espèce" == "setosa",3])
mean(iris[iris$"Espèce" == "versicolor",3])
mean(iris[iris$"Espèce" == "virginica",3])

data_iris_quantitative=iris[,c(1,2,3,4)]
data_iris_qualitative=iris[,5]
data_iris_qualitative=as.data.frame(iris[,5])
colnames(data_iris_qualitative)=c("Espèce")
rownames(data_iris_qualitative)=paste("iris_", rownames(data_iris_qualitative), sep="")
iris_complet=merge(data_iris_quantitative,data_iris_qualitative, by="row.names")
rownames(iris_complet)=iris_complet[,1]
iris_complet=iris_complet[,-1]

head(cbind(data_iris_quantitative,data_iris_qualitative))
head(rbind(iris,iris))

dim(rbind(iris,iris))
dim(iris)

