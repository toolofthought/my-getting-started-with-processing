import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(640, 480);
  smooth();
  strokeWeight(2);
  background(204);
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "P5Variable.pdf");
  }
  
  int x = 219;
  int y = 257;
  
  int neckLength = 95;
  int headWidth = 80;
  int headX = x + 57;
  int headY = y - neckLength - 7;
  int bodyWidth = 90;
  int bodyHeight = 120;
  int bodyBandHeight = 6;
  int bodySphereWidth = 70;
    
  //neck
  stroke(102);
  line(x + 47, y, x + 47, y - neckLength);
  line(x + 57, y, x + 57, y - neckLength);
  line(x + 67, y, x + 67, y - neckLength);
  
  //antenna
  line(headX, headY, headX - 30, headY - 43);
  line(headX, headY, headX + 30, headY - 99);
  line(headX, headY, headX + 66, headY + 15);
  
  //body
  noStroke();
  fill(102);
  ellipse(x + bodyWidth / 2, y + bodyHeight, bodySphereWidth, bodySphereWidth);
  fill(0);
  rect(x, y, bodyWidth, bodyHeight);
  fill(102);
  rect(x, y + 17, bodyWidth, bodyBandHeight);
  
  //head
  fill(0);
  ellipse(headX, headY, headWidth, headWidth);
  fill(255);
  ellipse(headX + 12, headY - 5, headWidth * 3 / 8, headWidth * 3 / 8);
  fill(0);
  ellipse(headX + 12, headY - 5, headWidth / 8, headWidth / 8);
  fill(153);
  ellipse(headX - 13, headY - 7, headWidth / 8, headWidth / 8);
  ellipse(headX + 20, headY - 25, headWidth / 16, headWidth / 16);
  ellipse(headX + 29, headY + 7, headWidth / 16, headWidth / 16);
  
  println("(" + headX + ", " + headY + ")");
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased() {
  if (key == 'p' || key == 'P') {
    savePDF = true;
  }
}