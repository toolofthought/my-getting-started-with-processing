void setup() {
    size(480, 360);
  }

  void draw() {
    //dark gray
    background(50);
  }
  
  void mousePressed() {
      saveFrame("myBackground.jpg");
  }