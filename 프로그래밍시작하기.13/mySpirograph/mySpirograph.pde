  //mySpirograph
  class Spirograph {
  
    float r0; //큰 원의 반지름
    float r1; //작은 원의 반지름
    float r2; //가장 작은 원의 반지름
    float rp; //펜의 반지름
  
    float theta0; //큰 원의 각도
    float theta1; //작은 원의 각도
    float theta2; //가장 작은 원의 각도
    float thetaStep = 0.1; //시간당 단위 각속도
  
    Spirograph() {
      r0 = 75.0;
      r1 = 25.0;
      r2 = 10.0;
      rp = 75;
      //println("(r0: " + r0 + ", " + "r1: " + r1 + ")");
    }
    
    void turn() {
      theta0 += thetaStep;
      theta1 += thetaStep * r0 / r1;
      theta2 += thetaStep * r1 / r2;
    }
  
    void display() {
      pushMatrix();
        rotate(theta0);
        //line(0, 0, r0, 0);
        //ellipse(0, 0, r0, r0);
        pushMatrix();
          translate(r0 + r1, 0);
          rotate(theta1);
          //line(0, 0, r1, 0);
          //ellipse(0, 0, r1, r1);
          pushMatrix();
            translate(r2 - r1, 0);
            rotate(theta2);
            //line(0, 0, r2, 0);
            //ellipse(0, 0, r2, r2);
            //line(0, 0, rp, 0);
            //fill(255, 200);
            //stroke(255,0,0);
            fill(#F08040);
            ellipse(rp, 0, 3, 3);
          popMatrix();
        popMatrix();
      popMatrix();
      println(theta0);
    }
  }
  
  Spirograph s;
  
  void setup() {
    size(600, 450);
    background(255);
    smooth();
    stroke(#F08040);
    strokeWeight(3);
    ellipseMode(RADIUS);
    
    s = new Spirograph();
  }
  
  void draw() {
    //background(255);
    translate(width / 2, height / 2);
    s.turn();
    s.display();
  }