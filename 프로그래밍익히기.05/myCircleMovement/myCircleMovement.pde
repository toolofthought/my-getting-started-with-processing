//myCircleMovement
  
  float theta = 0.0;
  
  void setup() {
    size(480, 360);
    smooth();
    background(255);
  }
  
  void draw() {
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(theta);
    ellipse(100, 0, 10, 10);
    popMatrix();
    theta += 0.05;
  }