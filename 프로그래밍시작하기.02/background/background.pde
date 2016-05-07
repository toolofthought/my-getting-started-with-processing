import processing.pdf.*;
boolean savePDF = false;


void setup() {
  size(640, 480);
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "background.pdf");
  }
  background(255); //흰 바탕화면
  ellipse(mouseX, mouseY, 60, 60);
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}