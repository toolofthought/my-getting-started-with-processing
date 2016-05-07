import processing.pdf.*;
boolean savePDF =  false;

color fillValue = color(125);

void setup() {
  size(480, 360);
}

void draw() {
  if (savePDF) {
     beginRecord(PDF, "myForLoop.pdf");
  }
  
  background(255);
  strokeWeight(5);
  for (int i = 0; i < 14; ++i) {
    line(160 + i * 20, 90, 60 + i * 20, 270);
  }
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}