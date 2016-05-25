   //myCropImage
  
  PImage img;
  PImage cropped;
  String URL = "http://c85c7a.medialib.glogster.com/media/b3/b32d597d70ee28fe942e2a8e7b485684456a4b0ffc7c955a4d6cb874ee60d894/mondrian1.jpg";
  
  int tileWidth = 128;
  int tileHeight = 96;
  
  void setup() {
    size(1024, 768);
    img = loadImage(URL);
  }
  
  void draw() {
    image(img, 0, 0);
    int posX = constrain(mouseX, 0, width - tileWidth);
    int posY = constrain(mouseY, 0, height - tileHeight);
    
    stroke(255);
    strokeWeight(2);
    noFill();
  
    rect(posX, posY, tileWidth, tileHeight);

    if(mousePressed) {
      cropped = img.get(posX, posY, tileWidth, tileHeight);
      image(cropped, 0, 0, width, height);
    }
  }



void keyReleased()
{
  if(key=='s'||key=='S')
  {
    saveFrame("myCropImage####.jpg");
  }
}