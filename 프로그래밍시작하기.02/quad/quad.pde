import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "quad.pdf");
  }
  
  background(200);
  stroke(0);
  fill(100);
  quad(120, 120, 360, 120, 400, 300, 60, 180);
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}