import processing.pdf.*;
boolean savePDF =  false;

float xoff = random(1000);

void setup() {
  size(480, 360);
  smooth();
  noLoop();
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "myNoise.pdf");
  }

  background(255);
  float posX;
  float posY;
  
  stroke(99, 68, 42);
    strokeWeight(5);

  beginShape();
  for (int i = 0; i < 24; i++) {
    posX = 120 + i * 10;
    posY = map(noise(xoff), 0, 1, 120, 240);
    vertex(posX, posY);
    xoff = xoff + 0.1;
  }
  endShape();
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
  savePDF = true;
}