import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
import processing.serial.*;
 Serial port;

LeapMotionP5 leap;



public void setup() {
  size(500, 500);
  port = new Serial(this,"COM8",9600);
  leap = new LeapMotionP5(this);
  println("Avarilable serial ports:");
  println(Serial.list());
  printArray(Serial.list());
}

public void draw() {
  background(0);
  fill(255);
  int num = 0;
  /*
  int one = 1;
  int two = 2;
  int three = 3;
  int four = 4;
  int five = 5;
  */
  
  for (Finger finger : leap.getFingerList()) {
    PVector fingerPos = leap.getTip(finger);
    ellipse(fingerPos.x, fingerPos.y, 10, 10);
    num = num+1;
    delay(100);
}
  port.write(String.valueOf(num));
  //print(num);
}

public void stop() {
  leap.stop();
}