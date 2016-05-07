import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
  strokeWeight(5);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "lines.pdf");
  }
  
  line(120, 120, 360, 240);
  line(120, 240, 360, 120);
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}