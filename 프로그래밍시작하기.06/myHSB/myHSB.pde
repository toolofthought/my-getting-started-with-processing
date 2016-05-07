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
  int nB = 30;

  void setup() {
    size(480, 360, P3D);
    
    noStroke();
  }

  float sphereRadius;
  float sphereHeight;
  void draw() {
    sphereRadius = 0.4 * min(height, width);
    sphereHeight = min(height, width);

    colorMode(HSB, TWO_PI, sphereRadius, sphereHeight);

    translate(width / 2.0, height / 2.0);
    for (int h = 0; h < nH; h++) {
      for (int s = 0; s < nS; s++) {
        float theta = map(h, 0, nH - 1, 0, TWO_PI);
        float r = map(h, 0, nS - 1, sphrereRadius, 0);
        float posX = r * cos(theta);
        float posY = r * sin(theta);
        
        stroke(posX, posY, sphereHeight);
        point(posX, posY, 0);
      }
    }
  }
        

  void mousePressed() {
        clickX = mouseX;
        clickY = mouseY;
        clickRotateX = rotateX;
        clickRotateY = rotateY;
    }
  
    void setView() {
        translate(100, 100);
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