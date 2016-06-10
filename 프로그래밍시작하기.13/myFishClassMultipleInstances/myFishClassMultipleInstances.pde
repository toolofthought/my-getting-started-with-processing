//myFishClassMultipleInstances
  class Fish {
    float posX = random(0, width);
    float posY = random(0, height);
  
    float xoff = random(1000);
    float yoff = random(1000);
    
    float step = 0.01;
    float radius = 30;
  
    Fish() {
    }
  
    void move() {
      posX = map(noise(xoff), 0, 1, 0, width);
      posY = map(noise(yoff), 0, 1, 0, height);
      xoff = xoff + step;
      yoff = yoff + step;
    }
  
    void display() {
      strokeWeight(5);
      ellipseMode(RADIUS);
      ellipse(posX, posY, radius, radius);
    }
  }
  
  Fish fish1;
  Fish fish2;
  Fish fish3;
  
  void setup() {
    size(480, 360);
    fish1 = new Fish();
    fish2 = new Fish();
    fish3 = new Fish();
  }
  
  void draw() {
    background(255);
  
    fish1.move();
    fish1.display();
  
    fish2.move();
    fish2.display();
  
    fish3.move();
    fish3.display();
  
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myFishClassMultipleInstances####.jpg");
      }
  }