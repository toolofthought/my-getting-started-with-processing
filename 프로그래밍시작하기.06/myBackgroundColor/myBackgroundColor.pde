///myBackgroundColor
  void setup() {
    size(480, 360);
  }

    void draw() {
    //green
      background(0, 255, 0);
    }
  void mousePressed() {
      saveFrame("myBackgroundColor.jpg");
  }