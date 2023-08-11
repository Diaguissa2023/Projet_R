####################################
# Les matrices
####################################

notes=sample(1:20, 15)
notes[3]=15

matrix(notes, ncol=3, nrow=5)
matrix(notes, ncol=3, nrow=5, byrow=TRUE)

notes_2=c(sample(1:20, 10), "a", "b", "c", "d", "e")
matrix(c(sample(1:20, 10), "a", "b", "c", "d", "e"), ncol=3, nrow=5)

notes_des_eleves=matrix(notes, ncol=3, nrow=5)
colnames(notes_des_eleves)=c("SVT", "Mathématiques", "Fraçais")
rownames(notes_des_eleves)=c("Jean", "Léa", "Thomas", "Julien", "Zoé")

notes_des_eleves[1,]
notes_des_eleves[,1]

notes_des_eleves[1,2]

notes_des_eleves[1,c(2,3)]
notes_des_eleves[1,2:3]

notes_des_eleves["Thomas","Français"]
notes_des_eleves[c("Léa","Thomas"),"Français"]

notes_des_eleves[c("Léa","Thomas"),"Français"]=c(15,10)

notes_2=c(rep(0.5, times=5),rep(1, times=5), rep(0.9, times=5))

rowSums(notes_des_eleves)
colSums(notes_des_eleves)

rowMeans(notes_des_eleves)
colMeans(notes_des_eleves)

install.packages("Stat2Data")
library("Stat2Data")
data("HorsePrices")
matrice_prix_cheval=as.matrix(HorsePrices[,-c(1,5)])
rownames(matrice_prix_cheval)=HorsePrices[,1]
colnames(matrice_prix_cheval)=c("Prix", "Age", "Taille")

# je sais que 1 hand fait 0.1016 mètre
matrice_prix_cheval[,3]=matrice_prix_cheval[,3]*0.1016
# 1 dollar c'est 0.86 euros
matrice_prix_cheval[,1]=matrice_prix_cheval[,1]*0.86

dim(matrice_prix_cheval)
summary(matrice_prix_cheval)

matrice_prix_cheval=na.omit(matrice_prix_cheval)
dim(matrice_prix_cheval)

matrice_prix_cheval[matrice_prix_cheval[,1]==946,]
matrice_prix_cheval[matrice_prix_cheval[,1]==51600,]
matrice_prix_cheval[matrice_prix_cheval[,1]==946,]=c(2500,19,1.651)
matrice_prix_cheval[matrice_prix_cheval[,1]==2500,]

matrice_prix_cheval[matrice_prix_cheval[,1]>23082,]
dim(matrice_prix_cheval[matrice_prix_cheval[,1]>23082,])
matrice_prix_cheval[matrice_prix_cheval[,3]>1.6,]
colMeans(matrice_prix_cheval[matrice_prix_cheval[,3]>1.6,])
colMeans(matrice_prix_cheval[matrice_prix_cheval[,3]<1.6,])

colSums(matrice_prix_cheval)

