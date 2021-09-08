//#include "SPI.h"
#include "Communication.h"
#include "CN0396.h"

float CO = 0;

void setup() {
  
  Serial.begin(9600);
  delay(1000);
  CN0396_Init();

}

void loop() {

  delay(500);
  CN0396_SetAppData();
  CO = GetMeasurementCO();
  Serial.println(CO);
}
