import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(480, 360);
  smooth();
  background(255);


}

int grid = 40;

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myDrawCountMarks.pdf");
    }
    
   drawCountMark(width / 2, height / 2, 40, 40);

    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myDrawCountMarks.jpg");
}

void drawCountMark(float posX, float posY, float width, float height) {
  float margin = width / 3.0;
  for (int i = 0; i < 4; i++) {
    line(posX + margin * i, posY, posX + margin * i, posY + height);
  }
  line(posX, posY, posX + width, posY + height);
}