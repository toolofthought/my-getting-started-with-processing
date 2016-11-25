//myCircleHorizontalVerticalMovement
  
  float theta = 0.0;
  float x;
  float y;
  
  void setup() {
    size(480, 360);
    smooth();
    background(255);
  }
  
  void draw() {
    background(255);

    //guideline
    noFill();
    ellipse(width / 2, height / 2, 200, 200);
    line(width / 2 - 100, height / 2, width / 2 + 100, height / 2);
    line(width / 2, height / 2 - 100, width / 2 , height / 2 + 100);

    //circular movement
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(theta);
    fill(100);
    ellipse(100, 0, 10, 10);
    x = screenX(100, 0);
    y = screenY(100, 0);
    popMatrix();
    theta += 0.05;

    //vertical movement
    fill(255, 0, 0);
    ellipse(width / 2, y, 10, 10);

    //horizontal movement
    fill(0, 255, 0);
    ellipse(x, height / 2, 10, 10);

  }

  void keyPressed()
  {
    if (key == 's' || key == 'S') {
      saveFrame("myHorizontalVerticalMovement####.png");
    }
  }