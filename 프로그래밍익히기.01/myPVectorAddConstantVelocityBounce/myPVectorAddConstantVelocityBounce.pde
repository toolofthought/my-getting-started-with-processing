//myPVectorRandomAcceleration
class Point {
    PVector location;
    PVector velocity;
    PVector acceleration;
    float radius = 30;

    Point() {
        location = new PVector(width / 2, height / 2);
        velocity = new PVector(0, -5);
        acceleration = new PVector(0, 0.1);
    }

    void move() {
        velocity.add(acceleration);
        location.add(velocity);

        //오른쪽 벽에 닿이면
        if (location.x > width - radius) {
            velocity.x = - velocity.x;
        }
        //왼쪽 벽에 닿이면
        else if (location.x < 0 + radius) {
            velocity.x = - velocity.x;
        }
        //아래쪽 바닥에 닿이면
        if (location.y > height - radius) {
            location.y = height - radius;
            velocity.y = - 0.8 * velocity.y;
        }
        //위쪽 천장에 닿이면
        else if (location.y < 0 + radius) {
            location.y = radius;
            velocity.y = - 0.8 * velocity.y;
        }
    }

    void display() {
        strokeWeight(5);
        ellipseMode(RADIUS);
        ellipse(location.x, location.y, radius, radius);
        println("acceleration:" + acceleration.x + ", " + acceleration.y);
    }
}

Point point;
void setup() {
    size(480, 360);
    smooth();
    background(255);
    point = new Point();
}

void draw() {
    background(255);
    point.move();
    point.display();
}