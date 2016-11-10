//myForceField

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
class ForceField {
  PVector [][] field;
  int nX;
  int nY;
  int resolution;

  ForceField(int r) {
    resolution = r;
    nX = width / r;
    nY = height / r;
    field = new PVector[nY][nX];
    for (int y = 0; y < nY; y++) {
      for (int x = 0; x < nX; x++) {
        field[y][x] = PVector.random2D();
      }
    }
  }

  void displayForce(PVector p, float scale) {
    pushMatrix();
    translate(p.x, p.y);
    rotate(p.heading());
    line(0, 0, scale, 0);
    popMatrix();
  }

  void display() {
    for (int y = 0; y < nY; y++) {
      for (int x = 0; x < nX; x++) {
        displayForce(field[y][x], width / resolution);
      }
    }
  }

}
Vehicle vehicle;
ForceField forcefield;

void setup() {
  size(480, 360);
  background(255);
  vehicle = new Vehicle(random(0, width), random(0, height));
  forcefield = new ForceField(10);
}

void draw() {
  background(255);
  forcefield.display();
  PVector mouse = new PVector(mouseX, mouseY);
  vehicle.move(mouse);
  vehicle.display();
  
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myVehicleWithTrail######.png");
  }
}