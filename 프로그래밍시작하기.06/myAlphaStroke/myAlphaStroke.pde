//myAlphaStroke
  int[] posXs = new int[]{390,387,377,361,340,315,286,256,224,194,165,140,119,103,93,90,93,103,119,140,165,194,224,256,286,315,340,361,377,387,390};

  int[] posYs = new int[]{180,211,241,268,291,310,323,329,329,323,310,291,268,241,211,180,149,119,92,69,50,37,31,31,37,50,69,92,119,149,180};

  void setup() {
    size(480, 360);
    background(255);
    noLoop();
  }

  void draw() {
    stroke(10, 50);
    strokeWeight(1);
    for (int i = 0; i < posXs.length; i++) {
      for (int j = 0; j < posXs.length; j++) {
        line(posXs[i], posYs[i], posXs[j], posYs[j]);
      }
    }
  }

  void mousePressed() {
      saveFrame("myAlphaStroke.png");
  }