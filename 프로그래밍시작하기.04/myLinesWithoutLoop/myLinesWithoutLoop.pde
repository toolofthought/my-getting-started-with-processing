import processing.pdf.*;
boolean savePDF =  false;

color toggle = 0;

void setup() {
  size(480, 360);
  smooth();
}

void draw() {
  if (savePDF) {
    beginRecord(PDF, "myLinesWithoutLoop.pdf");
  }

  strokeWeight(5);
  background(255);
  line(160, 90, 60, 270);
  line(180, 90, 80, 270);
  line(200, 90, 100, 270);
  line(220, 90, 120, 270);
  line(240, 90, 140, 270);
  line(260, 90, 160, 270);
  line(280, 90, 180, 270);
  line(300, 90, 200, 270);
  line(320, 90, 220, 270);
  line(340, 90, 240, 270);
  line(360, 90, 260, 270);
  line(380, 90, 280, 270);
  line(400, 90, 300, 270);
  line(420, 90, 320, 270);




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

void mouseReleased() {
  savePDF = true;
}