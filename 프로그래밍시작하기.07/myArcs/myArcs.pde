  //myArcs
  color[] colors = new color[]{#a6cee3, #1f78b4, #b2df8a, #33a02c, #fb9a99, #e31a1c, #fdbf6f, #ff7f00, #cab2d6, #6a3d9a, #ffff99, #b15928};
  int nC = colors.length;
  float radius;
  float r = TWO_PI / float(nC);
  void setup() {
    size(480, 360);
    ellipseMode(RADIUS);
    noStroke();
    radius = min(width, height) * 0.4;
  }

  
  void draw() {
    background(255);
    translate(width / 2.0, height / 2.0);
    for (int i = 0; i < nC; i++) {
      float begin = r * i;
      float end = r * (i + 1);
      fill(colors[i]);
      arc(0, 0, radius, radius, begin, end);
    }
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
        saveFrame("myArcs.jpg");
      }
  }
 