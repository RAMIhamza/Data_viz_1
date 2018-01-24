
# auteur VL. HR GB

#importing libraries
library(rgdal)
if (!require(geojsonio)) {
  install.packages("geojsonio")
  library(geojsonio)
}
library(sp)
library(maps)
library(ggmap)
library(maptools)
library(rgdal)
library(geojsonR)
# ------------------ DONNEES
# Chemin du répertoire contenant les fichiers de données :

data_json1 <- geojson_read("D:/Etudes 2A Centrale/Projet Inno/Projet_inno/carte_regions.geojson", what = "sp")

data_csv <- read.csv2("D:/Etudes 2A Centrale/Projet Inno/Projet_inno/Data2.csv", sep="")



#Plot Data
plot(data_csv$Region,data_csv$Taux_de_Précarité, xlab="Régions", ylab="Taux de précarité",col="red",main="première visualisation de la Data")
lines(data_csv$Region,rep(40,18),col="green")
lines(data_csv$Region,rep(60,18),col="red")

# some outputs :
data_csv$Taux_de_Précarité          #liste de Taux de précarité de toutes les régions
data_json1$X_storage_options       #Factor of initial colors
data_json1$X_storage_options[3]   #initial Color of the third region

#Test with factors
ff<-factor("{ \"color\": \"Red\" }",levels=c("{ \"color\": \"Blue\" }" ,"{ \"color\": \"Red\" }" ))
ff

#Algorithme du choix de couleur
data_csv <- read.csv2("D:/Etudes 2A Centrale/Projet Inno/Projet_inno/Data2.csv", sep="")
data_csv

data_json1 <- readOGR("D:/Etudes 2A Centrale/Projet Inno/Projet_inno/carte_regions.geojson")
data_json1


      #initializing our data
data_json1$X_storage_options<-factor(data_json1$X_storage_options,levels=c("{ \"color\": \"Red\" }" ,"{ \"color\": \"Yellow\" }","{ \"color\": \"Green\" }" ))
Red<-factor("{ \"color\": \"Red\" }",levels=c("{ \"color\": \"Red\" }" ,"{ \"color\": \"Yellow\" }","{ \"color\": \"Green\" }" ))
Yellow<-factor("{ \"color\": \"Yellow\" }",levels=c("{ \"color\": \"Red\" }" ,"{ \"color\": \"Yellow\" }","{ \"color\": \"Green\" }" ))
Green<-factor("{ \"color\": \"Green\" }",levels=c("{ \"color\": \"Red\" }" ,"{ \"color\": \"Yellow\" }","{ \"color\": \"Green\" }" ))
     #modifying data
for (k in data_csv$ID){
  if(data_csv$Taux_de_Précarité[k]<40){
    data_json1$X_storage_options[k]<-Green

  } else if (data_csv$Taux_de_Précarité[k]<60){
    data_json1$X_storage_options[k]<-Yellow
  } else {
    data_json1$X_storage_options[k]<-Red   
  }
}


geojson_write(data_json1,file="D:/Etudes 2A Centrale/Projet Inno/Projet_inno/carte_regions114.geojson")

#Results
data_json1$X_storage_options     #New colors of the regions depending on the Taux de précarité 
data_json1$X_storage_options[1] #New color of Ile de France depending on its Taux de précarité

















































