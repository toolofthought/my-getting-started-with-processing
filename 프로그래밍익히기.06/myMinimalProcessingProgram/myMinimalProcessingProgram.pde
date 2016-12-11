//myMinimalProcessingProgram

Ball ball;

void setup() {
  size(800, 600);
  smooth();
  ball = new Ball();
}

void draw() {
  ball.move();
  ball.display();
}

class  Ball {

  void move() {
  }

  void display() {
  }
}