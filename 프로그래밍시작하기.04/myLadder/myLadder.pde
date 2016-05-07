import processing.pdf.*;

void setup() {
  size(480, 360);
  smooth();
  background(255);
  strokeWeight(30);
  stroke(80, 30);
  noLoop();
}


void draw() {
 
 for (int i = 0; i < 4; i = i  + 1) {
    line(120 + i * 60, 120, 120 + (i + 1) * 60, 120 + 60);
    line(120 + i * 60, 120 + 60, 120 + (i + 1) * 60, 120);
  }
}