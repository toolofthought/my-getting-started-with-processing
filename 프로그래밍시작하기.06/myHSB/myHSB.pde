// myHSB
  int clickX;
  int clickY;
  int offsetX;
  int offsetY;

  float rotateX;
  float rotateY;
  float clickRotateX;
  float clickRotateY;
  float targetRotateX;
  float targetRotateY;

  int nH = 30;
  int nS = 30;
  int nB = 10;

  color WHITE = color(255, 255, 255);
  float radius;
  
  void setup() {
    size(480, 360, P3D);
    colorMode(HSB);
    radius = min(width, height) * 0.4;
    ellipseMode(RADIUS);
    noStroke();
  }

  void draw() {
    background(WHITE);
    setView();
    for (int b = 0; b < nB; b++) {
      pushMatrix();
      
      float cylinderHeight = map(b, 0, nB - 1, 0, radius);
      float brightness = map(b, 0, nB - 1, 0, 255);
      translate(0, 0, cylinderHeight);
      
      for (int h = 0; h < nH; h++) {
        for (int s = nS; s > 0; s--) {
          float begin = map(h, 0, nH - 1, 0, TWO_PI);
          float end = begin + TWO_PI / float(nH);
          float hue = map(h, 0, nH - 1, 0, 255);

          float r = map(s, 0, nS - 1, 0, radius);
          float saturation = map(s, 0, nS - 1, 0, 255);      
          
          fill(hue, saturation, brightness);
          arc(0, 0, r, r, begin, end);
        }
      }
      popMatrix();
    }

  }

  void mousePressed() {
        clickX = mouseX;
        clickY = mouseY;
        clickRotateX = rotateX;
        clickRotateY = rotateY;
  }

  void setView() {
        translate(width / 2.0, height / 2.0);
        if (mousePressed) {
          offsetX = mouseX - clickX;
          offsetY = mouseY - clickY;
          targetRotateX = clickRotateX + offsetX / float(width) * TWO_PI;
          targetRotateY = clickRotateY + offsetY / float(height) * TWO_PI;
          rotateX += (targetRotateX - rotateX) * 0.25;
          rotateY += (targetRotateY - rotateY) * 0.25;
        }
        rotateX(-rotateY);
        rotateY(rotateX);
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myHSB.jpg");
      }
  }