//myMap

PShape map;
float currentX;
float currentY;
float offsetX;
float offsetY;
float zoom = 1.0;

void setup() {
  size(509, 717);
  map = loadShape("Administrative_divisions_map_of_South_Korea.svg");
  shapeMode(CENTER);
  currentX = width / 2.0;
  currentY = height / 2.0;
}

void draw() {
  background(255);
  if (mousePressed == true) {
     currentX -= offsetX;
     currentY -= offsetY;
  }
  translate(currentX, currentY);
  shape(map, 0, 0);
}

void mousePressed() {
  offsetX = mouseX - currentX;
  offsetY = mouseY - currentY;
}

void keyPressed() {
  if (keyCode == UP) {
    zoom += 0.05;
  }
  if (keyCode == DOWN) {
    zoom -= 0.05;
  }
}