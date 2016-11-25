  //myAmplitude

  
  
  Wheel small;
  Wheel large;

  float theta = 0.0;
  
  void setup() {
    size(960, 360);
    smooth();
    small = new Wheel(960 / 4, height / 2, 50);
    large = new Wheel(960 * 3 / 4, height / 2, 100);

  }
  
  void draw() {
    background(255);
    small.rotate(theta);
    small.display();

    large.rotate(theta);
    large.display();

    theta += 0.05;
  }

  class Wheel {
    float r;
    float x;
    float y;
    float theta;

    Wheel(float x_, float y_, float r_) {
      x = x_;
      y = y_;
      r = r_;
    }

    void rotate(float theta_) {
      this.theta = theta_;
    }

    void display() {
      pushMatrix();
        translate(x, y);
        //guideline
        noFill();
        ellipseMode(RADIUS);
        ellipse(0, 0, r, r);
        line(-r, 0, r, 0);
        line(0, -r, 0, r);

        //circular movement
        fill(100);
        ellipse(cos(this.theta) * r, sin(this.theta) * r, 10, 10);

        //vertical movement
        fill(255, 0, 0);
        ellipse(0, sin(this.theta) * r, 10, 10);
        //horizontal movement
        fill(0, 255, 0);
        ellipse(cos(this.theta) * r, 0, 10, 10);

      popMatrix();

    }
  }

  void keyPressed()
  {
    if (key == 's' || key == 'S') {
      saveFrame("myAmplitude####.png");
    }
  }