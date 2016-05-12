//myScale
  void setup() {
    size(480, 360);
  }
  
  int step = 20;
  void draw() {
    background(255);
    scale(2.0);
    for (int y = 0; y < height; y += step) {
      if(0 == (y % 100)) {
            strokeWeight(2);
        }
        else {
            strokeWeight(0.5);
        }
        line(0, y, width, y);
    }
    
    for (int x = 0; x < width; x += step) {
      if(0 == (x % 100)) {
            strokeWeight(2);
        }
        else {
            strokeWeight(0.5);
        }
        line(x, 0, x, height);    
    }
  }

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myScale####.jpg");
  }
}
  
 
 