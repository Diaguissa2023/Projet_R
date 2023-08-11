##########################################################
# Visualisation avancée des données
##########################################################
  
data(iris)

# plot()

plot(iris$Sepal.Length, iris$Petal.Width)

plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Longueur", ylab="Largeur", col="red", xlim=c(min(iris$Sepal.Length,iris$Petal.Length),
max(iris$Sepal.Length,iris$Petal.Length)), ylim=c(min(iris$Sepal.Width,iris$Petal.Width),max(iris$Sepal.Width,iris$Petal.Width)))
lines(iris$Petal.Length, iris$Petal.Width, col="slateblue4", type="p", pch=22)
title(main="Longueur en fonction de largeur", col="blue")
legend(1, 4.2, c("Sépales", "Pétales"), col=c("red", "slateblue4"), pch=21:22)

library("ggplot2")
# Plot = data + aesthetics + Geometry

g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width))
g<-g+geom_point()

# couleur selon l'espèce
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species))+geom_point()

# couleurs et formes des points différentes selon l'espèce
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species, shape=Species))+geom_point()

# modifier taille des points
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species, shape=Species))+geom_point(size=3)

# créer un gradient de couleur
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")
g

# modifier le fond de notre graphique
g<-g+theme_minimal()

# modifier la position de la légende
g<-g+theme(legend.position="top")
g


g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_blank())
g


# modifier couleur, texture du titre de la légende
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_text(colour="red", size=15, face="bold"))
g

# modifier couleur, texture, taille des labels de ma légende
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_text(colour="red", size=15, face="bold"))
g<-g+theme(legend.text=(element_text(colour="blue", size=8, face="bold.italic")))
g

# steelblue
# ajouter un cadre à  notre légende
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_text(colour="red", size=15, face="bold"))
g<-g+theme(legend.text=(element_text(colour="blue", size=8, face="bold.italic")))
g

# modification des noms des axes et ajout d'un titre au graphique
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_text(colour="steelblue", size=9, face="bold"))
g<-g+theme(legend.text=(element_text(colour="blue", size=8, face="bold.italic")))
g<-g+xlab("Longueur des pétales")+ylab("Largeur des pétales")+ggtitle("Longueur des pétales en fonction de largeur des pétales")
g<-g+theme(plot.title=element_text(colour="steelblue", size=15, face="bold"))
g<-g+theme(axis.title=element_text(colour="steelblue", size=10, face="bold"))
g<-g+theme(axis.text=element_text(colour="steelblue", size=10, face="bold", angle=45))
#g<-g+theme(axis.line=element_line(colour="steelblue", size=2, linetype="dotted"))
g

# modification des noms des axes et ajout d'un titre au graphique
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_text(colour="steelblue", size=9, face="bold"))
g<-g+theme(legend.text=(element_text(colour="blue", size=8, face="bold.italic")))
g<-g+xlab("Longueur des pétales")+ylab("Largeur des pétales")+ggtitle("Longueur des pétales en fonction de largeur des pétales")
g<-g+theme(plot.title=element_text(colour="steelblue", size=15, face="bold"))
g<-g+theme(axis.title=element_text(colour="steelblue", size=10, face="bold"))
g<-g+theme(axis.text=element_text(colour="steelblue", size=10, face="bold", angle=45))
#g<-g+theme(axis.line=element_line(colour="steelblue", size=2, linetype="dotted"))
g

# facet_wrap -> combiner des graphiques
g<-ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Petal.Length, shape=Species))+geom_point(size=3)
g<-g+scale_color_gradient(low="blue", high="red")+theme_minimal()+theme(legend.title=element_text(colour="steelblue", size=9, face="bold"))
g<-g+theme(legend.text=(element_text(colour="blue", size=8, face="bold.italic")))
g<-g+xlab("Longueur des pétales")+ylab("Largeur des pétales")+ggtitle("Longueur des pétales en fonction de largeur des pétales")
g<-g+theme(plot.title=element_text(colour="steelblue", size=15, face="bold"))
g<-g+theme(axis.title=element_text(colour="steelblue", size=10, face="bold"))
g<-g+theme(axis.text=element_text(colour="steelblue", size=10, face="bold", angle=45))
#g<-g+theme(axis.line=element_line(colour="steelblue", size=2, linetype="dotted"))
g<-g+facet_wrap(~Species)+theme(strip.text=element_text(colour="steelblue", size=10, face="bold"))
g<-g+theme(strip.background=element_rect(colour="steelblue", size=1,linetype="solid"))
g


# modification des noms des axes et ajout d'un titre au graphique
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

# histogramme sur les données iris
png("histogramme_iris.png")
g<-ggplot(iris, aes(x=Petal.Length, fill=Species))+geom_histogram(color="white",binwidth =0.5)
g
dev.off()

pdf("boxplot_iris.pdf")
g<-ggplot(iris, aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()
g<-g+ggtitle("Boxplot de la longueur des pétales selon l'espèce")+xlab("Espèce")+ ylab("Longueur des pétales")
g
dev.off()

