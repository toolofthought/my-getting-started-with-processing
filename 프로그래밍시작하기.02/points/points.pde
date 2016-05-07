import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
  strokeWeight(5);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "points.pdf");
  }
  
  point(120, 120);
  point(120, 240);
  point(360, 120);
  point(360, 240);
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}