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
      
      ball.display();
  }