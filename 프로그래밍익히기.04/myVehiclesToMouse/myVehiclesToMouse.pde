//myVehiclesToMouse

class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float len;
  float maxSpeed;
  float maxForce;

  Vehicle() {
    this(width / 2, height / 2);
  }

  Vehicle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(3.0, 4.0);
    len = 20;
    maxSpeed = 1.0;
    maxForce = 1.0;
  }

  void move(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(5);
    desired.limit(maxSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);

    velocity.add(steer);
    location.add(velocity);
    

    if (location.x > width) {
      location.x = 0;
    }
    if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    }
    if (location.y < 0) {
      location.y = height;
    }
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    beginShape();
    vertex(len, 0);
    vertex(len / -2, len / -2 * sqrt(3));
    vertex(-len / 2, len / 2 * sqrt(3));
    endShape(CLOSE);
    popMatrix();
  }
}

ArrayList<Vehicle> vehicles;

void setup() {
  size(480, 360);
  background(255);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 20; i++) {
    vehicles.add(new Vehicle(random(0, width), random(0, height)));
  }
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  for (int i = 0; i < vehicles.size(); i++) {
    vehicles.get(i).move(mouse);
    vehicles.get(i).display();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myVehicles######.png");
  }
}