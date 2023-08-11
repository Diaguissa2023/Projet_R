##########################################################
# Les bases de la programmation en R
##########################################################

# opérateur 1 : strictement supérieur
5 > 3
# < strictement inférieur
4 < 6
2 < 1
# >= <=
4 <= 4
4 >= 4
# ==
3 == 3
# !=
3 != 3

# &, &&
2 == 2 & 1 == 1
2 == 2 && 1 == 1

c(2,2) == c(2,2) & c(3,2) == c(2,3)
c(2,2) == c(2,2) && c(3,2) == c(2,3)

c(2,2) == c(2,2) && c(3,2) == c(3,3)
c(2,2) == c(2,2) & c(3,2) == c(3,3)

# ou, |, ||

2 == 2 | 1 == 2
2 == 2 & 1 == 2

# instructions de conditions
#if(condition){
#  action1
#} else {
#  action2
#}

if( 5 > 3 & 2 < 3 ){
  print("OK")
} else {
  print("PAS OK")
}

if( 5 == 3 & 2 < 3 ){
  print("OK")
} else {
  print("PAS OK")
}

# instruction de boucles
#for (valeur in vecteur){
#  action1
#}

for(valeur in c(1,2,3,4,5)){
  print(valeur + 1)
}

for(element in c(1,2,3,4,5)){
  print(paste("Mon chiffre :", element))
}

for(element in c(1,2,3,4,5)){
  if(element > 1 & element < 5){
    print(element)
  }
}


# instructions de boucle while : tant que

#while(condition){
#  actions
#}

valeur = 200

while( valeur/5 > 1){
  valeur = valeur/5
  print(valeur)
}

data(iris)

compteur_individu_sepal_superieur_5=0
for( length in iris$Sepal.Length ){
  if( length >= 5 ){
    compteur_individu_sepal_superieur_5=compteur_individu_sepal_superieur_5+1
  }
}

compteur_setosa=0
compteur_versicolor=0
compteur_virginica=0

for(species in iris$Species){
  if(species == "setosa"){
    compteur_setosa=compteur_setosa+1
  } else if( species == "versicolor"){
    compteur_versicolor=compteur_versicolor+1
  } else {
    compteur_virginica=compteur_virginica+1
  }
}

print(paste("Nombre de setosa :", compteur_setosa))
print(paste("Nombre de versicolor :", compteur_versicolor))
print(paste("Nombre de virginica :", compteur_virginica))


dim(iris)[1]

nombre_setosa_sepal_sup_5=0
for(ligne in 1:dim(iris)[1]){
  individu=iris[ligne,]
  if( individu$Species == "setosa" & individu$Sepal.Length >=5 ){
    nombre_setosa_sepal_sup_5=nombre_setosa_sepal_sup_5+1
  }
}
print(nombre_setosa_sepal_sup_5)


for(colonne in 1:dim(iris)[2]){
  print(iris[,colonne])
  print("-----------")
}


#nom_de_notre_fonction<-function(argument1,argument2,...){
#  instructions
#    bloc code
# #  return(resultat)
#}


nombre_individus_superieur_5<-function(dataframe){
  compteur_individu_sepal_superieur_5=0
  for( length in dataframe$Sepal.Length ){
    if( length >= 5 ){
      compteur_individu_sepal_superieur_5=compteur_individu_sepal_superieur_5+1
    }
  }
  return(compteur_individu_sepal_superieur_5)
}

nombre_individus_superieur_5(iris)


ma_fonction_qui_calcule_la_moyenne<-function(iris){
  iris_species_setosa=subset(iris, iris$Species=="setosa")
  mean_setosa=colMeans(iris_species_setosa[,-5])
  mean_versicolor=colMeans(subset(iris, iris$Species=="versicolor")[,-5])
  mean_virginica=colMeans(subset(iris, iris$Species=="virginica")[,-5])
  resultat=data.frame(Setosa=mean_setosa, Versicolor=mean_versicolor, Virginica=mean_virginica)
  return(resultat)
}

ma_fonction_qui_calcule_la_moyenne(iris)

