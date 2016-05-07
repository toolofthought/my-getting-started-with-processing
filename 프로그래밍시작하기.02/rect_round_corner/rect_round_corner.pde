import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "rect_round_corner.pdf");
  }
  
  background(200);
  stroke(0);
  fill(255);
  rect(100, 100, 200, 150, 30);


  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}