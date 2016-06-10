  //myArrayListTrace
  class Point {
    float x;
    float y;
  
    Point() {
      this(width / 2, height / 2);
    }
  
    Point(float x, float y) {
      this.x = x;
      this.y = y;
    }
  
    void display() {
      strokeWeight(10);
      point(this.x, this.y);
    }
  }
  
  Point point;
  void setup() {
    size(480, 360);
    point = new Point();
  }
  
  void draw() {
    background(255);
    point.display();
  }