  //myBall
  class Ball {
      PVector location;
      PVector velocity;
      PVector acceleration;
      
      float radius = 30;
  
      Ball() {
          location = new PVector(width / 2, height / 2);
          velocity = new PVector(0, 0);
          acceleration = new PVector(0, 0.1);
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
  void setup() {
      size(480, 360);
      smooth();
      background(255);
      ball = new Ball();
  }
  
  void draw() {
      background(255);
      ball.move();
      ball.display();
  }