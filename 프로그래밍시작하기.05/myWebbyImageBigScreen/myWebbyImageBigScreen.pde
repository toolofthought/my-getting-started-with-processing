import processing.pdf.*;
boolean savePDF = false;

float[] posXs = new float[]{
1490,1465,1394,1283,1144,990,835,696,585,514,490,514,585,696,835,989,1144,1283,1394,1465,1490};

float[] posYs = new float[]{
540,694,833,944,1015,1040,1015,944,833,694,540,385,246,135,64,40,64,135,246,385,539};         

void setup() {
    size(1980, 1080);
    background(255);
    smooth();
}

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myWebbyImage.pdf");
    }
    
    strokeWeight(0.1);
    for (int i = 0; i < posXs.length; i++) {
      if((0.9 < random(1)) && (dist(posXs[i], posYs[i], mouseX, mouseY) < 500)) {
        line(posXs[i], posYs[i], mouseX, mouseY);
        }
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myWebbyImage.jpg");
}