import processing.pdf.*;
boolean savePDF =  false;

int randomSeed = 100;
int noiseSeed = 100;
float posX;
float posY;

ArrayList<float> posXs = new ArrayList<float>();
ArrayList<float> posYs = new ArrayList<float>();

void setup() {
  size(480, 360);
  smooth();

  for(int i = 0; i < 24; i++) {
    posX = 120 + i * 10;
    posY = random(120, 240);
    posXs.add(posX);
    posYs.add(posY);
  }
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "myRandomness.pdf");
  }

  background(255);
  stroke(99, 68, 42);
    strokeWeight(5);
  
  beginShape();
  for (int i = 0; i < 24; i++) {
    vertex(posXs.get(i), posYx.get(i));
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

void mouseReleased() {
  randomSeed = int(random(1000));
}