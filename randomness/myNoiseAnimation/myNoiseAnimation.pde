import processing.pdf.*;
boolean savePDF =  false;

float posX;
float posY;
float xoff = random(1000);
float stepSize = 0.1;

FloatList history;

void setup() {
    size(480, 360);
    smooth();
  
    history = new FloatList();
    for(int i = 0; i < 24; i++) {
      posY = map(noise(xoff), 0, 1, 120, 240);
      history.append(posY);
    xoff = xoff + stepSize;
    }
  
    frameRate(30);
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "myNoiseAnimation.pdf");
  }
 
  background(255);
  stroke(99, 68, 42);
  strokeWeight(5);
  
    noFill();
    beginShape();
    for (int i = 0; i < 24; i++) {
      posX = 120 + i * 10;
       posY = history.get(i);
      vertex(posX, posY);
    }
    endShape();
  
    history.remove(0);
    history.append(map(noise(xoff), 0, 1, 120, 240));
    xoff = xoff + stepSize;
    
    fill(0);
    textSize(18);
    text("stepSize: " + stepSize, 50, 50);
    
    if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
  savePDF = true;
}


void keyPressed() {
  if (key ==  CODED) {
    if (keyCode == LEFT) {
      stepSize = stepSize - 0.01;
      stepSize = max(0.01, stepSize);
    }
    else if (keyCode == RIGHT) {
      stepSize = stepSize + 0.01;
      stepSize = min(1.0, stepSize);
    }
  }
} 