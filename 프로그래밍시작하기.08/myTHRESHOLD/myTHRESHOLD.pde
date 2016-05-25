 //myTHRESHOLD
PImage img;
PImage filtered;
void setup() {
  size(750, 534);
  img = loadImage("cutest-cat-picture-ever.jpg");
}

void draw() {
  image(img, 0, 0,350, 534);
  img.filter(THRESHOLD, 0.4);
  image(img, 350, 0, 350, 534);
}

void keyReleased()
{
  if(key=='s'||key=='S')
  {
    saveFrame("myCropImageDisplayRandom####.jpg");
  }
}