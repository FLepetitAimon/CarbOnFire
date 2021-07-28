
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
CO = []          #vecteur des mesures de concentration en CO
CO2 = []         #vecteur des mesures de concentration en CO2
x_min=26770      #indice de la première mesure affichée
x_max=28841      #indice de la dernière mesure affichée

"""
************************
* Programme principale *
************************
"""


# -------------- Récupération des données dans le fichier csv ---------------

with open('data_etallonage_22-07-21.TXT','r') as csv_file:
    next(csv_file)     # saut de ligne pour passer la ligne d'en-tête
    csv_reader = csv.reader(csv_file)
    for line in csv_reader:
        nb_point += 1
        CO = np.concatenate((CO,[float(line[3])*5]))
        CO2 = np.concatenate((CO2, [float(line[4])]))

print("nombre de point présent dans le fichier: ",nb_point)
x = np.arange(0,(x_max-x_min)/2,0.5)    # création du vecteur de temps sur la fenêtre souhaitée
                                        # en sachant que la fréquence d'échantillonage est de 0.5Hz


# -------------- Affichage des données sur la fenêtre choisie  ---------------

plt.figure("figure de CO")
plt.title('Air 92ppm de CO - avec un débit de 9.7l/min')
plt.plot(x,CO[x_min:x_max],'-', color = "green", lw = 0.5)
plt.xlabel('temps de la mesure (sec)')
plt.ylabel('concentration de CO mesurée (ppm)')

plt.figure("figure de CO2")
plt.title('Air 1000ppm de CO2 - avec un débit de 5l/min')
plt.plot(x,CO2[x_min:x_max],'-', color = "red", lw = 0.5)
plt.xlabel('temps de la mesure (sec)')
plt.ylabel('concentration de CO2 mesurée (ppm)')

plt.show()




