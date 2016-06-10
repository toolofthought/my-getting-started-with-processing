  float x1off = random(1000);
  float y1off = random(1000);
  float step1 = 0.01;
  float radius1 = 30;
  
  float x2off = random(1000);
  float y2off = random(1000);
  float step2 = 0.005;
  float radius2 = 50;
  
  void setup() {
    size(480, 360);
    smooth();
    ellipseMode(RADIUS);
  }
  
  void draw() {
    float posX1 = map(noise(x1off), 0, 1, 0, width);
    float posY1 = map(noise(y1off), 0, 1, 0, height);
  
    float posX2 = map(noise(x2off), 0, 1, 0, width);
    float posY2 = map(noise(y2off), 0, 1, 0, height);
  
    background(255);
    //fish1
    strokeWeight(5);
    ellipse(posX1, posY1, radius1, radius1);
  
    //fish2
    strokeWeight(10);
    ellipse(posX2, posY2, radius2, radius2);
    
    x1off = x1off + step1;
    y1off = y1off + step1;
  
    x2off = x2off + step2;
    y2off = y2off + step2;
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myTwoFishes####.jpg");
      }
  }