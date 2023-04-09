#include <Servo.h>
Servo myServo;

//int handPos;
//int angle;

void setup() {
  myServo.attach(9);
  Serial.begin(9600);
  myServo.write(90);
}

void loop() {
  byte angle;
  if (Serial.available()) {
    // Read angle from Processing
    angle = Serial.read();
    Serial.println(angle);
    // If fingers in window, read servo angle
    myServo.write(angle);
    delay(15);
  }
}
