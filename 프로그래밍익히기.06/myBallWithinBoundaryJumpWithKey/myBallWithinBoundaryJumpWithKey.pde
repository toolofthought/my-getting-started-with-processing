//myBallWithinBoundaryJumpWithKey

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
  int diameter;

  Ball() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, -2);
    acceleration = new PVector(0, 0.05);
    diameter = 30;
  }

  void jump() {

    PVector force = new PVector(0, -4);
    velocity.add(force);
  }

  void move() {

    velocity.add(acceleration);
    location.add(velocity);

    //왼쪽 벽에 닿이면
    if (location.x < diameter / 2) {
      location.x = diameter / 2;
      velocity.x *= -1;
    }
    //오른쪽 벽에 닿이면
    if (location.x > width - diameter / 2) {
      location.x = width - diameter / 2;
      velocity.x *= -1;
    }
    //바닥에 닿이면
    if (location.y > height - diameter / 2) {
      location.y = height - diameter / 2;
      velocity.y *= -0.9;
    }
    //천장에 닿이면
    if (location.y < diameter / 2) {
      location.y = diameter / 2;
      velocity.y *= -0.9;
    }
  }

  void display() {
    ellipse(location.x, location.y, diameter, diameter);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myBallWithinBoundaryJumpWithKey####.png");
  }

  if (key == 'j' || key == 'J') {
    ball.jump();
  }
}