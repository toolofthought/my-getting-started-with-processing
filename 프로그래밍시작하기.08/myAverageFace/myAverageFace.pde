  //myGettingFaceImages
  import java.io.File;
  File folder;
  File[] files;
  
  String fileName;
  PImage img;

  void setup() {
    size(600, 800);
    folder = new File(dataPath(""));
    files = folder.listFiles();
    tint(255, 3);
    frameRate(5);
    background(255);
  }
  
  void draw() {
    fileName = files[frameCount % files.length].getName();
    img = loadImage(fileName);
    image(img, 0, 0, 600, 800);
    if (frameCount > files.length) {
      noLoop();
    }
    println(frameCount);
  }
 
  

void keyPressed() {
    if (key == 's' || key == 'S') {
        saveFrame("myAverageFace####.jpg");
    }
}