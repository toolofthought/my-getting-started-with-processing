PVector gravity = new PVector(0, 0.5);

class  Bird {

    PVector location;
    PVector velocity;
    PVector acceleration;
    float radius = 16;

    Bird() {
        location = new PVector(100, height / 2);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
    }

    void applyForce(PVector force) {
    	acceleration.add(force);
    }

    void move() {

    	applyForce(gravity);
        location.add(velocity);
        velocity.add(acceleration);
        velocity.limit(4.0);
        acceleration.mult(0);

        //바닥에 닿이면
        if (location.y > height - radius) {
            location.y = height - radius;
            velocity.mult(0);
        }
    }

    void display() {
    	stroke(255);
    	fill(255);
    	ellipse(location.x, location.y, radius * 2, radius * 2);
    }
}