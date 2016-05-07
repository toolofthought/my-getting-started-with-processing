//myNoise
  size(480, 360);
  float xoff = 0.0;
  float yoff = 0.0;
  float step = 0.01;
  loadPixels();

  for (int y = 0; y < height; y++) {
    xoff = 0.0;
    for (int x = 0; x < width; x++) {
      color c = color(map(noise(xoff, yoff), 0, 1, 0, 255));
      pixels[x + y * width] = c;
      xoff = xoff + step;
    }
    yoff = yoff + step;
  }
  updatePixels();
  
  saveFrame("myNoise.jpg");
   