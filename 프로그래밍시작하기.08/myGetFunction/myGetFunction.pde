//myGetMethod
PImage img;

void setup() {
  size(480, 360);
  img = loadImage("http://nktrend.diskn.com/00_gf/gf_002.jpg");
}

void draw() {
  image(img, 0, 0, width, height);
}
  void keyPressed() {
    if (key == 's' || key == 'S') {
      saveFrame("myHelloImage####.jpg");
    }
  }
   