//myVaryingSizeScale
  
  float step = 60.0;
  int grid = 20;
  float zoom;
  float offset = 0.0;
  
  void setup() {
    size(480, 360);
  }
  
  void draw() {
    background(255);
    zoom = map(noise(offset), 0, 1, 0.5, 4.0);
    scale(zoom);

    for (int y = 0; y < height; y += grid) {
      if(0 == (y % 100)) {
            strokeWeight(2);
        }
        else {
            strokeWeight(0.5);
        }
        line(0, y, width, y);
    }
    
    for (int x = 0; x < width; x += grid) {
      if(0 == (x % 100)) {
            strokeWeight(2);
        }
        else {
            strokeWeight(0.5);
        }
        line(x, 0, x, height);    
    }
    fill(#a1d99b);
    beginShape();
    
    float posX = width / 2.0;
    float posY = height / 2.0;
    vertex(posX, posY);
  
    posY -= step;
    vertex(posX, posY);
  
    posX += step;
    vertex(posX, posY);
  
    posY += 2 * step;
    vertex(posX, posY);
  
    posX -= 2 * step;
    vertex(posX, posY);
  
    posY -= step;
    vertex(posX, posY);
    endShape(CLOSE);
  
    offset += 0.01;
  }

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myVaryingSizeScale####.jpg");
  }
}
  
 
 