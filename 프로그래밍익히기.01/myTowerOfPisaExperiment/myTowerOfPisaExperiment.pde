  //myTowerOfPisaExperiment
  class Ball {
      PVector location;
      PVector velocity;
      PVector acceleration;
      
      float mass;
      float massEarth = 30000;
      float distanceToEarth = 10000;
  
      Ball(float _mass) {
          mass = _mass;
          location = new PVector(width / 2, height / 2);
          velocity = new PVector(0, 0);
          acceleration = new PVector(0, 0.1);
      }
  
      void move() {
          velocity.add(acceleration);
          location.add(velocity);
  
          //오른쪽 벽에 닿이면
          if (location.x > width - mass) {
              velocity.x = - velocity.x;
          }
          //왼쪽 벽에 닿이면
          else if (location.x < 0 + mass) {
              velocity.x = - velocity.x;
          }
          //아래쪽 바닥에 닿이면
          if (location.y > height - mass) {
              location.y = height - mass;
              velocity.y = - 0.8 * velocity.y;
          }
          //위쪽 천장에 닿이면
          else if (location.y < 0 + mass) {
              location.y = mass;
              velocity.y = - 0.8 * velocity.y;
          }
      }
  
      void display() {
          strokeWeight(5);
          ellipseMode(RADIUS);
          ellipse(location.x, location.y, mass, mass);
          println("acceleration:" + acceleration.x + ", " + acceleration.y);
      }
  }
  
  Ball ball;
  void setup() {
      size(480, 360);
      smooth();
      background(255);
      ball = new Ball(30);
  }
  
  void draw() {
      background(255);
      ball.move();
      ball.display();
  }