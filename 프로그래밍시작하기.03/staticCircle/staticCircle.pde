
import processing.pdf.*;
boolean savePDF = false;


float posX;
float posY;

void setup() {
  size(480, 360);
  smooth();
  strokeWeight(5);
  
  posX = width / 2;
  posY = height / 2;

}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "staticCircle.pdf");
  }
  
  background(201);  
  ellipse(posX, posY, 30, 30);

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}