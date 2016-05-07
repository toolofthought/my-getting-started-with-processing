//myHSBGradation
  void setup() {
    size(480, 360);
    noStroke();
  }

  int nStep = 30;

  void draw() {
    colorMode(RGB);
    color r = color(255, 0, 0);
    color g = color(0, 255, 0);
    color b = color(0, 0, 255);
    
    colorMode(HSB);
    float tileWidth = (0.5 * width) / nStep;
    for (int i = 0; i < nStep; i++) {
      color mixed = lerpColor(r, g, map(i, 0, nStep - 1, 0, 1));
      fill(mixed);
      rect(tileWidth * i, 0, tileWidth, height);
    }
    for (int i = 0; i < nStep; i++) {
      color mixed = lerpColor(g, b, map(i, 0, nStep - 1, 0, 1));
      fill(mixed);
      rect((0.5 * width) + tileWidth * i, 0, tileWidth, height);
    }
  }