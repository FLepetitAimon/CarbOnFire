# Codes Arduino
***

## Environement de Développement 

Pour écrire un programme et le téléverser sur la carte Arduino, vous pouvez utilisez l'IDE foruni par Arduino et téléchargeable gratuitementsur leur site internet (https://www.arduino.cc/en/software). Les codes sont écrit en C++. 

## Progamme Principale

Le fichier ProgrammePrincipale contient le code d'acquisition des mesures. Il effectue des mesures, les enregistre dans un fichier au format .CSV sur une carte SD et transmets trois d'entre elle via une communication bluetooth. Les trois grandeurs concernés sont la concentration de CO, la concentration de CO2 et la température. En complément du programme, il est recommandé d'utiliser l'application android CarbOnFire disponible sur le GitHub dans le répertoire CarbOnFrie_App.

Le montage electrique nécessaire au bon fonctionnement du programme est détaillé dans la fiche technique du projet (répertoire Documents_Techniques). 

## Programme RTC (Real-Time Clock)

Le programme RTC à pour but de régler la RTC. Il se peu qu'avec le temps, la RTC se décale de quelques minutes, ou que la pile soit vide. Dans ce cas, il est nécessaire de régler la RTC. Pour effectuer se réglage suivé les indicationsl suivantes:

1. Ouvrez, avec l'IDE Arduino, le programme test-rtc.ino disponible dans le repertoire Programe_RTC du Github
2. Branchez le shield SD-RTC sur une carte Arduino UNO, et branchez la carte à l'ordinateur. 
3. Téléverser le programme puis ouvrez le port série sur l'IDE
4. Réglez le baudrate du port série à 57600, la listes des commandes devrait s'afficher
5. Commencez par activer la RTC en tapant la commande **c 0 0** 
6. Puis renseignez l'heure actuelle avec la commande **tw yyyymmdd hhmmss dw** avec **dw** qui correspond au jour de la semaine (dim=1, lun=2, ..., sam=7)
7. Vérifiez le bonne mise à jour de l'heure en tapant la commande **tr**, l'heure actuelle doit s'afficher.
8. Reposisitionnez le Shield SD sur dans le boitier de mesure.

## Programme CN0396

Le programme CN0396Exemple sert lire la mesure de CO effectuée par la carte Analog Device CN0396 équpé d'un capteur de CO, CO-CX. La programme offre également la possibilité d'effectuer une correction en température. Le montage électrique est très simple, il suffit de monter la carte Analog Device sur une carte Arduino Uno et de téléverser le programme exemple. Si vous souhaitez utiliser la carte Analog avec un shield Sd, il vous faudra changer le pin CS du bus SPI d'une des deux cartes.
