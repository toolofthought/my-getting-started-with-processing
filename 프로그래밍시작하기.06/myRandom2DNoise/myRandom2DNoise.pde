//myRandom2DNoise
  size(480, 360);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      color c = color(random(100, 255), random(100, 255), random(100, 255));
      pixels[x + y * width] = c;
    }
  }
  updatePixels();
  
  saveFrame("myRandom2DNoise.jpg");