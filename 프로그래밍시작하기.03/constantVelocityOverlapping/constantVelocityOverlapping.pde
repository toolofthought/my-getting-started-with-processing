
import processing.pdf.*;
boolean savePDF = false;

float posX;
float posY;
float velocityX;
float velocityY;


void setup() {
  size(480, 360);
  smooth();
  strokeWeight(5);
  
  posX = width / 2;
  posY = height / 2;
  
  velocityX = 1;
  velocityY = 1;
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "constantVelocityOverlapping.pdf");
  }
  
   background(201);
  posX = posX + velocityX;
  posY = posY + velocityY;
  
  if (posX > width) {
  posX = 0;
  }

  if (posY > height) {
  posY = 0;
  }
  
  if (posX < 0) {
  posX = width;
  }

  if (posY < 0) {
  posY = height;
  }
  
  ellipse(posX, posY, 30, 30);


  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}