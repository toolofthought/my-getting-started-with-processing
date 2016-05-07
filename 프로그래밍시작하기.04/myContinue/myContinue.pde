import processing.pdf.*;
boolean savePDF =  false;


void setup() {
  size(480, 360);
  smooth();
  noStroke();
  background(255);
}

void draw() {
  if (savePDF) {
     beginRecord(PDF, "myContinue.pdf");
  }
  float c;

  for (int i = 0; i < width; i = i + 30) {
    if(60 == i % 90) {
      continue;
    }
    
    c = map(i, 0, width, 0, 255);
    fill(c);
    rect(i, 0, 30, height);
  }
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}