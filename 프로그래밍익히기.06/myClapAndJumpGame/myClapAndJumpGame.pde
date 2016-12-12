    //myClapAndJumpGameRevised
    import processing.sound.*;

    AudioIn input;
    Amplitude analyzer;
    float silince = 0.05;
    boolean isFoul;
    Jumper jumper;
    Block block;
    
    void setup() {
        size(960, 720);
        smooth();

        isFoul = false;

        jumper = new Jumper();
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

        if (jumper.isColliding(block)){
            isFoul = true; 
        }

        if (!isFoul) {
            jumper.setScore();
            if (analyzer.analyze() > silince) {
                jumper.jump();
            }
            jumper.move();
            block.move();
        }
        else {
            textAlign(CENTER, CENTER);
            text("Game Over", width / 2, 100);
            rectMode(CENTER);
            rect(width / 2, 205, 200, 50);
            fill(255);
            text("Reset", width / 2, 200);
        }

        if (mousePressed) {
            if ((mouseX < width / 2 + 100) && (mouseX > width / 2 - 100) && (mouseY < 205 + 50)&& (mouseY > 205 - 50)){
                reset();
            }
        }

        block.display();
        jumper.display();
        displayScore();
    }
    
    class  Jumper {
    
        PVector location;
        PVector velocity;
        PVector acceleration;
        PImage img;
        int scale;
        int score;
    
        Jumper() {
            location = new PVector(width / 4, height / 2);
            velocity = new PVector(0, -2);
            acceleration = new PVector(0, 0.05);
            // 원본 이미지 위치
            // http://www.jumpwarehouse.com/activities/jump-kids/
            img = loadImage("jump.png");
            scale = 300;
            score = 0;
        }
    
        void jump() {
    
            PVector force = new PVector(0, -1);
            velocity.add(force);
        }
    
        void move() {
    
            velocity.add(acceleration);
            location.add(velocity);
    
            //왼쪽 벽에 닿이면
            if (location.x < 0) {
                location.x = width;
                velocity.x *= -1;
            }
            //오른쪽 벽에 닿이면
            if (location.x > width) {
                location.x = width;
                velocity.x *= -1;
            }
            //바닥에 닿이면
            if (location.y > height - scale / 2) {
                location.y = height - scale / 2;
                // velocity.y *= -0.9;
            }
            //천장에 닿이면
            if (location.y < 0) {
                // location.y = diameter / 2;
                // velocity.y *= -0.9;
            }
        }
    
        void display() {
            noFill();
            rectMode(CENTER);
            rect(location.x, location.y, scale / 2, scale);
            imageMode(CENTER);
            image(img, location.x, location.y, scale,  scale);
        }

        boolean isColliding(Block b) {
            //borders of jumper
            float left = location.x - scale / 2 / 2;
            float right = location.x + scale / 2 / 2;
            float top = location.y - scale / 2;
            float bottom = location.y  + scale / 2;

            if ((left > b.left) && (right < b.right) && (top > b.top) && (bottom < b.bottom)){
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

        int left;
        int right;
        int top;
        int bottom;

        Block(int x_, int y_) {
            x = x_;
            y = y_;
            w = 50;
            h = (height - y_) * 2;

            left = x_ - w / 2;
            right = x_ + w / 2;
            top = y_ - h / 2;
            bottom = y_ + h / 2;
        }

        //왼쪽으로 이동합니다
        void move() {
            x -= 5;

            if (x < 0) {
                x = width;
                y = (int)random(0, height);
                h = height - this.y;
            }
        }

        void display() {
            fill(100);
            rectMode(CENTER);
            rect(x, y, w, h);
        }
    }

    
    void keyPressed() {
        if (key == 's' || key == 'S') {
            saveFrame("myClapAndJumpGameRevised####.png");
        }
    
        if (key == 'j' || key == 'J') {
            jumper.jump();
        }
    }

    void displayScore() {
        textSize(48);
        rectMode(CENTER);
        textAlign(CENTER, CENTER);
        fill(0, 102, 153);
        text(jumper.getScore(), width / 2, 50);
    }

    void reset() {
        isFoul = false;

        jumper = new Jumper();
        block = new Block(width, (int)random(100, height-100));
    }