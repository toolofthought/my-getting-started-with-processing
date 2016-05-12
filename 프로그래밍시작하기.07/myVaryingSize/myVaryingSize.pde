//myVaryingSize

float step;
float offset = 0.0;

void setup() {
  size(480, 360);
}

void draw() {
  background(255);
  step = map(noise(offset), 0, 1, 10, 110);
  beginShape();
  
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

  offset += 0.01;
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myVaryingSize####.jpg");
  }
}
  
 
 