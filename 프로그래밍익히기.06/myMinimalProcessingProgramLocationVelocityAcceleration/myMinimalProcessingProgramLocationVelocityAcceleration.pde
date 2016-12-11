//myMinimalProcessingProgramLocationVelocityAcceleration

Ball ball;

void setup() {
  size(800, 600);
  smooth();
  ball = new Ball();
}

void draw() {
  background(255);
  ball.move();
  ball.display();
}

class  Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;

  Ball() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, -2);
    acceleration = new PVector(0, 0.05);
  }

  void move() {
  }

  void display() {
    ellipse(location.x, location.y, 30, 30);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myMinimalProcessingProgramLocationVelocityAcceleration####.png");
  }
}