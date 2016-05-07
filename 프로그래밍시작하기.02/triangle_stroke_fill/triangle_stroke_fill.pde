import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "triangle_stroke_fill.pdf");
  }
  
  background(200);
  stroke(0);
  triangle(120, 120, 360, 120, 240, 240);

  stroke(255);
  fill(100);
  triangle(120, 240, 360, 240, 240, 120);


  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}