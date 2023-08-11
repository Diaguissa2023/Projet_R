##########################################################
# Manipulation avancée des données: Dplyr
##########################################################

# apply
# apply(X, MARGIN, FUN)
# X : dataframe, une matrice
# MARGIN : 1 : pour les lignes, 2 : pour les colonnes et colonnes + lignes : c(1,2)
# FUN : fonction (mean, sum, summary, ...)

data(iris)
apply(iris[,-5], 2, mean)
apply(iris[,-5], 1, mean)

apply(iris[,-5], 2, summary)

nombre_valeurs_superieures_5<-function(vecteur){
  length(vecteur[vecteur>5])
}

apply(iris[,-5], 2, nombre_valeurs_superieures_5)
apply(iris[,-5], 1, nombre_valeurs_superieures_5)

# by
# by(X, INDICES, FUN)
# X : dataframe
# INDICES : iris$Species
# FUN : fonction

by(iris, iris$Species, summary)
by(iris[,-5], iris$Species, cor)
by(iris[,-5], iris$Species, mean)

# aggregate
# aggregate(X, BY, FUN)
# X : dataframe
# BY : iris$Species
# FUN : fonction

aggregate(iris[,-5], as.data.frame(iris$Species), mean)

library(dplyr)
class(iris)

# tibble

iris_data=as_tibble(iris)
iris_data

# select : selectionner des colonnes
select(iris, Sepal.Length, Petal.Length, Species)
select(iris, Sepal.Length:Petal.Length)
select(iris, -Species)
select(iris, starts_with("Petal"))
select(iris, -starts_with("Sepal"))
select(iris, ends_with("Length"))
select(iris, contains("al"))

# filter : filtrer sur les individus
filter(iris, Sepal.Length >=5, Sepal.Width >=2)
filter(iris, between(Sepal.Length, 4, 7))
filter(iris, Sepal.Length >=4, Sepal.Length <=7)
filter(iris, Species == "setosa")
filter(iris, Species != "setosa")
filter(iris, Species %in% c("setosa", "versicolor"))
filter(iris, (Species == "setosa" | Species =="versicolor"))
filter_all(iris[,-5], any_vars(. > 5))
filter(iris, (Sepal.Length >5 | Sepal.Width >5 | Petal.Length >5 | Petal.Width >5))
filter_all(iris[,-5], all_vars(. > 2))

# %>% : 
select(iris, Sepal.Length, Petal.Length, Species)

iris %>%
select(Sepal.Length, Petal.Length, Species)

iris %>%
select(-Species) %>%
filter_all(all_vars(. > 2))

# arrange
iris %>%
arrange(Sepal.Length)

iris %>%
arrange(desc(Sepal.Length))

iris %>%
arrange(Sepal.Length, Sepal.Width)

iris %>%
select(Petal.Length, Petal.Width, Species) %>%
filter(Species == "setosa") %>%
arrange(Petal.Length, Petal.Width)
  
# summarise : résumé statistique d'un vecteur qui retourne une valeur.

iris %>%
summarise(moyenne_taille_petal=mean(Petal.Length))

iris %>%
summarise(moyenne_taille_petale=mean(Petal.Length),
minimum_taille_petale=min(Petal.Length),
maximum_taille_petale=max(Petal.Length),
total=n())

iris %>%
summarise(moyenne_taille_petale=mean(Petal.Length),
moyenne_taille_sepale=mean(Sepal.Length),
minimum_taille_petale=min(Petal.Length),
minimum_taille_sepale=min(Sepal.Length)
)

iris %>%
summarise_each(funs(mean, min), Petal.Length, Sepal.Length)


# group_by()
iris %>%
group_by(Species) %>%
summarise(moyenne_taille_petale=mean(Petal.Length),
minimum_taille_petale=min(Petal.Length),
maximum_taille_petale=max(Petal.Length),
total=n())

iris %>%
group_by(Species) %>%
filter(Petal.Length > 5) %>%
summarise(n())

# mutate : ajouter, supprimer, modifier

# ajouter une ou plusieurs variables
iris %>%
mutate(somme_longueur_largeur_petale=Petal.Length+Petal.Width,
somme_longueur_largeur_sepale=Sepal.Length+Sepal.Width
)

# supprimer une ou des variables
iris %>%
mutate(Species=NULL, Sepal.Width=NULL)

# modifier une variable
iris %>%
mutate(Sepal.Length=Sepal.Length*2)

#####################
# cas pratique fast food
#####################

# lien dropbox
# https://www.dropbox.com/s/pr288bu5slmk2jk/FastFoodRestaurants.csv?dl=0

# lecture du fichier fast food aux US
fast_food=read.csv("FastFoodRestaurants.csv")

# transformation en tibble
fast_food_tibble=as_tibble(fast_food)

# Quelles sont les 5 villes avec le plus de fast-food ?

fast_food_tibble %>%
group_by(city) %>%
summarise(Nombre_de_restaurants=length(city)) %>%
arrange(desc(Nombre_de_restaurants)) %>%
head(n=5)

# Quels sont les fast food les plus présents dans ces 5 villes ?

city_list=fast_food_tibble %>%
group_by(city) %>%
summarise(Nombre_de_restaurants=length(city)) %>%
arrange(desc(Nombre_de_restaurants)) %>%
head(n=5) %>%
pull(city)

fast_food_tibble %>%
filter(city %in% city_list)

fast_food_tibble %>%
filter(city %in% city_list) %>%
group_by(name)  %>%
summarise(nombre_de_fast_food=length(name)) %>%
arrange(desc(nombre_de_fast_food))

# Quels sont les fast food avec le plus de restaurants aux US ? 
fast_food_tibble %>%
group_by(name) %>%
summarise(nombre_de_fast_food=length(name), pourcentage_de_fast_food=(length(name)*100/10000)) %>%
arrange(desc(nombre_de_fast_food))

# Dans quelle ville y a-t-il le plus de McDonald's ?
fast_food_tibble %>%
filter(name %in% "McDonald's")  %>%
group_by(city) %>%
summarise(nombre_de_fast_food=length(city)) %>%
arrange(desc(nombre_de_fast_food)) 


# Oà¹ se situe New-York par rapport aux 5 villes avec le plus de fast-foods ?

fast_food_tibble %>%
group_by(city) %>%
filter( city %in% "New York")  %>%
summarise(nombre_de_fast_food=length(city))


# Fast food les plus présents à  New York
fast_food_tibble %>%
filter( city %in% "New York")  %>%
group_by(name) %>%
summarise(nombre_de_fast_food=length(name), pourcentage_de_fast_food=(length(name)*100/10000)) %>%
arrange(desc(nombre_de_fast_food))

# Forbes : Orlando, Cincinnati And The Fast Food Capitals of the US. 

