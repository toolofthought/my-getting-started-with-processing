import processing.pdf.*;
boolean savePDF = false;

int nTileX = 12;
int nTileY = 9;

float margin = 5;

void setup() {
  size(480, 360);
    smooth();
    background(255);
    colorMode(HSB);
    noLoop();
}

int grid = 40;

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myMoroccanTile.pdf");
    }
    
    float tileX = (width - margin * (nTileX - 1)) / nTileX;
    float tileY = (height - margin * (nTileY - 1)) / nTileY;

    for (int y = 0; y < nTileY; y++) {
        for (int x = 0; x < nTileX; x++) {
          fill(10, random(200, 255), random(100, 255));
          rect(x * (tileX + margin), y * (tileY + margin), tileX, tileY);
        }
    }


}

void mousePressed() {
    savePDF = true;
    saveFrame("myMoroccanTile.jpg");
}

void drawCountMark(float posX, float posY, float width, float height) {
  float margin = width / 3.0;
  for (int i = 0; i < 4; i++) {
    line(posX + margin * i, posY, posX + margin * i, posY + height);
  }
  line(posX, posY, posX + width, posY + height);
}