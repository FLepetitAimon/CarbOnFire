//#include "SPI.h"
#include "Communication.h"
#include "CN0396.h"

// Declaration des Variables 

float CO = 0;
float CO_Corrected = 0;



void setup() {
  
  Serial.begin(9600);
  
  delay(1000);
  
  CN0396_Init(); // Initialisation de la carte CN0396

}

void loop() {
  
  CN0396_SetAppData();                          // Acquisition des mesures
  CO = GetMeasurementCO();                      // Enregistrement des mesures de CO non corrigées
  CO_Corrected = GetMeasurementCO_corrected();  // Enregistrement des mesures de CO corrigées en température


  // Affichage des mesures
  
  Serial.print("Concentration de CO :"); 
  Serial.print(CO);
  Serial.print("ppm ; Concentration de corrigée : ");
  Serial.print(CO_Corrected);
  Serial.println("ppm");

  
  delay(500); // Periode d'échantillonage de 500ms
}
