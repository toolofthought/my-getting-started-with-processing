import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
    smooth();
   background(255);
}

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myFineLines.pdf");
    }
    
    for (int i = 0; i < 28; ++i) {
        strokeWeight(0.5);
        line(160 + i * 10, 90, 60 + i * 10, 270);
    }
    
    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
}