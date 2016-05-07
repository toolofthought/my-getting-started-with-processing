import processing.pdf.*;
boolean savePDF =  false;

int randomSeed = 24;

void setup() {
  size(480, 360);
  smooth();
  strokeWeight(5);
  noLoop();
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "myRandomness.pdf");
  }

  background(255);
  float posX;
  float posY;
  
  randomSeed(randomSeed);
  beginShape();
    for (int i = 0; i < 24; i++) {
      posX = 120 + i * 10;
      
      posY = random(120, 240);
      vertex(posX, posY);
  }
  endShape();
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  savePDF = true;
}