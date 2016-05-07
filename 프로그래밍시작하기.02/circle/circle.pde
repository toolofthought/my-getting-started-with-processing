import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "circle.pdf");
  }
  
  background(200);
  stroke(0);
  strokeWeight(5);
  fill(255);
  ellipse(240, 180, 50, 50);

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}