//myPVecorStatic
  class Point {
    PVector location;
    
    Point() {
      location = new PVector(width / 2, height / 2);
    }
  
    void display() {
      strokeWeight(5);
      ellipse(location.x, location.y, 30, 30);
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
    point.display();
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myPVectorStatic####.jpg");
      }
  }