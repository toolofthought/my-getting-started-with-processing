//myHueDisk
  void setup() {
    size(480, 360);
    colorMode(HSB);
    noStroke();
  }

  int nH = 30;
  
  void draw() {
    background(255);
    float radius = min(width, height) * 0.8;
    for (int i = 0; i < nH; i++) {
      float h = map(i, 0, nH - 1, 0, 255);
      fill(h, 255, 255);
      float start = map(i, 0, nH - 1, 0, TWO_PI);
      float end = start + TWO_PI / nH;
      arc(width / 2.0, height / 2.0, radius, radius, start, end);
    }
  }
    void mousePressed() {
        saveFrame("myHueDisk.jpg");
    }
  
   