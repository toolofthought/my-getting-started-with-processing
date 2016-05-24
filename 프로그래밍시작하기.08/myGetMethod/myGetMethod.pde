//myGetMethod
PImage img;
PImage cropped;

void setup() {
  size(1000, 848);
  imageMode(CENTER);
  img = loadImage("http://nktrend.diskn.com/00_gf/gf_002.jpg");

  cropped = img.get(0, 0, width, height / 2);
  frameRate(1);
}

void draw() {
  background(255);
  translate(width / 2.0, height / 2.0);
  if (0 == frameCount % 2) {
    image(img, 0, 0);
  }
  else {
    image(cropped, 0, 0);
  }

}
  void keyPressed() {
    if (key == 's' || key == 'S') {
      saveFrame("myHelloImage####.jpg");
    }
  }
   