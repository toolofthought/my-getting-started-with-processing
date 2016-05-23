  //myHelloImage
  PImage img;
  void setup() {
    size(480, 360);
    img = loadImage("myHelloImage.jpg");
  }

  void draw() {
    image(img, 0, 0, 240, 180);
    image(img, 240, 0, 240, 180);
    image(img, 0, 180, 480, 180);
  }
  
  void keyPressed() {
    if (key == 's' || key == 'S') {
      saveFrame("myHelloImage####.jpg");
    }
  }
   