import processing.pdf.*;
boolean savePDF =  false;

void setup() {
  size(480, 360);
  smooth();
}

void draw() {
  if (savePDF) {
     beginRecord(PDF, "myFunctionParameters.pdf");
  }
  
  strokeWeight(3);
  background(255);
  drawStar(mouseX, mouseY);

  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}

void drawStar(int posX, int posY) {
    strokeWeight(3);
    line(posX + 25, posY + 43, posX - 25, posY - 43);
    line(posX - 25, posY  + 43, posX + 25, posY - 43);
    line(posX - 50, posY, posX + 50, posY);
}