import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
  strokeWeight(5);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "triangle.pdf");
  }
  
  triangle(120, 120, 360, 120, 240, 240);
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}