Circle c;
void setup() {
  size(480, 360);
  c = new Circle(width / 2, height / 2);
}


void draw() {
  background(255);
  c.update(0.1);
  c.display();
}
  