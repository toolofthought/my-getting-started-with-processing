import processing.pdf.*;
boolean savePDF =  false;

float xoff = random(1000);
float yoff = random(1000);
float radius = 30;

void setup() {
  size(480, 360);
  smooth();
  ellipseMode(CENTER);
}

void draw() {
   if (savePDF) {
    beginRecord(PDF, "myFishProcedural.pdf");
  }
  float posX = map(noise(xoff), 0, 1, 0, width);
  float posY = map(noise(yoff), 0, 1, 0, height);
  
  background(255);
  strokeWeight(5);
  ellipse(posX, posY, radius, radius);
  
  xoff = xoff + 0.01;
  yoff = yoff + 0.01;
  
 if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
  savePDF = true;
}