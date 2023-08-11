#######################################
# Débuter avec R: Les Vecteurs 
#######################################

class(3.5)
typeof(3.5)
typeof(3)
typeof(as.integer(3))

class("hello")
typeof("hello")

65 < 60
3>1

# NA

# ma variable mon caractere
mon_caractere="a"

mon_premier_nombre=10
mon_deuxieme_nombre=4

10+4

mon_premier_nombre+mon_deuxieme_nombre
mon_premier_nombre-mon_deuxieme_nombre
mon_premier_nombre/mon_deuxieme_nombre
mon_premier_nombre**mon_deuxieme_nombre
mon_premier_nombre*mon_deuxieme_nombre
mon_premier_nombre%%mon_deuxieme_nombre

c(1,2,3)
mon_vecteur=c(2,3,1)
mon_vecteur
class(mon_vecteur)

vecteur1=seq(from=1, to=10)
vecteur2=rep(10, times=10)

vecteur1 + 1
vecteur1 * 10
vecteur1 * vecteur2

vecteur2=10
vecteur1 / vecteur2

vecteur2=c(2,1,3)
vecteur1 / vecteur2

vecteur2=seq(from=6, to=15)
vecteur1 - vecteur2

concatenation=c(vecteur1, vecteur2)

vecteur2[2]
vecteur2[1:3]
vecteur2[c(1,6,2)]

superieur = vecteur2 > 8

mean(vecteur2)

length(vecteur2)
names(vecteur2)=paste("Ma valeur",vecteur2, sep=" ")
sort(vecteur2, decreasing = TRUE)
rank(vecteur2)

sum(vecteur2)
mean(vecteur2)
min(vecteur2)
max(vecteur2)
summary(vecteur2)

names(moyennes_de_la_classe)=c("Pedro", "Baptiste", "Amaury", "Flora", "Kevin", "Markus", "Rozenn", "Raphael", "Jordan", "Victoire", "Thomas",
"Julia", "Marion", "Goulwen", "Suzon", "Lise", "Quentin", "Boniface", "Emil", "Gabin")

moyennes_de_la_classe=sample(1:20,20)

moyenne_generale=mean(moyennes_de_la_classe)
moins_bonne_note=min(moyennes_de_la_classe)
meilleure_note=max(moyennes_de_la_classe)
eleve_superieur_moyenne_generale=moyennes_de_la_classe[moyennes_de_la_classe>moyenne_generale]

tableau_recapitulatif=c(moyenne_generale,moins_bonne_note,meilleure_note,length(eleve_superieur_moyenne_generale))
names(tableau_recapitulatif)=c("Moyenne générale", "Moins bonne note", "Meilleure note", "Nombre d'élèves avec une note > moyenne générale")

moyennes_de_la_classe[moyennes_de_la_classe==meilleure_note]

sort(moyennes_de_la_classe, decreasing = TRUE)

summary(moyennes_de_la_classe)









