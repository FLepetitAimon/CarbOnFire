
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
nb_point_CarbOnFire = 0       #compteur nombre total de point dans le fichier du CarbOnFire
nb_point_QTrack = 0           #compteur nombre total de point dans le fichier du Q-Track

CO2_CarbOnFire = []           #vecteur des mesures de concentration en CO2 du CarbOnFire
CO_CarbOnFire = []            #vecteur des mesures de concentration en CO du CarbOnFire
Press_CarbOnFire = []         #vecteur des mesures de pression du CarbOnFire
Temp_CarbOnFire = []          #vecteur des mesures de température du CarbOnFire

CO2_QTrack = []               #vecteur des mesures de concentration en CO du Q-Track
CO_QTrack = []                #vecteur des mesures de concentration en  du Q-Track
Temp_QTrack = []              #vecteur des mesures de température du Q-Track

 
x_min=0  #indice de la première mesure affichée
x_max=2200    #indice de la dernière mesure affichée

"""
************************
* Programme principale *
************************
"""


# -------------- Récupération des données dans les fichiers CSV ---------------

# fichier de mesure du CarbOnFire

with open('./Tests_en_conditions_réels_27-08-21/CarbOnFire_Data.txt', 'r') as csv_file:
    next(csv_file)  # saut de ligne pour passer la ligne d'en-tête
    csv_reader = csv.reader(csv_file)
    for line in csv_reader:
        nb_point_CarbOnFire += 1
        
        CO2_CarbOnFire = np.concatenate((CO2_CarbOnFire, [float(line[4])]))
        CO_CarbOnFire = np.concatenate((CO_CarbOnFire, [float(line[3])]))
        Temp_CarbOnFire = np.concatenate((Temp_CarbOnFire, [float(line[0])]))
        Press_CarbOnFire = np.concatenate((Press_CarbOnFire, [float(line[1])]))

        
# fichier de mesure du Q-Track

with open('./Tests_en_conditions_réels_27-08-21/Q-Track_Data.txt', 'r') as csv_file:
    next(csv_file)  # saut de ligne pour passer la ligne d'en-tête
    csv_reader = csv.reader(csv_file)
    for line in csv_reader:
        nb_point_QTrack += 1
        CO2_QTrack = np.concatenate((CO2_QTrack, [float(line[2])]))
        CO_QTrack = np.concatenate((CO_QTrack, [float(line[5])]))
        Temp_QTrack = np.concatenate((Temp_QTrack, [float(line[3])]))


print("nombre de point présent dans le fichier CarbOnFire: ",nb_point_CarbOnFire,"\n")
print("nombre de point présent dans le fichier QTrack: ",nb_point_QTrack,"\n")

x = np.arange(0,(x_max-x_min),1)    # création du vecteur de temps sur la fenêtre souhaitée
                                        # en sachant que la fréquence d'échantillonage est de 0.5Hz




# -------------- Création des courbes issues des fichiers de mesure  ---------------

plt.figure("Tests_reels_CO")
plt.title('Feux de brindilles et pot d\'échappement d\'une voture essence')
plt.plot(x,CO_CarbOnFire[x_min:x_max],'-', color = "green", lw = 0.5,label='CarbOnFire')
plt.plot(x,CO_QTrack[x_min:x_max],'-', color = "red", lw = 0.5,label='QTrack')
plt.xlabel('temps de la mesure (sec)')
plt.legend()
plt.ylabel('concentration de CO mesurée (ppm)')

plt.figure("Tests_reels_CO2")
plt.title('Feux de brindilles et pot d\'échappement d\'une voture essence')
plt.plot(x,CO2_CarbOnFire[x_min:x_max],'-', color = "green", lw = 0.5,label='CarbOnFire')
plt.plot(x,CO2_QTrack[x_min:x_max],'-', color = "red", lw = 0.5,label='QTrack')
plt.xlabel('temps de la mesure (sec)')
plt.legend()
plt.ylabel('concentration de CO2 mesurée (ppm)')


plt.figure("Tests_reels_temperature")
plt.title('Feux de brindilles et pot d\'échappement d\'une voture essence')
plt.plot(x,Temp_CarbOnFire[x_min:x_max],'-', color = "green", lw = 0.5,label='CarbOnFire')
plt.plot(x,Temp_QTrack[x_min:x_max],'-', color = "red", lw = 0.5,label='QTrack')
plt.xlabel('temps de la mesure (sec)')
plt.legend()
plt.ylabel('Température (°C)')

plt.figure("Tests_reels_Pression")
plt.title('Feux de brindilles et pot d\'échappement d\'une voture essence')
plt.plot(x,Press_CarbOnFire[x_min:x_max],'-', color = "green", lw = 0.5,label='CarbOnFire')
plt.xlabel('temps de la mesure (sec)')
plt.legend()
plt.ylabel('Pression (hPa)')


plt.show()




