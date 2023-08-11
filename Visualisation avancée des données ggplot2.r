##############################
# Visualisation avancée des données: ggplot2
##############################

library("ggplot2")
library("dplyr")

fast_food=read.csv("FastFoodRestaurants.csv")
fast_food_tibble=as_tibble(fast_food)

city_list=fast_food_tibble %>%
group_by(city) %>%
summarise(Nombre_de_restaurants=length(city)) %>%
arrange(desc(Nombre_de_restaurants)) %>%
head(n=10) %>%
pull(city)

fast_food_tibble_10_villes=fast_food_tibble %>%
filter(city %in% city_list)

list_fast_food=fast_food_tibble_10_villes %>%
group_by(name) %>%
summarise(Nombre_de_restaurants=length(name)) %>%
arrange(desc(Nombre_de_restaurants)) %>%
head(n=10) %>%
pull(name)

fast_food_tibble_10_villes_10_restaurants=fast_food_tibble_10_villes %>%
filter(name %in% list_fast_food)

pdf("fast_food.pdf")
g<-ggplot(fast_food_tibble_10_villes_10_restaurants, aes(city, fill=name))+geom_bar()+theme_minimal()
g<- g + xlab("Les 10 capitales du fast-foods") + ylab("Les 10 restaurants les plus implantés")
g<- g + ggtitle("Représentation des fast-foods les plus implantés \n dans les 10 capitales du fast-food")
g<- g + theme(plot.title=element_text(hjust=0.5), axis.text=element_text(face="bold", size=7, angle=45)) 
g <- g + ylim(0, 100) + theme(legend.title=element_blank()) + scale_fill_brewer(palette="Paired")
g
dev.off()

install.packages("plotly")
library("plotly")

ggplotly(g)

g<-ggplot(iris, aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()
g<-g+ggtitle("Boxplot de la longueur des pétales selon l'espèce")+xlab("Espèce")+ ylab("Longueur des pétales")
g

ggplotly(g)

g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_text(colour="steelblue", size=9, face="bold"))
g<-g+theme(legend.text=(element_text(colour="blue", size=8, face="bold.italic")))
g<-g+xlab("Longueur des pétales")+ylab("Largeur des pétales")+ggtitle("Longueur des pétales en fonction de largeur des pétales")
g<-g+theme(plot.title=element_text(colour="steelblue", size=15, face="bold"))
g<-g+theme(axis.title=element_text(colour="steelblue", size=10, face="bold"))
g<-g+theme(axis.text=element_text(colour="steelblue", size=10, face="bold", angle=45))
#g<-g+theme(axis.line=element_line(colour="steelblue", size=2, linetype="dotted"))
g<-g+annotate("text", x=c(2,4,6), y=0.7, label=c("Setosa","Versicolor","Virginica"), colour="steelblue", size=3, fontface="bold")
g<-g+annotate("rect", xmin=0.5, xmax=2.1, ymin=0, ymax=0.65, alpha=0.2, colour="steelblue", size=2)
g<-g+annotate("segment", x=0.5, xend=4, y=1.5, yend=0, colour="steelblue", size=2, alpha=0.5)
g

ggplotly(g)


##########################################################
# Commandes session 8 : cas pratique de data science
##########################################################

# lecture du fichier de données
bank_data=read.csv("bank.csv", sep=";")

summary(bank_data)

# visualisation des données
library("ggplot2")

g<-ggplot(bank_data, aes(x=y, y=duration, fill=y))+geom_boxplot()
g

library("plotly")
ggplotly(g)


g<-ggplot(bank_data, aes(x=y, y=age, fill=y))+geom_boxplot()
g
ggplotly(g)

g<-ggplot(bank_data, aes(y, fill=contact))+geom_bar()
g

# Création jeu de test et jeu d'entrainement
library("caret")

dummy_variables=dummyVars(~., data=bank_data)
dummy_variables_data=predict(dummy_variables, newdata=bank_data)
dummy_variables_data=as.data.frame(dummy_variables_data)

dummy_variables_data$"Souscription"=ifelse(dummy_variables_data$"y.no" == 1, "No", "Yes")
dummy_variables_data$"y.no"=NULL
dummy_variables_data$"y.yes"=NULL

# Création des jeux de données d'entrainement et de test
set.seed(3033)
training_size=floor(0.7*nrow(dummy_variables_data))
indices=sample(seq_len(nrow(dummy_variables_data)), size=training_size)
data_bank.train=dummy_variables_data[indices,]
data_bank.test=dummy_variables_data[-indices,]

dim(data_bank.train)
dim(data_bank.test)

# Normalisation des données

data_preprocess_value=preProcess(data_bank.train, method=c("center","scale"))
data_bank.train.scaled=predict(data_preprocess_value,data_bank.train)
data_bank.test.scaled=predict(data_preprocess_value,data_bank.test)

# Caret - downsample et upsample
table(data_bank.train.scaled[,"Souscription"])

set.seed(3033)
'%ni%' = Negate("%in%")

# downsample
data_bank.train.scaled.downsample=downSample(x=data_bank.train.scaled[,colnames(data_bank.train.scaled) %ni% "Souscription"], y=as.factor(data_bank.train.scaled$"Souscription"))
names(data_bank.train.scaled.downsample)[names(data_bank.train.scaled.downsample) == "Class"]="Souscription"
table(data_bank.train.scaled.downsample[,"Souscription"])

# upsample
data_bank.train.scaled.upsample=upSample(x=data_bank.train.scaled[,colnames(data_bank.train.scaled) %ni% "Souscription"], y=as.factor(data_bank.train.scaled$"Souscription"))
names(data_bank.train.scaled.upsample)[names(data_bank.train.scaled.upsample) == "Class"]="Souscription"
table(data_bank.train.scaled.upsample[,"Souscription"])

# modélisation avec naive bayes
set.seed(3033)
trainControl_data=trainControl(method="repeatedcv", number=10, repeats=3)
naive_bayes_desequilibree=train(Souscription ~., data=data_bank.train.scaled, method="nb", preProcess=NULL)

print(naive_bayes_desequilibree)

# prédiction avec notre modèle sur le jeu de données tests
prediction_naive_bayes_desequilibree=predict(naive_bayes_desequilibree, newdata=data_bank.test.scaled[,-ncol(data_bank.test.scaled)])

# création de la matrice de confusion
confusionMatrix(prediction_naive_bayes_desequilibree, as.factor(data_bank.test.scaled[,ncol(data_bank.test.scaled)]))

# modélisation avec naive bayes sur les données downsamplé
set.seed(3033)
trainControl_data=trainControl(method="repeatedcv", number=10, repeats=3)
naive_bayes_downsample=train(Souscription ~., data=data_bank.train.scaled.downsample, method="nb", preProcess=NULL)

print(naive_bayes_downsample)

# prédiction avec notre modèle sur le jeu de données tests
prediction_naive_bayes_downsample=predict(naive_bayes_downsample, newdata=data_bank.test.scaled[,-ncol(data_bank.test.scaled)])

# création de la matrice de confusion
confusionMatrix(prediction_naive_bayes_downsample, as.factor(data_bank.test.scaled[,ncol(data_bank.test.scaled)]))

# modélisation avec SVM
set.seed(3033)
trainControl_data=trainControl(method="repeatedcv", number=10, repeats=3)
SVM_desequilibree=train(Souscription ~., data=data_bank.train.scaled, method="svmLinear", preProcess=NULL)

print(SVM_desequilibree)

# prédiction avec notre modèle sur le jeu de données tests
prediction_SVM_desequilibree=predict(SVM_desequilibree, newdata=data_bank.test.scaled[,-ncol(data_bank.test.scaled)])

# création de la matrice de confusion
confusionMatrix(prediction_SVM_desequilibree, as.factor(data_bank.test.scaled[,ncol(data_bank.test.scaled)]))

# varImp
varImp(naive_bayes_downsample, scale=F)