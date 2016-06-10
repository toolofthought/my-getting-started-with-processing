  //myWalker
  class Walker {
    float posX;
    float posY;
    float stepSize = 5.0;
    
    Walker() {
      posX = random(width);
      posY = random(height);
    }
  
    void walk() {
      float r = random(1);
      if (r < 0.25) {
        posX = posX - stepSize;
      }
      else if (r < 0.5) {
        posX = posX + stepSize;
      }
      else if (r < 0.75) {
        posY = posY - stepSize;
      }
      else {
        posY = posY + stepSize;
      }
        
      posX = constrain(posX, 0, width);
      posY = constrain(posY, 0, height);
    }
  
    void display() {
      strokeWeight(5);
      stroke(0, 50);
      point(posX, posY);
    }
  }
  
  Walker walker;
  void setup() {
    size(480, 360);
    smooth();
    background(255);
    frameRate(240);
  
    walker = new Walker();
  }
  
  void draw() {
    walker.walk();
    walker.display();
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myWalker####.jpg");
      }
  }