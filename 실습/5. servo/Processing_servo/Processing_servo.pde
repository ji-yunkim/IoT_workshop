/* Servo Control - hand/finger position controls servo motor angle.
By Casey Bloomquist
Using the OnFormative LeapMotionP5 library (http://www.onformative.com/lab/leapmotionp5/)
*/

import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
LeapMotionP5 leap;

int angle;
int angle2;
import processing.serial.*;
Serial port;

public void setup() {
  // set window, P3D = 3D rendering
  size(600, 60, P3D); 
  noFill();
  stroke(225);
  
  // set LEAP object
  leap = new LeapMotionP5(this); 
  
  // set com port. Currently: "COM10"
  println("Available serial ports:");
  println(Serial.list());
  port = new Serial(this, "COM10", 9600); 
 }

public void draw() {
  background(255);
  fill(0);
  for (Finger f : leap.getFingerList()) {
    PVector position = leap.getTip(f);
    //PVector velocity = leap.getVelocity(f);
    ellipse(position.x, position.y, 50, 50);
    if (position.x > 
    1200) {
      angle =0;
    } else if (position.x < -100) {
      angle =180;
    } else {
      angle = int((position.x) / 4);
    }
    port.write(140-angle);
    println(angle);
  }
} 

public void stop() {
  leap.stop();
 }  
 