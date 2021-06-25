#include <BMP280_DEV.h>
float temperature, pressure, altitude;
BMP280_DEV bmp280; 

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  bmp280.begin();
  bmp280.setTimeStandby(TIME_STANDBY_2000MS);     // Set the standby time to 2 seconds
  bmp280.startNormalConversion();                 // Start BMP280 continuous conversion in NORMAL_MODE

}

void loop() {
  // put your main code here, to run repeatedly:

  while (!bmp280.getMeasurements(temperature, pressure, altitude));  // Check if the measurement is complete
  float a, b, c;
  a = temperature; b = pressure; c = altitude;
  Serial.print(a);
  Serial.print(";");
  Serial.print(b);
  Serial.print(";");
  Serial.print(c);
  Serial.print(",");


}
