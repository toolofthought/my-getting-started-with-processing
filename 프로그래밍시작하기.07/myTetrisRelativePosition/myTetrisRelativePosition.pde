//myTetrisRelativePosition
  void setup() {
    size(480, 360);
  }
  
  void draw() {
    background(255);

    beginShape();

    float step = 60;

    float posX = mouseX;
    float posY = mouseY;
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
  }
  
  void keyPressed(){
      if (key == 's' || key=='S') {
          saveFrame("myTetrisRelativePosition.jpg");
      }
  }