import processing.pdf.*;
boolean savePDF = false;

void setup() {
    size(480,360);
    smooth();
    background(0);

}


void draw() {
    if(savePDF) {
      beginRecord(PDF, "myDiminishingCircles.pdf");
    }
    
      for (int y = 30; y <= height; y = y + 30) {
        for (int x = 30; x <= width; x = x + 45) {
          ellipse(x + y, y, 40 - y / 10.0, 40 - y / 10.0);
        }
    }


    
    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myDiminishingCircles.jpg");
}