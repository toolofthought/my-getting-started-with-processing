import processing.pdf.*;
boolean savePDF =  false;

color fillValue = color(125);

void setup() {
  size(480, 360);
}

void draw() {
  if (savePDF) {
     beginRecord(PDF, "myKeyCodeDefault.pdf");
  }
  
  background(255);
  fill(fillValue);
  ellipse(240, 180, 40, 40);
  if (key == CODED) {
    if (keyCode == UP) {
      fillValue = 255;
    }
    else if (keyCode == DOWN) {
      fillValue = 0;
    }
  }
  else {
    fillValue = 125;
  }

  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}