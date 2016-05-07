//myHue
  void setup() {
    size(480, 360);
    colorMode(HSB);
    noStroke();
  }

  int nH = 30;
  void draw() {
    float tileX = width / nH;
    for (int i = 0; i < nH; i++) {
      float posX = map(i, 0, nH - 1, 0, width);
      float h = map(i, 0, nH - 1, 0, 255);
      fill(h, 255, 255);
      rect(posX, 0, tileX, height);
    }
  }

    void mousePressed() {
        saveFrame("myHue.jpg");
    }
  
   