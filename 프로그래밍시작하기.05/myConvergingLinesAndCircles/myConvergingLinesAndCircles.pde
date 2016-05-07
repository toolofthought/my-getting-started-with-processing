import processing.pdf.*;
boolean savePDF = false;

void setup() {
    size(480, 360);
    smooth();
    background(255);
    ellipseMode(RADIUS);
    colorMode(HSB);
    frameRate(1);
}

float size = 20;


void draw() {
    if(savePDF) {
      beginRecord(PDF, "myConvergingLinesAndCircles.pdf");
    }
    
    int nX = int(width / size / 2.0);
    int nY = int(height / size / 2.0);

    for (int y = 0; y <= nY; y++) {
        for (int x = 0; x <= nX; x++) {
          strokeWeight(0.5);
          line(x * 2 * size, y * 2 * size, width / 2.0, height / 2.0);
        }
    }
  
   for (int y = 0; y <= nY; y++) {
        for (int x = 0; x <= nX; x++) {
          fill(10, random(100, 255), random(10, 255));
          ellipse(x * 2 * size, y * 2 * size, 10, 10);
        }
    }

    
    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myConvergingLinesAndCircles.jpg");
}