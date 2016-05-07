import processing.pdf.*;
boolean savePDF = false;

void setup() {
    size(480, 360);
    smooth();
    noStroke();
    background(255);
    ellipseMode(RADIUS);
    colorMode(HSB);
    frameRate(1);

}

float radius = 40;


void draw() {
    if(savePDF) {
      beginRecord(PDF, "myCircles.pdf");
    }
    
    int nX = int(width / radius / 2.0);
    int nY = int(height / radius / 2.0);

    for (int y = 0; y <= nY; y++) {
        for (int x = 0; x <= nX; x++) {
            fill(10, random(100, 255), random(10, 255));
             ellipse(x * 2 * radius, y * 2 * radius, radius, radius);
        }
    }
    
    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myCircles.jpg");
}