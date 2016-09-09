//myGrid
  int nX = 20;
  int nY = 15;
  
  void setup() {
    size(480, 360, P3D);
    strokeWeight(1 / 40.0);
  }
  
  void draw() {
    background(255);
    translate(50, 50);
    scale(20);
    for (int y = 0; y < nY; y++) {
      beginShape(QUAD_STRIP);
      for (int x = 0; x <= nX; x++) {
        vertex(x, y, 0);
        vertex(x, y + 1, 0);
      }
      endShape();
    }
  }

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myGrid####.jpg");
  }
}