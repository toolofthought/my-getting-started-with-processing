import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 480);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "vertex_open.pdf");
  }
  
  strokeWeight(5);
  background(200);
  beginShape();
    vertex(120, 120);
    vertex(240, 120);
    vertex(240, 240);
    vertex(360, 240);
    vertex(360, 360);
    vertex(120, 360);
  endShape();

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}