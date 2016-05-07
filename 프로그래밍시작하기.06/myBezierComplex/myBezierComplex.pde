///myBezier
  void setup() {
    size(480, 360);
    //transparent black background
    background(0, 30);
    noFill();
    //frameRate(5);
  }

  float start = 0.0;
  void draw() {
    background(0, 30);
    //pale purple line
    stroke(0, 150, 255, 100);
    strokeWeight(5);
   
    float innerRadius = min(width, height) * 0.35;
    float outerRadius = min(width, height) * 0.4;
    
    int n = 10;
    float theta = TWO_PI / n;
    
    translate(width / 2, height / 2);
    for (int i = 0; i < n; i++) {
      float X0 = innerRadius * sin(start + theta * i);
      float Y0 = innerRadius * cos(start + theta * i);
      float X3 = innerRadius * sin(start + theta * (i + 1));
      float Y3 = innerRadius * cos(start + theta * (i + 1));
      
      fill(0, 150, 255, 100);
      ellipse(X0, Y0, 5, 5);
      ellipse(X0 - X3, Y0 - Y3, 5, 5);
      ellipse(X3 - X0, Y3 - Y0, 5, 5);
      ellipse(X3, Y3, 5, 5);
      
      noFill();
      bezier(X0, Y0, X0 - X3, Y0 - Y3, X3 - X0, Y3 - Y0, X3, Y3);
    }
    start += 0.01;
  }

  void mousePressed() {
      saveFrame("myBezier.png");
  }