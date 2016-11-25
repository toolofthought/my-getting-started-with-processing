  //myFrequency
  Wheel slow;
  Wheel normal;
  Wheel fast;

  float theta = 0.0;
  
  void setup() {
    size(960, 360);
    smooth();
    slow = new Wheel(960 / 4, height / 2, 100, 1);
    normal = new Wheel(960 * 2 / 4, height / 2, 100, 1.5);
    fast = new Wheel(960 * 3 / 4, height / 2, 100, 2);

  }
  
  void draw() {
    background(255);

    slow.rotate(theta);
    slow.display();
    normal.rotate(theta);
    normal.display();
    fast.rotate(theta);
    fast.display();

    theta += 0.05;
  }

  class Wheel {
    float r;
    float x;
    float y;
    float theta;
    float frequency;

    Wheel(float x_, float y_, float r_, float frequency_) {
      x = x_;
      y = y_;
      r = r_;
      frequency = frequency_;
    }

    void rotate(float theta_) {
      this.theta = theta_ * frequency;
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
      saveFrame("myFrequency####.png");
    }
  }