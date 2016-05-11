//myGridCosine

  int nX = 20;
  int nY = 15;
  float rotationX;
  float rotationY;
  float clickRotationX;
  float clickRotationY;
  float targetRotationX;
  float targetRotationY;
  float offsetX;
  float offsetY;
  float clickMouseX;
  float clickMouseY;

  void setup() {
    size(480, 360, P3D);
    strokeWeight(1/40.0);
  }

  void draw() {
    background(255);
    translate(50, 50);
    setView();
    scale(20);
    for (int y = 0; y < nY; y++) {
      beginShape(QUAD_STRIP);
      for (int x = 0; x <= nX; x++) {
        vertex(x, y, cos(y));
        vertex(x, y + 1, cos(y));
      }
      endShape();
    }
  }

  void mousePressed() {
    clickMouseX = mouseX;
    clickMouseY = mouseY;
    clickRotationX = rotationX;
    clickRotationY = rotationY;
  }

  void setView() {
    if (mousePressed) {
      offsetX = mouseX - clickMouseX;
      offsetY = mouseY - clickMouseY;
      targetRotationX = clickRotationX + offsetX / width * TWO_PI;
      targetRotationY = clickRotationY + offsetY / height * TWO_PI;
      rotationX += (targetRotationX - rotationX) * 0.1;
      rotationY += (targetRotationY - rotationY) * 0.1;
    }
    rotateX(-rotationY);
    rotateY(rotationX);
  }

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myGridCosine####.jpg");
  }
}