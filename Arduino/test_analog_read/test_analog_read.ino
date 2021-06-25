
int analogPin = A3;                 
float val = 0;  
float CO2 = 0;
int R = 220;

void setup() {
  // put your setup code here, to run once:
  
Serial.begin(9600); 
}

void loop() {
  val = analogRead(analogPin);  // read the input pin
  CO2=((val*5/1024.0)/R-0.004)*(5000/0.016);
  Serial.print(CO2);
  Serial.println(" ppm");// debug value
  delay(200);
}
