import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "mouse.pdf");
  }
  
  background(201);
  ellipse(mouseX, mouseY, 30, 30);
  
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