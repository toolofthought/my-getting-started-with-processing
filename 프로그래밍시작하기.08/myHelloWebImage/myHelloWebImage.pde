//myHelloWebImage
String URL = "http://cfile3.uf.tistory.com/image/222B06505657E2700AD5B9";

PImage img;

void setup() {
  size(740, 1108);
  img = loadImage(URL, "jpg");
}

void draw() {
  image(img, 0, 0);
}

void keyPressed() {
    if (key == 's' || key == 'S') {
      saveFrame("myHelloWebImage####.jpg");
    }
  }
   