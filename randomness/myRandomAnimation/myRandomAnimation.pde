import processing.pdf.*;
boolean savePDF =  false;

float posX;
float posY;

FloatList posYs;

void setup() {
  size(480, 360);
  smooth();
  
  posYs = new FloatList();
  for(int i = 0; i < 24; i++) {
    posY = random(120, 240);
    posYs.append(posY);
  }
  
  frameRate(5);
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "myRandomnessAnimation.pdf");
  }
 
  background(255);
  stroke(99, 68, 42);
  strokeWeight(5);
  
  beginShape();
  for (int i = 0; i < 24; i++) {
    posX = 120 + i * 10;
    posY = posYs.get(i);
    vertex(posX, posY);
  }
  endShape();
  
  posYs.remove(0);
  posYs.append(random(120, 240));
  
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
  savePDF = true;
}