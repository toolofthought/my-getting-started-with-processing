//myPVectorAddConstantVelocity
  class Point {
    PVector location;
    PVector velocity;
    float radius = 30;
    
    Point() {
      location = new PVector(width / 2, height / 2);
      velocity = new PVector(random(5), random(5));
    }
  
    void move() {
      location.add(velocity);
  
      //오른쪽 벽을 넘어가면
      if (location.x > width + radius) {
        location.x = 0;
      }
      //왼쪽 벽을 넘어가면
      else if (location.x < 0 - radius) {
        location.x = width;
      }
      //아래쪽 바닥을 넘어가면
      if (location.y > height + radius) {
        location.y = 0;
      }
      //위쪽 천장을 넘어가면
      else if (location.y < 0 - radius) {
        location.y = height;
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
          saveFrame("myPVectorAddConstantVelocity####.jpg");
      }
  }