   //myCropImageDisplayRandom  
  PImage img;
  PImage[][] crops;

  boolean mosaicMode = false;

  String URL = "http://c85c7a.medialib.glogster.com/media/b3/b32d597d70ee28fe942e2a8e7b485684456a4b0ffc7c955a4d6cb874ee60d894/mondrian1.jpg";
  
  int tileWidth = 128;
  int tileHeight = 96;
  int nX;
  int nY;
  int posX;
  int posY;
  
  void setup() {
    size(1024, 768);
    img = loadImage(URL);
    nX = width / tileWidth;
    nY = height / tileHeight;
    crops = new PImage[nY][nX];
  }
  
  void draw() {
    image(img, 0, 0);
    posX = constrain(mouseX, 0, width - tileWidth);
    posY = constrain(mouseY, 0, height - tileHeight);
    
    stroke(255);
    strokeWeight(2);
    noFill();
  
    rect(posX, posY, tileWidth, tileHeight);

    if(mosaicMode) {
      for(int y  = 0; y < nY; y++) {
        for(int x = 0; x < nX; x++) {
          image(crops[y][x], x * tileWidth, y * tileHeight);
        }
      }
    }
  }
  
  void mousePressed() {
    for (int y = 0; y < nY; y++) {
      for (int x = 0; x < nX; x++) {
        int posRX = int(posX + 0.5 * tileWidth * random(-1, 1));
        int posRY = int(posY + 0.5 * tileHeight * random(-1, 1));
        crops[y][x] = img.get(posRX, posRY, tileWidth, tileHeight);
      }
    }
    mosaicMode = true;
  }

  void mouseMoved() {
    mosaicMode = false;
  }

void keyReleased()
{
  if(key=='s'||key=='S')
  {
    saveFrame("myCropImageDisplayRandom####.jpg");
  }
}