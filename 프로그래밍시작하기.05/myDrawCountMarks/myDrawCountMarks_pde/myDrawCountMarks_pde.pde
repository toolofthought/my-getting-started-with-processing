import processing.pdf.*;
boolean savePDF = false;

int nMarkX = 4;
int nMarkY = 3;

float margin = 20;

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
    
    float markX = (width - margin * (nMarkX + 1)) / nMarkX;
    float markY = (height - margin * (nMarkY + 1)) / nMarkY;

    for (int y = 0; y < nMarkY; y++) {
      for (int x = 0; x < nMarkX; x++) {
          drawCountMark(margin + x * (markX + margin), margin + y * (markY + margin), markX, markY);
      }
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