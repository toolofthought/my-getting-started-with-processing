  //myArrayList
  class Point {
    float x;
    float y;
    
    Point() {
      this.x = mouseX;
      this.y = mouseY;
    }
    
    void display() {
      strokeWeight(5);
      ellipseMode(RADIUS);
      ellipse(this.x, this.y, 30, 30);
    }
  }
  
  ArrayList<Point> points;
  void setup() {
    size(480, 360);
    points = new ArrayList<Point>();
  }
    
  void draw() {
    background(255);
    for (int i = points.size() - 1 ; i > 0; i--) {
      Point p = points.get(i);
      p.display();
    }
  }
  
  void mousePressed() {
    if (mouseButton == LEFT) {
      points.add(new Point());
    }
    else if (mouseButton == RIGHT && (!points.isEmpty())) {
      points.remove(points.size() - 1);
    }
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myArrayList####.jpg");
      }
  }
  
 