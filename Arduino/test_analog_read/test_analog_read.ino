int COPin = A0;  
int CO2Pin = A1;              
float valCO = 0;  
float valCO2 = 0;  
float CO = 0;
float CO2 = 0;
int RCO2 = 220;
int RCO = 100;

void setup() {
  // put your setup code here, to run once:
  
Serial.begin(9600); 
}

void loop() {
  valCO2 = analogRead(CO2Pin);
  valCO = analogRead(COPin) ;// read the input pin
  CO=((valCO*5/1024.0)/RCO-0.004)*(5000/0.016);
  Serial.print("CO :");
  Serial.print(CO);
  Serial.print("ppm - CO2: ");
  CO2=((valCO2*5/1024.0)/RCO2-0.004)*(5000/0.016);
  Serial.print(CO2);
  Serial.println(" ppm");
  delay(200);
}
