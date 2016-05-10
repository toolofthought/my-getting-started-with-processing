//myTetrisRotationMatrix
  float theta = 0.0;

  void setup() {
    size(480, 360);
  }

  void draw() {
    background(255);
    float c = cos(theta);
    float s = sin(theta);

    beginShape();
    vertex(c * 240 - s * 180, s * 240 + c * 180);
    vertex(c * 240 - s * 120, s * 240 + c * 120);
    vertex(c * 300 - s * 120, s * 300 + c * 120);
    vertex(c * 300 - s * 240, s * 300 + c * 240);
    vertex(c * 180 - s * 240, s * 180 + c * 240);
    vertex(c * 180 - s * 180, s * 180 + c * 180);
    endShape(CLOSE);

    theta += 0.01;
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
        saveFrame("myTetrisRotationMatrix.jpg");
      }
  }
  
 
 