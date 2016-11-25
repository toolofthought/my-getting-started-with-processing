  //myAmplitudeFrequencyLines

  PShape lines;
  PShape line;
  float frequency;
  float amplitude;
  int nY = 8;
  int nX = 600;

  void setup() {
    size(800, 600);
    background(255);
    smooth();

    lines = createShape(GROUP);
    for (int y = 5; y < height; y += height / nY) {

      line = createShape(PShape.PATH);
      line.beginShape();
      for (int x = 5; x < width; x += width / nX) {
        frequency = map(x, 0, width, 1, 10);
        amplitude = map(y, 0, height, 1, 30);
        
        line.vertex(x, y + sin(radians(x) * frequency) * amplitude);
      }
      line.endShape();

      lines.addChild(line); 
    }

    shape(lines, 0, 0);
  }
  
  void draw() {
  }

  void keyPressed()
  {
    if (key == 's' || key == 'S') {
      saveFrame("myAmplitudeFrequencyLines####.png");
    }
  }