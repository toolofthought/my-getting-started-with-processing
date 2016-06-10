//myFish
  float xoff = random(1000);
  float yoff = random(1000);
  float step = 0.01;
  float radius = 30;
  
  void setup() {
    size(480, 360);
    smooth();
    ellipseMode(RADIUS);
  }
  
  void draw() {
    float posX = map(noise(xoff), 0, 1, 0, width);
    float posY = map(noise(yoff), 0, 1, 0, height);
    
    background(255);
    strokeWeight(5);
    ellipse(posX, posY, radius, radius);
    
    xoff = xoff + 0.01;
    yoff = yoff + 0.01;
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myFish####.jpg");
      }
  }