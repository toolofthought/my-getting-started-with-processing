import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "arc.pdf");
  }
  
  background(200);
  stroke(0);
  strokeWeight(5);
  noFill();
  arc(240, 180, 50, 50, 0, HALF_PI);
  arc(240, 180, 80, 80, HALF_PI, PI);
  arc(240, 180, 110, 110, PI, PI + QUARTER_PI);
  fill(255);
  arc(240, 180, 150, 150, PI + QUARTER_PI, TWO_PI);


  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}