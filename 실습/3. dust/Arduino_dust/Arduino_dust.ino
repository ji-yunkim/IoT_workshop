int measurePin = A5;
int ledPower = 12;

unsigned int samplingTime = 280;
unsigned int deltaTime = 40;
unsigned int sleepTime = 9680;

float voMeasured = 0;
float calcVoltage = 0;
float dustDensity = 0;

void setup(){
  Serial.begin(9600);
  pinMode(ledPower,OUTPUT);
}

void level(float data){
  if (data>300){
    Serial.println("Condition: DANGEROUS!!!!!!!");
  }
  else if (data>200){
    Serial.println("Condition: VERY BAD :(((");
  }
  else if (data>120){
    Serial.println("Condition: BAD :(( ");
  }
  else if (data>80){
    Serial.println("Condition: POOR :( ");
  }
  else if (data>30){
    Serial.println("Condition: SOSO :| ");
  }
  else if (data>0){
    Serial.println("Condition: GOOD :) ");
  }
  else{
    Serial.println("Condition: ERROR :0 ");
  }
}

void loop(){
  digitalWrite(ledPower,LOW);
  delayMicroseconds(samplingTime);

  voMeasured = analogRead(measurePin);

  delayMicroseconds(deltaTime);
  digitalWrite(ledPower,HIGH);
  delayMicroseconds(sleepTime);

  calcVoltage = voMeasured*(5.0/1024);
  dustDensity = 0.17*calcVoltage-0.1;

  if ( dustDensity < 0)
  {
    dustDensity = 0.00;
  }
  float microgram = dustDensity*1000;
  Serial.println("-----------------------------------------");
  Serial.print("Dust Density : ");
  Serial.print(microgram);
  Serial.println(" µg");
  level(microgram);
  Serial.println("-----------------------------------------");
  delay(1000);
}

