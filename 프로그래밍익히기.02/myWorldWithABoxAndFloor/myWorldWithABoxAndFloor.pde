  //myWorldWithABoxAndFloor

  //Box2DProcessing class
  import shiffman.box2d.*;
  //BodyDef, Body, FixtureDef, Fixture classes
  import org.jbox2d.dynamics.*;
  //Vec2 class
  import org.jbox2d.common.*;
  //PolygonShape class
  import org.jbox2d.collision.shapes.*;

  Box2DProcessing box2d;
  
  BodyDef bd;
  Body body;
  PolygonShape ps;
  FixtureDef fd;
  
  BodyDef bdFloor;
  Body floor;
  PolygonShape psFloor;
  FixtureDef fdFloor;
  
  
  float w;
  float h;
  
  float xFloor;
  float yFloor;
  float wFloor;
  float hFloor;
  
  void setup() {
      size(480, 360);
      background(255);
      box2d = new Box2DProcessing(this);
      box2d.createWorld();
      box2d.setGravity(0, -10);
  
      //box
      //processing의 픽셀단위 좌표를 월드좌표로 convert
      Vec2 center = box2d.coordPixelsToWorld(width / 2, height / 2);
      
      bd = new BodyDef();
      bd.position.set(center);
      bd.type = BodyType.DYNAMIC;
      body = box2d.createBody(bd);
      
      ps = new PolygonShape();
      w = 16;
      h = 16;
      float box2dW = box2d.scalarPixelsToWorld(w / 2);
      float box2dH = box2d.scalarPixelsToWorld(h / 2);
      ps.setAsBox(box2dW, box2dH);
   
   
      fd = new FixtureDef();
      //모양
      fd.shape = ps;
      //밀도
      fd.density = 1;
      //마찰
      fd.friction = 0.3;
      //반발력 혹은 복원력
      fd.restitution = 0.5;

      //Fixture와 Body연결하기
      body.createFixture(fd);
      
      //floor
      wFloor = width;
      hFloor = 10;
      xFloor = 0;
      yFloor = height - hFloor;

      bdFloor = new BodyDef();
      bdFloor.position.set(box2d.coordPixelsToWorld(xFloor, yFloor));
      bdFloor.type = BodyType.STATIC;
      floor = box2d.createBody(bdFloor);
      
      psFloor = new PolygonShape();
      float box2dFloorW = box2d.scalarPixelsToWorld(wFloor / 2);
      float box2dFloorH = box2d.scalarPixelsToWorld(hFloor / 2);
      psFloor.setAsBox(box2dFloorW, box2dFloorH);
      fdFloor = new FixtureDef();
      fdFloor.shape = psFloor;
      fdFloor.density = 1;
      floor.createFixture(fdFloor);
      
            
      
  }
  
  void draw() {
    background(255);
    //world에서 시간이 경과하면
    box2d.step();
    
    Vec2 position = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    pushMatrix();
    translate(position.x, position.y);
    rotate(-a);
    
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
    
    Vec2 floorPosition = box2d.getBodyPixelCoord(floor);
    pushMatrix();
    translate(floorPosition.x, floorPosition.y);
    rect(0, 0, wFloor, hFloor);
    popMatrix();
    //saveFrame("frames/myWorldWithABoxAndFloor########.png");
  }
  
  void keyPressed() {
    if (key == 's' || key == 'S') {
         saveFrame("myWorldWithABoxAndFloor####.png");
    }
  }