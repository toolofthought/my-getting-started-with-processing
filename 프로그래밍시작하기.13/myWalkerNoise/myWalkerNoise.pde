  //myWalkerNoise
  class Walker {
    float posX;
    float posY;
    float stepSize = 1.0;
    float xoff = random(1000);
    float yoff = random(1000);
    
    Walker() {
      posX = random(width);
      posY = random(height);
    }
  
    void walk() {
      posX = posX + map(noise(xoff), 0, 1, -stepSize, stepSize);
        posY = posY + map(noise(yoff), 0, 1, -stepSize, stepSize);
    
      posX = constrain(posX, 0, width);
      posY = constrain(posY, 0, height);
  
      xoff = xoff + 0.01;
      yoff = yoff + 0.01;
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
    
    walker = new Walker();
  }
  
  void draw() {
    walker.walk();
    walker.display();
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myWalkerNoise####.jpg");
      }
  }