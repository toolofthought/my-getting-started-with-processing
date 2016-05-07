import processing.pdf.*;
boolean savePDF = false;

void setup() {
    size(480, 360);
    smooth();
    noFill();
    background(255);
    ellipseMode(RADIUS);


}

int radius = 30;

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myOverlappingCircles.pdf");
    }
    
     for (int y = radius; y + radius <= height; y = y + radius) {
        for (int x = radius; x + radius <= width; x = x + radius) {
          ellipse(x, y, radius, radius);
        }
    }


    
    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myOverlappingCircles.jpg");
}