//myPongWithPaddleMovable
  
  class Paddle {
  
  int x;
  int y;
  int w;
  int h;
  char up;
  char down;
    
  Paddle(int x_, int y_, int w_, int h_, char up_, char down_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    up = up_;
    down = down_;
  }
  
  void update(char key) {
    if (key == up) {
    y -= 10;
    y = constrain(y, 0, height);
    }
    else if (key == down) {
    y += 10;
    y = constrain(y, 0, height - h);
    }
  }
  
  void display() {
    rect(x, y, w, h);
  }
  }
  
  class Ball {
    PVector location;
    PVector velocity;
    PVector acceleration;
    
    float radius = 15;
  
    Ball() {
      location = new PVector(width / 2, height / 2);
      velocity = new PVector(5, 0);
      acceleration = new PVector(0, 0);
    }
  
    void move() {
      velocity.add(acceleration);
      location.add(velocity);
  
      //오른쪽 벽에 닿이면
      if (location.x > width - radius) {
        location.x = width - radius;
        velocity.x = - velocity.x;
      }
      //왼쪽 벽에 닿이면
      else if (location.x < 0 + radius) {
        location.x = radius;
        velocity.x = - velocity.x;
      }
      //아래쪽 바닥에 닿이면
      if (location.y > height - radius) {
        location.y = height - radius;
        velocity.y = - 0.9 * velocity.y;
      }
      //위쪽 천장에 닿이면
      else if (location.y < 0 + radius) {
        location.y = radius;
        velocity.y = - 0.9 * velocity.y;
      }
    }
  
    void display() {
      strokeWeight(5);
      ellipseMode(RADIUS);
      ellipse(location.x, location.y, radius, radius);
      println("acceleration:" + acceleration.x + ", " + acceleration.y);
    }
    
    
  }
  
  Ball ball;
  Paddle left;
  Paddle right;
  
  void setup() {
    size(480, 360);
    smooth();
    background(255);
    ball = new Ball();
    left = new Paddle(10, 120, 20, 120, 'q', 'a');
    right = new Paddle(width - 10 - 20, 120, 20, 120, 'p', 'l');
  }
  
  void draw() {
    background(255);
    ball.move();
    ball.display();
    left.display();
    right.display();
  }
  
  void keyPressed() {
    left.update(key);
    right.update(key);
  }