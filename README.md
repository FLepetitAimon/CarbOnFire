# Système CarbOnFire
***
## Contexte 
Le projet a été réalisé entre juin et aout 2021 au laboratoire d'aérologie de Toulouse, dans le cadre d'un stage de 4é année d'école d'ingénieur. La stage a été fait par François LEPETIT-AIMON et tutoré par Jean-François LEON. Si vous désirez des informations suplémentaires sur le projet, n'hésitez à contacter François LEPETIT-AIMON à l'adresse mail: francois.lepetitaimon@gmail.com

## Présentation du projet

ATTENTION : Avant d’utiliser le système, veillez à lire la fiche technique du projet.

CarbOnFire est un système de mesure d’émission de particules issues de la combustion de végétaux. Il s’inscrit dans un projet d’étude de l’exposition humaine aux particules fines issues de la combustion de biomasse et en particulier aux feux de forêt. Il est affilié au projet FIRECASTER de l’Agence National de la Recherche (ANR). Ce projet a pour but la création d'une plate-forme numérique de simulation des incendies de forêts et des panaches de fumée associées en zone méditerranéenne. Pour évaluer la quantité de fumée émise par un incendie, il est nécessaire de connaître les facteurs d'émission des polluants.  Les facteurs d’émission se définissent comme la masse d'un polluant spécifique émis dans l’atmosphère par kilogramme de végétation brûlée. Pour les évaluer, on mesure les rapports d'émission qui se définissent comme le rapport entre la masse de polluants émises sur celle des concentrations de CO et CO2. 

CarbOnFire est un système qui permet d’analyser la composition de fumées issues de combustions de végétaux. Le système est installé sur un sac à dos pour être facilement transportable.  Il est équipé d’un système de pompage qui aspire les fumées. L’aspiration se fait au bout d’un tuyau que l’utilisateur place au-dessus des feux. Le bout du tuyau est pourvu d’un filtre de quartz dont le rôle est de capter les particules. Après la mesure, le filtre est analysé au laboratoire par des méthodes chimiques, qui permettent de mettre en évidence sa composition. Les fumées filtrées qui arrivent du tuyau, circulent respectivement dans la pompe, le boîtier de mesure et enfin à travers le compteur à gaz. Elles sont ensuite rejetées dans l’air. Le cœur du système réside dans le boîtier de mesure. Il fait l’acquisition des concentrations de monoxyde (CO) et dioxyde de carbone (CO2), de la température et de la pression. Il enregistre les mesures dans une carte SD pour un traitement ultérieur, et transmet en direct, via Bluetooth, les mesures de gaz et de température. Celles-ci peuvent être visualisées sur le terrain avec un smartphone grâce à l’application CarbOnFire.

## Etat de fonctionnement du système

A l'issue des trois mois de dévellopement, le premier prototype du système est en état de marche. Il fait l'acquisition des mesures de CO, CO2, température et pression. Il enregistre les données sur une carte SD et transmet les mesure de CO, CO2 et température vers une application android. L'ensemble du système est intégré sur un sac à dos. Les mesures réalisées en laboratoire et en conditions reélles ont permis de caractériser la qualité des mesures de gaz. Il en ressort qu la précision obtenue est insuffisante et qu'il faut l'améliorer. Le détail des mesures et de leur analyse est décrit dans la fiche technique du Projet.

## Contenu du Github

Le github contient les programmes arduino du projet, les documents techniques, le code de l'application android avec le fichier .apk, les fichiers des mesures réalisées, et enfin les fichiers associés à la conception du PCB. 
