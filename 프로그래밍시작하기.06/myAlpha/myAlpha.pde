//myAlpha
  void setup() {
    size(480, 360);
    background(255);
    noStroke();
    frameRate(10);
  }
  
  void draw() {
    float sigma = width / 5.0;
    float posX = width / 2.0 + sigma * randomGaussian();
    float posY = height / 2.0;
    fill(0, 30);
    ellipse(posX, posY, 60, 60);
  }

  void mousePressed() {
      saveFrame("myAlpha.jpg");
  }