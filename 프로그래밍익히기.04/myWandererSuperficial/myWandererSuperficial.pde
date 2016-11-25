//myWandererSuperficial

Vehicle wanderer;

void setup() {
  size(800, 600);
  background(255);
  wanderer = new Vehicle();
}

void draw() {
  wanderer.move();
  wanderer.display();  
}

class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Vehicle() {
    location = new PVector(width / 2, height / 2);
    velocity = PVector.random2D();
    acceleration = new PVector(0, 0);
  }

  void move() {
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, 30, 30);
    popMatrix();
  }
}