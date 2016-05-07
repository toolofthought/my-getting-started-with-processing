import processing.pdf.*;
boolean savePDF = false;

void setup() {
   size(480, 360);
    smooth();
    background(255);
    noLoop();
}

int margin = 30;

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myPerspective.pdf");
    }
    
    for (int y = margin; y + margin <= height; y = y + margin) {
        for (int x = margin; x + margin <= width; x = x + margin) {
          stroke(50, 50);
          line(x, y, width / 2.0, height / 2.0);
    }
  }



    
    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myPerspective.jpg");
}