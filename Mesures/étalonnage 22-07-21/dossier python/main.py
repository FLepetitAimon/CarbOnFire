
"""
******************************
* importation des librairies *
******************************
"""
import csv
import matplotlib.pyplot as plt
import numpy as np

"""
*****************************
* Déclaration des variables *
*****************************
"""
nb_point=0       #compteur nombre total de point dans le fichier
CO2 = []          #vecteur des mesures de concentration en CO
CO = []         #vecteur des mesures de concentration en CO2
Commande = []
x_min=7500      #indice de la première mesure affichée
x_max=8360      #indice de la dernière mesure affichée
x_seuil = 510

"""
************************
* Programme principale *
************************
"""


# -------------- Récupération des données dans le fichier csv ---------------

with open('ImpactDebitPompe.TXT', 'r') as csv_file:
    next(csv_file)  # saut de ligne pour passer la ligne d'en-tête
    csv_reader = csv.reader(csv_file)
    for line in csv_reader:
        nb_point += 1
        CO2= np.concatenate((CO2, [float(line[4])]))
        CO = np.concatenate((CO, [float(line[3]) * 5]))


print("nombre de point présent dans le fichier: ",nb_point)
x = np.arange(0,(x_max-x_min)/2,0.5)    # création du vecteur de temps sur la fenêtre souhaitée
                                        # en sachant que la fréquence d'échantillonage est de 0.5Hz

for i in range(0,x_max-x_min):
    if i<x_seuil:
        Commande = np.concatenate((Commande, [-40]))
    else:
        Commande = np.concatenate((Commande, [4000]))


# -------------- Affichage des données sur la fenêtre choisie  ---------------

plt.figure("Impact du flux d\'air sur la mesure de CO")
plt.title('Impact du flux d\'air sur la mesure de CO')
plt.plot(x,CO[x_min:x_max],'-', color = "green", lw = 0.5,label='Concentration de CO')
plt.plot(x,Commande,'-', color = "red", lw = 2,label='Activation de la pompe')
plt.xlabel('temps de la mesure (sec)')
plt.ylim(-20,20)
plt.legend()
plt.ylabel('concentration de CO mesurée (ppm)')

plt.figure("Impact du flux d\'air sur la mesure de CO2")
plt.title('Impact du flux d\'air sur la mesure de CO2')
plt.plot(x,CO2[x_min:x_max],'-', color = "green", lw = 0.5,label='Concentration de CO2')
plt.plot(x,Commande,'-', color = "red", lw = 2,label='Activation de la pompe')
plt.ylim(675,825)
plt.xlabel('temps de la mesure (sec)')
plt.legend()
plt.ylabel('concentration de CO2 mesurée (ppm)')



plt.show()




