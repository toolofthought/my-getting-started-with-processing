//myHueSaturationBrightnessDisk
  void setup() {
    size(480, 360);
    colorMode(HSB);
    noStroke();
    ellipseMode(RADIUS);
  }

  int nH = 30;
  int nS = 30;
  float b = 0.0;
  float step = 1.0;
  
  void draw() {
    background(255);
    float radius = min(width, height) * 0.4;
    for (int i = 0; i < nH; i++) {
      for (int j = 0; j < nS;j++) {
        float h = map(i, 0, nH - 1, 0, 255);
        float s = map(j, 0, nS - 1, 255, 0);
              
        fill(h, s, b);
        float start = map(i, 0, nH - 1, 0, TWO_PI);
        float end = start + TWO_PI / nH;
        float r = map(j, 0, nS - 1, radius, 0);
        arc(width / 2.0, height / 2.0, r, r, start, end);
      }
    }

    if (b > 255) {
        step = -1;
    }
    else if (b < 0) {
        step = 1;
    }
    
    b += step;
  }
    void mousePressed() {
        saveFrame("myHueSaturationBrightnessDisk.jpg");
    }
  
   