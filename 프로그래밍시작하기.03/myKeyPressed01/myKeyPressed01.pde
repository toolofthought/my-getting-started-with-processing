import processing.pdf.*;
boolean savePDF =  false;

void setup() {
  size(480, 360);
}

void draw() {
  if (savePDF) {
     beginRecord(PDF, "myKeyPressed01.pdf");
  }
  
  background(255);
  if (keyPressed) {
    ellipse(240, 180, 40, 40);
  }
  else {
    rect(220, 160, 40, 40);
  }
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}