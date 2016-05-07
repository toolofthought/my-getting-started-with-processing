
import processing.pdf.*;
boolean savePDF = false;

float posX;
float posY;

void setup() {
  size(480, 360);
  smooth();
  strokeWeight(5);
    
  beginRecord(PDF, "random.pdf");
  background(201);
}

void draw() {
  //background(201);
  posX = random(width);
  posY = random(height);
  
  ellipse(posX, posY, 30, 30);
  
  if (key == 'q' || key == 'Q') {
    endRecord();
  }
}