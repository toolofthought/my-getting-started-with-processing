//myPVectorAddConstantVelocityBounce
  class Point {
    PVector location;
    PVector velocity;
    float radius = 30;
    
    Point() {
      location = new PVector(width / 2, height / 2);
      velocity = new PVector(random(10), random(10));
    }
  
    void move() {
      location.add(velocity);
  
      //오른쪽 벽에 닿이면
      if (location.x > width - radius) {
        velocity.x = - velocity.x;
      }
      //왼쪽 벽에 닿이면
      else if (location.x < 0 + radius) {
        velocity.x = - velocity.x;
      }
      //아래쪽 바닥에 닿이면
      if (location.y > height - radius) {
        velocity.y = - velocity.y;
      }
      //위쪽 천장에 닿이면
      else if (location.y < 0 + radius) {
        velocity.y = - velocity.y;
      }
    }
  
    void display() {
      strokeWeight(5);
      ellipseMode(RADIUS);
      ellipse(location.x, location.y, radius, radius);
    }
  }
  
  Point point;
  void setup() {
    size(480, 360);
    smooth();
    background(255);
    point = new Point();
  }
  
  void draw() {
    background(255);
    point.move();
    point.display();
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myPVectorAddConstantVelocityBounce####.jpg");
      }
  }