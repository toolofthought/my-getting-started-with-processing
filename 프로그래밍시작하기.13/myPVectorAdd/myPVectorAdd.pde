//myPVectorAdd
  PVector origin;
  PVector movement;
  
  void setup() {
    size(480, 360);
    smooth();
    background(255);
    
    origin = new PVector(120, 120);
    movement = new PVector(120, 120);
    
    strokeWeight(5);
    
    noFill();
    ellipse(origin.x, origin.y, 30, 30);
    
    origin.add(movement);
    
    fill(100, 100);
    ellipse(origin.x, origin.y, 30, 30);
  }
  
  void draw() {
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myPVectorAdd####.jpg");
      }
  }