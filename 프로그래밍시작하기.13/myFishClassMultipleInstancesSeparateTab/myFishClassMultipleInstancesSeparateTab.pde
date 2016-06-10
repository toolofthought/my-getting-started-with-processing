//myFishClassMultipleInstances

  
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