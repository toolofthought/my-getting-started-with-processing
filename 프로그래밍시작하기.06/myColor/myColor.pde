//myColor
  color[] myColor = new color[]{#ffffe5, #fff7bc, #fee391, #fec44f, #fe9929, #ec7014, #cc4c02, #993404, #662506};

  void setup() {
      size(480, 360);
  }
    
  int n = 30;
  void draw() {
    float tileX = width / n;
    for (int i = 0; i < n; i++) {
      fill(myColor[i % myColor.length]);
      rect(tileX * i, 0, tileX, height);
    }
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
          saveFrame("myColor.jpg");
      }
  }
  