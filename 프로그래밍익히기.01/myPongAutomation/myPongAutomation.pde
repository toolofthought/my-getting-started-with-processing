//myPongAutomation
        
    class Paddle {
        
        int x;
        int y;
        int w;
        int h;
        char up;
        char down;
        
        float speed = 3;
                
        Paddle(int x_, int y_, int w_, int h_, char up_, char down_) {
            x = x_;
            y = y_;
            w = w_;
            h = h_;
            up = up_;
            down = down_;
        }
        
        //키보드를 누르면 위/아래로 움직입니다
        void update(char key) {
            if (key == up) {
                y -= 10;
                y = constrain(y, 0, height);
            }
            else if (key == down) {
                y += 10;
                y = constrain(y, 0, height - h);
            }
        }
        
        void track(Ball ball) {
          if (abs(ball.location.x - x) < width / 2) {
            if (abs(ball.location.y - (y + h / 2)) > h / 2) {
              if (ball.location.y > (y + h / 2)) {
                y += speed;
              }
              else {
                y -= speed;
              }
            }
          }
        }
        
        
        void display() {
            rect(x, y, w, h);
            line(x, y + h / 2, x + w, y + h / 2);
        }
    }
        
    class Ball {
        PVector location;
        PVector velocity;
        PVector acceleration;
        
        float radius = 15;
    
        Ball() {
            location = new PVector(width / 2, height / 2);
            velocity = PVector.random2D().mult(5);
            acceleration = new PVector(0, 0);
        }
        
        //공의 속도와 위치를 업데이트 합니다
        void move() {
            velocity.add(acceleration);
            location.add(velocity);
                
                
            //오른쪽 벽에 닿이면
            if (location.x > width - radius) {
                println("Ball reached right border.");
                println("Player one won the game!.");
                location = new PVector(width / 2, height / 2);
                //임의의 방향으로 새 게임을 시작합니다
                velocity = PVector.random2D().mult(5);
            }
            //왼쪽 벽에 닿이면
            else if (location.x < 0 + radius) {
                println("Ball reached right border.");
                println("Player two won the game!.");
                location = new PVector(width / 2, height / 2);
                //임의의 방향으로 새 게임을 시작합니다
                velocity = PVector.random2D().mult(5);
            }
            //아래쪽 바닥에 닿이면
            if (location.y > height - radius) {
                location.y = height - radius;
                velocity.y = - 1 * velocity.y;
            }
            //위쪽 천장에 닿이면
            else if (location.y < 0 + radius) {
                location.y = radius;
                velocity.y = - 1 * velocity.y;
            }
        }
        
        //paddle과 상호작용합니다
        void interactWith(Paddle p) {
            if (isColliding(p)) {
                float factor = abs(location.y - (p.y + p.h / 2));
                float reflect = map(factor,0, p.h / 2, 0, radians(75));
                println("reflect: " + reflect);
                //경계면 처리
                if (velocity.x < 0) {
                  location.x = p.x + p.w + radius;
                }
                else {
                  location.x = p.x - radius;
                }
                
                //방형 역전
                velocity.x *= -1.0;
                
                //반사
                if (velocity.y < 0) {
                  velocity.y = velocity.mag() * sin(-reflect);
                }
                else {
                  velocity.y = velocity.mag() * sin(reflect);
                }
                
                //가속
                velocity.mult(1.03);
            }
        }

        void display() {
            strokeWeight(5);
            ellipseMode(RADIUS);
            ellipse(location.x, location.y, radius, radius);
        }
        
        //공과 패들이 충돌하는지를 알려줍니다
        boolean isColliding(Paddle p) {
            //borders
            float left = p.x - radius;
            float right = p.x + p.w + radius;
            float top = p.y - radius;
            float bottom = p.y  + p.h + radius;
            if ((location.x > left) && (location.x < right) && (location.y > top) && (location.y < bottom)){
                return true;
            }
            else {
                return false;
            }
        }
    }
        
    Ball ball;
    Paddle left;
    Paddle right;
    
    void setup() {
        size(480, 360);
        smooth();
        background(255);
        ball = new Ball();
        left = new Paddle(10, 60, 20, 120, 'q', 'a');
        right = new Paddle(width - 10 - 20, height - 60, 20, 120, 'p', 'l');
    }
    
    void draw() {
        background(255);
        noFill();
        
        left.track(ball);
        right.track(ball);
        
        ball.interactWith(left);
        ball.interactWith(right);
        ball.move();
        
        if (ball.isColliding(left)) {
            fill(100);
            left.display();
            ball.display();
            noFill();
            right.display();
        }
        else if (ball.isColliding(right)) {
            fill(100);
            right.display();
            ball.display();
            noFill();
            left.display();
        }
        else {
            left.display();
            right.display();
            ball.display();
        }
              
    }
    
    void keyPressed() {
        left.update(key);
        right.update(key);
    }