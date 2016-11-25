//myCircleMovementDecomposition

float theta = 0.0;

void setup() {
  size(480, 360);
  smooth();
  background(255);
}

void draw() {
  translate(width / 2, height / 2);
  ellipse(100 * cos(theta) , 100 * sin(theta), 10, 10);
  theta += 0.05;
}