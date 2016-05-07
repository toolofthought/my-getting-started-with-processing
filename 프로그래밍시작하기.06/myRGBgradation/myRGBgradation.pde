//myRGBGradation
  void setup() {
    size(480, 360);
    noStroke();
  }

  int nStep = 30;

  void draw() {
    color r = color(255, 0, 0);
    color b = color(0, 0, 255);
    
    float tileWidth = width / nStep;
    for (int i = 0; i < nStep; i++) {
      color mixed = lerpColor(r, b, map(i, 0, nStep - 1, 0, 1));
      fill(mixed);
      rect(tileWidth * i, 0, tileWidth, height);
    }
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myRGBGradation.jpg");
      }
  }