  //myFirstFishClass
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

  Fish fish;
  
  void setup() {
    size(480, 360);
    fish = new Fish();
  }
  
  void draw() {
    background(255);
    fish.move();
    fish.display();
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myFirstFishClass####.jpg");
      }
  }