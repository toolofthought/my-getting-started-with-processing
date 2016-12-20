
import processing.sound.*;

AudioIn input;
Amplitude analyzer;
float volume;
float silince = 0.16;
PImage img;

Ball ball;
Paddle paddle;

void setup() {
  size(2000, 1500);
  smooth();
  background(255);
  img=loadImage("jump.png");
  ball = new Ball();
  paddle = new Paddle(700 ,500);

 
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
    paddle.display();
    paddle.move();


    
 

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
      image(img, location.x/1.3, location.y,300, 300);
      

     
      
      
      
    }
  }
  class Paddle {
    PVector location;
    PVector velocity;
    PVector acceleration;
    int diameter;
    
    Paddle(float x, float y) {
      location = new PVector(x, y);
      velocity = new PVector(0, -2);
      acceleration = new PVector(0, 0.01);
    }
    
     void display(){
       rect(location.x,location.y,100,100);
     }
     void move(){
      location.add(acceleration);
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
        velocity.y *= -1;
      }
      
      if (location.y < diameter / 2) {
        location.y = diameter / 2;
        velocity.y *= -1;
      }
    }
 
     }


  

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myMicVolume####.png");
  }
}