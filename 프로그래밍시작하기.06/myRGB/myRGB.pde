//myRGB
    void setup() {
      size(480, 360, P3D);
      background(255);
    colorMode(RGB);
    }

  
    float margin = 5.0;
    float size = 30;
  
    int nX = 5;
    int nY = 5;
    int nZ = 5;
  
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
  
    void draw() {
       background(255);
       setView();
      for (int x = 0; x < nX; x++) {
          for (int y = 0; y < nY; y++) {
            for (int z = 0; z < nZ; z++) {
                pushMatrix();
                translate(x * (size + margin), y * (size + margin), z * (size + margin));
                float r = map(x, 0, nX, 0, 255);
                float g = map(y, 0, nY, 0, 255);
                float b = map(z, 0, nZ, 0, 255);
                fill(r,g,b);
                box(size);
                popMatrix();
            }
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