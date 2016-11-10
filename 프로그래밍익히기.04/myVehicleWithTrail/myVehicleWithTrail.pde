//myVehicleWithTrail

class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float len;
  float maxSpeed;
  float maxForce;
  ArrayList<PVector> trails = new ArrayList<PVector>();

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
    
    trails.add(location.copy());
    if (trails.size() > 200) {
      trails.remove(0);
    }

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
    strokeWeight(0.5);
    smooth();
    stroke(100);
    beginShape();
    for (PVector t : trails) {
      vertex(t.x, t.y);
    }
    endShape();
    
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

Vehicle vehicle;

void setup() {
  size(480, 360);
  background(255);
  vehicle = new Vehicle(random(0, width), random(0, height));
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  vehicle.move(mouse);
  vehicle.display();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myVehicleWithTrail######.png");
  }
}