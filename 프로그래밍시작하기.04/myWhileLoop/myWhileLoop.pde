import processing.pdf.*;
boolean savePDF =  false;

void setup() {
  size(480, 360);
  smooth();
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "myWhileLoop.pdf");
  }

  background(255);
  int i = 0;
  float c;
  while (i < width) {
    c = map(i, 0, width, 0, 255);
    fill(c);
    noStroke();
    rect(i, 0, 30, height);
    i = i + 30;
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}