
import processing.sound.*;

AudioIn input;
Amplitude analyzer;
float volume;
float silince = 0.1;

Ball ball;

void setup() {
  size(800, 600);
  smooth();
  background(255);
  img=loadImage
  ball = new Ball();

 
  input = new AudioIn(this, 0);

  
  input.start();

 
  analyzer = new Amplitude(this);

  
  analyzer.input(input);
}

void draw() {
   background(255);

    if (analyzer.analyze() > silince) {
      ball.jump();
    }
    ball.move();
    ball.display();
  volume = 100 + analyzer.analyze() * 2000;
  ellipse(width / 2, height / 2, volume, volume);
  println("original: " + analyzer.analyze() + ", amplified: " + volume);

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
  
      PVector force = new PVector(0, -3);
      velocity.add(force);
    }
  
    void move() {
  
      velocity.add(acceleration);
      location.add(velocity);
  
      
      if (location.x < diameter / 2) {
        location.x = diameter / 2;
        velocity.x *= -1;
      }
      
      if (location.x > width - diameter / 2) {
        location.x = width - diameter / 2;
        velocity.x *= -1;
      }
      
      if (location.y > height - diameter / 2) {
        location.y = height - diameter / 2;
        velocity.y *= -0.9;
      }
      
      if (location.y < diameter / 2) {
        location.y = diameter / 2;
        velocity.y *= -0.9;
      }
    }
  
    void display() {
      image(img, 0, 0);
      ellipse(location.x, location.y, diameter, diameter);
    }
  }

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myMicVolume####.png");
  }
}