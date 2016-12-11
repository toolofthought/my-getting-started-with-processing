    //myClapAndJumpGame
    import processing.sound.*;

    AudioIn input;
    Amplitude analyzer;
    float silince = 0.01;
    boolean isFoul;
    Ball ball;
    Block block;
    
    void setup() {
        size(960, 720);
        smooth();

        isFoul = false;

        ball = new Ball();
        block = new Block(400, height - 100);

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

        if (ball.isColliding(block)){
            isFoul = true; 
        }

        if (!isFoul) {
            ball.setScore();
            if (analyzer.analyze() > silince) {
                ball.jump();
            }
            ball.move();
            block.move();
        }
        else {
            textAlign(CENTER, CENTER);
            text("Game Over", width / 2, 100);
        }

        block.display();
        ball.display();
        displayScore();
    }
    
    class  Ball {
    
        PVector location;
        PVector velocity;
        PVector acceleration;
        PImage img;
        int diameter;
        int radius;
        int score;
    
        Ball() {
            location = new PVector(width / 4, height / 2);
            velocity = new PVector(0, -2);
            acceleration = new PVector(0, 0.05);
            // 원본 이미지 위치
            // http://www.jumpwarehouse.com/activities/jump-kids/
            img = loadImage("jump.png");
            diameter = 150;
            radius = diameter / 2;
            score = 0;
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
            if (location.y > height - diameter) {
                location.y = height - diameter;
                // velocity.y *= -0.9;
            }
            //천장에 닿이면
            if (location.y < diameter / 2) {
                // location.y = diameter / 2;
                // velocity.y *= -0.9;
            }
        }
    
        void display() {
            //ellipse(location.x, location.y, diameter, diameter);
            imageMode(CENTER);
            image(img, location.x, location.y, diameter * 2, diameter * 2);
        }

        boolean isColliding(Block b) {
            //borders
            float left = b.x - radius;
            float right = b.x + b.w + radius;
            float top = b.y - radius;
            float bottom = b.y  + b.h + radius;
            if ((location.x > left) && (location.x < right) && (location.y > top) && (location.y < bottom)){
                return true;
            }
            else {
                return false;
            }
        }

        int getScore() {
            return score;
        }

        void setScore() {
            score++;
        }
    }

    class Block {

        int x;
        int y;
        int w;
        int h;

        Block(int x_, int y_) {
            x = x_;
            y = y_;
            w = 50;
            h = height - y_;
        }

        //왼쪽으로 이동합니다
        void move() {
            x--;
            if (x < 0) {
                x = width;
                y = (int)random(0, height);
                h = height - y;
            }
        }

        void display() {
            fill(100);
            rect(x, y, w, h);
        }
    }

    
    void keyPressed() {
        if (key == 's' || key == 'S') {
            saveFrame("myClapAndJumpGame####.png");
        }
    
        if (key == 'j' || key == 'J') {
            ball.jump();
        }
    }

    void displayScore() {
        textSize(48);
        rectMode(CENTER);
        textAlign(CENTER, CENTER);
        fill(0, 102, 153);
        text(ball.getScore(), width / 2, 50);
    }