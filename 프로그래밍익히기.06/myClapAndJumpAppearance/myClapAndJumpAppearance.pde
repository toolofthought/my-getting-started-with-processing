  //myClapAndJumpAppearance
  import processing.sound.*;

  AudioIn input;
  Amplitude analyzer;
  float silince = 0.01;

  Ball ball;
  
  void setup() {
    size(800, 600);
    smooth();
    ball = new Ball();

    // 마이크 입력을 받을 객체를 만듭니다.
    // input이 마이크 입력을 받은 객체이고, 마이크의 첫번째 채널(0번째 채널)을 입력으로 받습니다.
    input = new AudioIn(this, 0);

    // 마이크 입력을 시작합니다.
    input.start();

    // 소리 크기를 분석할 객체를 만듭니다.
    analyzer = new Amplitude(this);

    // 소리 크리를 분석할 객체와 마이크의 소리입력을 연결합니다.
    analyzer.input(input);
  }
  
  void draw() {
    background(255);

    if (analyzer.analyze() > silince) {
      ball.jump();
    }
    ball.move();
    ball.display();
  }
  
  class  Ball {
  
    PVector location;
    PVector velocity;
    PVector acceleration;
    PImage img;
    int diameter;
  
    Ball() {
      location = new PVector(width / 2, height / 2);
      velocity = new PVector(0, -2);
      acceleration = new PVector(0, 0.05);
      // 원본 이미지 위치
      // http://www.jumpwarehouse.com/activities/jump-kids/
      img = loadImage("jump.png");
      diameter = 150;
    }
  
    void jump() {
  
      PVector force = new PVector(0, -3);
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
      //ellipse(location.x, location.y, diameter, diameter);
      imageMode(CENTER);
      image(img, location.x, location.y, diameter * 2, diameter * 2);
    }
  }
  
  void keyPressed() {
    if (key == 's' || key == 'S') {
      saveFrame("myClapAndJumpAppearance####.png");
    }
  
    if (key == 'j' || key == 'J') {
      ball.jump();
    }
  }