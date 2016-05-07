import processing.pdf.*;
boolean savePDF = false;

float[] posXs = new float[]{
360, 354, 337, 310, 277, 240, 202, 169, 142, 125, 120, 125, 142, 169, 202, 239, 277, 310, 337, 354, 360};

float[] posYs = new float[]{
180, 217, 250, 277, 294, 300, 294, 277, 250, 217, 180, 142, 109, 82,  65,  60,  65,  82, 109, 142, 179};

void setup() {
    size(480, 360);
    background(255);
    smooth();
}

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myWebbyImage.pdf");
    }
    
    strokeWeight(0.1);
    for (int i = 0; i < posXs.length; i++) {
      if((0.9 < random(1)) && (dist(posXs[i], posYs[i], mouseX, mouseY) < 180)) {
        line(posXs[i], posYs[i], mouseX, mouseY);
        }
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myWebbyImage.jpg");
}