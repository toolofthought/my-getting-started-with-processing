
import processing.pdf.*;
boolean savePDF = false;

float posX;
float posY;
float velocityX;
float velocityY;
float accelerationX;
float accelerationY;

void setup() {
  size(480, 360);
  smooth();
  strokeWeight(5);
  
  posX = width / 2;
  posY = height / 2;

  velocityX = 1;
  velocityY = 1;
  accelerationX = 1;
  accelerationY = 1;
    
  
  background(201);
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "acceleration.pdf");
  }
  
  background(201);
  velocityX = velocityX + accelerationX;
  velocityY = velocityY + accelerationY;

  velocityX = min(8, velocityX);
  velocityY = min(8, velocityY);

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

void keyReleased() {
  if (key == 'p' || key == 'P') {
    savePDF = true;
  }
}