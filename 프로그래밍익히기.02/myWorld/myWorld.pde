Ball ball;
Ball ball2;

void setup() {
  size(2200,1800);
  background(255);
  ball = new Ball();
  ball2 = new Ball();

}

void  draw() {
    background(10);
    ball.display();
    ball.move();
    ball2.display();
    ball2.move();
}

class Ball {
    float x;
    float y;
    float dx;
    float dy;
    float ax;
    float ay;
  
   Ball() {
     
     dx = 0.01 ;
     dy = 0.01 ;
     ax = 0.005;
     ay = 0.005;
   }
  
   void move() {
     x = x + dx;
     y = y + dy;
     dx = dx + ax;
     dy = dy + ay;
  }
  void display() {
    ellipse (x , y ,80 ,80);
  }
}
     