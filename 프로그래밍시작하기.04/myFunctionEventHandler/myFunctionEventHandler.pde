import processing.pdf.*;
boolean savePDF =  false;

color toggle = 0;

void setup() {
  size(480, 360);
  smooth();
}

void draw() {
  if (savePDF) {
     beginRecord(PDF, "myFunctionEventHandler01.pdf");
  }
  
  background(255);
  strokeWeight(5);
  fill(toggle);
  ellipse(mouseX, mouseY, 100, 100);


  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    savePDF = true;
  }
}

void mouseClicked() {
    if (toggle == 0) {
        toggle = 255;
    }
    else {
        toggle = 0;
    }
}