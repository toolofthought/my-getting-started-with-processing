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
      float X0 = innerRadius * cos(start + theta * i);
      float Y0 = innerRadius * sin(start + theta * i);
      float X1 = outerRadius * cos((-start) + theta * i);
      float Y1 = outerRadius * sin((-start) + theta * i);
      float X2 = outerRadius * cos((+start) + theta * (i + 1));
      float Y2 = outerRadius * sin((+start) + theta * (i + 1));
      float X3 = innerRadius * cos(start + theta * (i + 1));
      float Y3 = innerRadius * sin(start + theta * (i + 1));
      
      fill(0, 150, 255, 100);
      ellipse(X0, Y0, 5, 5);
      ellipse(X1, Y1, 5, 5);
      ellipse(X2, Y2, 5, 5);
      ellipse(X3, Y3, 5, 5);
      
      noFill();
      bezier(X0, Y0, X1, Y1, X2, Y2, X3, Y3);
    }
    start += 0.01;
  }

  void mousePressed() {
      saveFrame("myBezier.png");
  }