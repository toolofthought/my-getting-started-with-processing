
import processing.pdf.*;
boolean savePDF = false;

float posX;
float posY;
float noffX;
float noffY;



void setup() {
  size(480, 360);
  smooth();
  strokeWeight(5);
  noffX = random(1000);
  noffY = random(1000);
  
  beginRecord(PDF, "noise.pdf");
  background(201);
}

void draw() {
  //background(201);
  posX = map(noise(noffX), 0, 1, 0, width);
  posY = map(noise(noffY), 0, 1, 0, height);
  
  ellipse(posX, posY, 30, 30);
  
  noffX = noffX + 0.01;
  noffY = noffY + 0.01;
  if (key == 'q' || key == 'Q') {
    endRecord();
  }
}