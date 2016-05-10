//myTetrisSpin
  float theta = 0.0;
  int step = 20;

  void setup() {
    size(480, 360);
  }
  
  void draw() {
    background(255);
    translate(width / 2.0, height / 2.0);
    rotate(theta);
    
    setGrid();
    
    //tetris block
    fill(#a1d99b);
    strokeWeight(3);
    beginShape();
    float step = 60;

    float posX = 0.0;
    float posY = 0.0;
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

    theta += 0.01;
  }

  void setGrid() {
  //grid
    for (int y = 0; y <= height; y += step) {
      if(0 == (y % 100)) {
            strokeWeight(2);
        }
        else {
            strokeWeight(0.5);
        }
        line(0, y, width, y);
    }
    
    for (int x = 0; x <= width; x += step) {
      if(0 == (x % 100)) {
            strokeWeight(2);
        }
        else {
            strokeWeight(0.5);
        }
        line(x, 0, x, height);    
    }
    
    textSize(32);
    fill(0);
    text("(0, 0)", 0, 32);
    text("(480, 360)", width - 170 , height - 16);
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
        saveFrame("myTetrisSpin.jpg");
      }
  }
  
 
 