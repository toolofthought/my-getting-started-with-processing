  //myAmplitudeLines

  
  
  PShape lines;
  PShape line;
  float amplitude;
  int nY = 10;
  int nX = 50;

  void setup() {
    size(800, 600);
    background(255);
    smooth();

    lines = createShape(GROUP);
    for (int y = 5; y < height; y += height / nY) {
      amplitude = random(5, 10);

      line = createShape(PShape.PATH);
      line.beginShape();
      for (int x = 5; x < width; x += width / nX) {
        line.vertex(x, y + sin(radians(x)) * sin(radians(x)) * map(y, 0, height, 0, 30));
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
      saveFrame("myAmplitudeLines####.png");
    }
  }