#include <SD.h>
#include <BMP280_DEV.h>
#include <MD_DS1307.h>
#include <Wire.h>

#define DATA_DIR "DONNEE"
#define TAILLE_TABLEAU 11
#define R_CO 100  //Resistance de Mesure du CO
#define R_CO2 220 //Resistance de Mesure du CO2
#define COPin A0   // Pin de lecture du CO
#define CO2Pin A1  // Pin de lecture du CO2

//Variables 

float temperature, pressure, altitude, CO2, CO;
double Tab_Mesure[TAILLE_TABLEAU];

File donnee;
BMP280_DEV bmp280;   // Instantiate (create) a BMP280_DEV object and set-up for I2C operation (address 0x77)



float ConcentrationCO() {
  
  //transforme la mesure analogique en une valeur de ppm
  float mesure = analogRead(COPin);
  float mCO = 0;
  mCO = ((mesure * 5 / 1024.0) / R_CO - 0.004) * (5000 / 0.016);
  return mCO;
}

float ConcentrationCO2() {
  
  //transforme la mesure analogique en une valeur de ppm
  float mesure = analogRead(CO2Pin);
  float mCO2 = 0;
  mCO2 = ((mesure * 5 / 1024.0) / R_CO2 - 0.004) * (5000 / 0.016);
  return mCO2;
}


void InitialiserTabMesure(double Tab[TAILLE_TABLEAU]) {
  for (int i = 0; i < TAILLE_TABLEAU; i++) {
    Tab[i] = 0;
  }
}


void EcritureCarteSD(double Tab[TAILLE_TABLEAU]) {
  donnee = SD.open("DONNEE/Data.txt", FILE_WRITE);

  //ecriture des mesures
  for (int i = 0; i < 5; i++) {
    donnee.print(Tab[i]);
    donnee.print(",");
  }

  //ecriture de la date
  donnee.print(lround(Tab[5])); donnee.print("-");
  donnee.print(lround(Tab[6])); donnee.print("-");
  donnee.print(lround(Tab[7])); donnee.print(" ");
  donnee.print(lround(Tab[8])); donnee.print(":");
  donnee.print(lround(Tab[9])); donnee.print(":");
  donnee.print(lround(Tab[10]));
  donnee.println("");
  donnee.close();
}


void EnvoieBluetooth(double tab[TAILLE_TABLEAU]) {
  float a, b;
  a = tab[3]; b = tab[4];
  Serial.print(a);
  Serial.print(";");
  Serial.print(b);
  Serial.println("");
}



void setup() {

  
 // ------------ Initialisation du port série et du capteur bmp280 ------------------------------------------------------
 
  Serial.begin(9600);
  bmp280.begin();
  bmp280.setTimeStandby(TIME_STANDBY_2000MS);     // Set the standby time to 2 seconds
  bmp280.startNormalConversion();                 // Start BMP280 continuous conversion in NORMAL_MODE


// ------------ Préparation du fichier de mesure sur la carte SD --------------------------------------------------------

  while (!SD.begin());
  if (!SD.exists(DATA_DIR)) {
    SD.mkdir(DATA_DIR);
    donnee = SD.open("DONNEE/Data.txt", FILE_WRITE);
    donnee.println("Temp ,press , alti ,  CO,  CO2,  date               ");
    donnee.close();
  }
}

void loop() {


// ------------ Attente des mesures du bmp280 et vérification de la présence d'une carte SD -----------------------------

  while (!bmp280.getMeasurements(temperature, pressure, altitude));  // Check if the measurement is complete
  RTC.readTime();
  while (!SD.begin());


// ------------ Sauvegarde des mesures dans un tableau TabMesure --------------------------------------------------------

  InitialiserTabMesure(Tab_Mesure);

  Tab_Mesure[0] = temperature;
  Tab_Mesure[1] = pressure;
  Tab_Mesure[2] = altitude;
  Tab_Mesure[3] = ConcentrationCO();
  Tab_Mesure[4] = ConcentrationCO2();
  Tab_Mesure[5] = RTC.yyyy;
  Tab_Mesure[6] = RTC.mm;
  Tab_Mesure[7] = RTC.dd;
  Tab_Mesure[8] = RTC.h;
  Tab_Mesure[9] = RTC.m;
  Tab_Mesure[10] = RTC.s;


// ----------- Sauvegarde des Mesures dans la carte SD et transmissions des données par Bluetooth -------------------------

  EcritureCarteSD(Tab_Mesure);
  EnvoieBluetooth(Tab_Mesure);

}
