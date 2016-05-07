
import processing.pdf.*;
boolean savePDF = false;


float posX;
float posY;
float velocityX;
float velocityY;
float r;


void setup() {
  size(480, 360);
  smooth();
  strokeWeight(5);
  
  size(480, 360);
  smooth();
  strokeWeight(5);
  
  posX = width / 2;
  posY = height / 2;

  velocityX = 1;
  velocityY = 1;

  r = 30;
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "constantVelocity.pdf");
  }
  
  background(201);
  posX = posX + velocityX;
  posY = posY + velocityY;
  ellipse(posX, posY, 30, 30);

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}