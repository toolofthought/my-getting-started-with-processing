import processing.pdf.*;
boolean savePDF =  false;

void setup() {
  size(480, 360);
  smooth();
}

void draw() {
  if (savePDF) {
     beginRecord(PDF, "myFunctionBinding.pdf");
  }
  
  strokeWeight(3);
  background(255);
  drawStar();

  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}

void drawStar() {
  strokeWeight(3);
  line(265, 203, 215, 117);
  line(215, 203, 265, 117);
  line(190, 160, 290, 160);
}