//myFill
  void setup() {
    size(480, 360);
    frameRate(1);
  }

  int nX = 12;
  int nY = 9;
  float margin = 5.0;
  void draw() {
    float tileX = (width - (nX - 1) * margin) / nX;
    float tileY = (height - (nY - 1) * margin) / nY;
    
    for (int y = 0; y < nY; y++) {
      for (int x = 0; x < nX; x++) {
        float r = random(255);
        float g = random(255);
        float b = random(255);
        fill(r, g, b);
        float posX = x * (tileX + margin);
        float posY = y * (tileY + margin);
        rect(posX, posY, tileX, tileY);
      }
    }
  } 
  void mousePressed() {
      saveFrame("myFill.jpg");
  }