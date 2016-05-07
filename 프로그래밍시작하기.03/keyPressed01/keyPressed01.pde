import processing.pdf.*;
boolean savePDF = false;



void setup() {
  size(480, 360);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "keyPressed01.pdf");
  }
  
  background(255);
  if (keyPressed) {
    ellipse(240, 180, 40, 40);
  }
  else {
    rect(220, 160, 40, 40);
  }


  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}