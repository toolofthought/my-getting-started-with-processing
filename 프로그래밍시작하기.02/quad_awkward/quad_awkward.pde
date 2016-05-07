import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "quad_awkward.pdf");
  }
  
  background(200);
  stroke(0);
  fill(100);
  quad(120, 120, 400, 300, 360, 120, 60, 180);

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}