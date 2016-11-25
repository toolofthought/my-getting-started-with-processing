//myCircleHorizontalMovement
  
  float theta = 0.0;
  float x;
  
  void setup() {
    size(480, 360);
    smooth();
    background(255);
  }
  
  void draw() {
    background(255);
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(theta);
    fill(100);
    ellipse(100, 0, 10, 10);
    x = screenX(100, 0);
    popMatrix();
    theta += 0.05;

    fill(0, 255, 0);
    ellipse(x, height / 2, 10, 10);
  }

  void keyPressed()
  {
    if (key == 's' || key == 'S') {
      saveFrame("myHorizontalMovement####.png");
    }
  }