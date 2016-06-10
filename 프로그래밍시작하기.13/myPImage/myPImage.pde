  //myPImage
  PImage img;
  void setup() {
    size(100, 200);
    img = loadImage("https://www.processing.org/reference/images/PImage.png");
    println("image width: " + img.width);
    println("image height: " + img.height);

    image(img,0, 0, width, 100);
    image(img.get(0, 50, width, 50), 0, 100, width, 50);
    img.filter(BLUR, 6);
    image(img.get(0, 50, width, 50), 0, 150, width, 50);
    
    saveFrame("myPImage.jpg");
  }
 