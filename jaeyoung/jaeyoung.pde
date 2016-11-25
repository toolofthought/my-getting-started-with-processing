
Ball ball;

void setup() {
  size(440,360);
  background(255);
  smooth();
  ball = new Ball();
}

void draw() {
  
  ball.move();
  ball.display();
  
 
}

class Ball {
  float x;
  float y;
  float dx;
  float dy;

  
  Ball(){
    x=width/2;
    y=height/2;
    dx=1.0;
    dy=1.0;
    
    }
    
  


 void move(){
   x=x+dx;
   y=y+dy;
   
   //when touches left boundary
   if (x < 0) {
     dx = dx*-2;
     background(255,0,0);
   }
   //when touches right boundary
   if (x >= width) {
     dx=dx*-1;
     background(0,255,0);
     
   }
   if(y < 0){
     dy = dy*-2;
     background(0,0,255);
    
   }
     
   if(y >= height){
     dy = dy*-1;
   background(100,123,130);
   }
     
 
  
 }
 
 void display(){
   ellipse(x,y,50,50); 
   
 }
}