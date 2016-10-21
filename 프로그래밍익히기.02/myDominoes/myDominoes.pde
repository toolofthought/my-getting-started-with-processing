  //myDominoes

  //Box2DProcessing class
  import shiffman.box2d.*;
  //BodyDef, Body, FixtureDef, Fixture classes
  import org.jbox2d.dynamics.*;
  //Vec2 class
  import org.jbox2d.common.*;
  //PolygonShape class
  import org.jbox2d.collision.shapes.*;
  
  Box2DProcessing box2d;
  ArrayList<Domino> dominoes;
  ArrayList<Ball> balls;
  Floor floor;

  void setup() {
    size(480, 360);
    background(255);
    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0, -9.8);
    dominoes = new ArrayList<Domino>();
    
        
    for (int i = 0; i < 10; i++) {
      dominoes.add(new Domino(40 + 40 * i, height - 16  - 40, 10, 40));
      if (i == 10 - 1) {
        break;
      }
      dominoes.add(new Domino(45 + 40 * i, height - 16  - 40 - 10, 40, 10));  
    }
    balls = new ArrayList<Ball>();
    floor = new Floor(0, height - 16, width, 16);
  }

  void draw() {
    background(255);
    box2d.step();
    
    
    for(Ball b: balls) {
      b.display();
    }
    
    for(Domino d: dominoes) {
      d.display();
    }
    
    floor.display();
  }

  class Domino {
    //Box2D에서 사용할 body
    Body body;
    //픽셀 단위
    float w;
    float h;
  
    //Constructor
    //픽셀단위로 위치를 받아 body를 배치함
    //Box2D를 다룰 때 필요한 복잡한 설정을
    //wrapping하고 있음
    //프로ㅔㅅ싱의 rect(x, y, w, h)을 따릅니다
    Domino(float x_, float y_, float w_, float h_) {
      //객체가 생성될 때 너비와 높이를 정함
      w = w_;
      h = h_;
         
      //body 정의하기
      //BodyDef 정의하기
      BodyDef bd = new BodyDef();
      //Body type은 STATIC
      //고정된 물체입니다
      bd.type = BodyType.DYNAMIC;
      //(x, y)좌표에 body위치 시키기
      bd.position.set(box2d.coordPixelsToWorld(x_ + w / 2, y_ + h / 2));
      //bd정의에 따라 body 인스턴스 생성하기
      body =  box2d.createBody(bd);
        
      //polygon 정의하기
      PolygonShape ps = new PolygonShape();
      
      //Box2D는 중심에서 경계까지의 길이를 너비와 높이로 삼습니다
      //프로세싱의 rectMode(RADIUS)가 Box2D에서는 기본설정입니다
      float box2dW = box2d.scalarPixelsToWorld(w/2);
      float box2dH = box2d.scalarPixelsToWorld(h/2);
      ps.setAsBox(box2dW, box2dH);
  
      //fixture정의, 그리고 fixture와 body 연결하기
      FixtureDef fd = new FixtureDef();
      //모양
      fd.shape = ps;
      //밀도
      fd.density = 1;
      //마찰
      fd.friction = 0.3;
      //반발력
      fd.restitution = 0.9;
      //Fixture와 Body연결하기
      body.createFixture(fd);
    }
  
    void display() {
      //Vec2클래스에 body의 현재위치 저장하기
      Vec2 pos = box2d.getBodyPixelCoord(body);
      //float a에 body의 회전값 저장하기    
      float a = body.getAngle();
      pushMatrix();
        translate(pos.x,pos.y);
        rotate(-a);
        fill(255);
        stroke(0);
        rectMode(CENTER);
        rect(0,0,w,h);
      popMatrix();
    }
  }
  class Ball {

    //Box2D에서 사용할 body
    Body body;
    //픽셀 단위 반지름
    float radius;

    //Constructor
    //픽셀단위로 위치를 받아 body를 배치함
    //Box2D를 다룰 때 필요한 복잡한 설정을
    //wrapping하고 있음
    Ball(float x, float y, float r_) {
      //객체가 생성될 때 너비와 높이를 정함
      radius = r_;
      
      //body 정의하기
      //BodyDef 정의하기
      BodyDef bd = new BodyDef();
      bd.type = BodyType.DYNAMIC;
      //(x, y)좌표에 body위치 시키기
      bd.position.set(box2d.coordPixelsToWorld(x,y));
      //bd정의에 따라 body 인스턴스 생성하기
      body =  box2d.createBody(bd);
      
      //circle 정의하기
      CircleShape cs = new CircleShape();
      float box2dRadius = box2d.scalarPixelsToWorld(radius);
      //Box2D는 중심에서 경계까지의 길이를 너비와 높이로 삼습니다
      //////프로세싱의 rectMode(RADIUS)가 Box2D에서는 기본설정입니다
      cs.m_radius = box2dRadius;

      //fixture정의, 그리고 fixture와 body 연결하기
      FixtureDef fd = new FixtureDef();
      //모양
      fd.shape = cs;
      //밀도
      fd.density = 1;
      //마찰
      fd.friction = 0.3;
      //반발력
      fd.restitution = 0.7;
      //Fixture와 Body연결하기
      body.createFixture(fd);
    }

    void display() {
      //Vec2클래스에 body의 현재위치 저장하기
      Vec2 pos = box2d.getBodyPixelCoord(body);
      pushMatrix();
        translate(pos.x,pos.y);
        fill(175);
        stroke(0);
        ellipseMode(RADIUS);
        ellipse(0,0,radius,radius);
      popMatrix();
    }
  }
  
  class Floor {

    //Box2D에서 사용할 body
    Body body;
    //픽셀 단위
    float w;
    float h;
  
    //Constructor
    //픽셀단위로 위치를 받아 body를 배치함
    //Box2D를 다룰 때 필요한 복잡한 설정을
    //wrapping하고 있음
    Floor(float x_, float y_, float w_, float h_) {
      //객체가 생성될 때 너비와 높이를 정함
      w = w_;
      h = h_;
         
      //body 정의하기
      //BodyDef 정의하기
      BodyDef bd = new BodyDef();
      //Body type은 STATIC
      //고정된 물체입니다
      bd.type = BodyType.STATIC;
      //(x, y)좌표에 body위치 시키기
      bd.position.set(box2d.coordPixelsToWorld(x_ + w / 2, y_ + h / 2));
      //bd정의에 따라 body 인스턴스 생성하기
      body =  box2d.createBody(bd);
        
      //polygon 정의하기
      PolygonShape ps = new PolygonShape();
      float box2dW = box2d.scalarPixelsToWorld(w/2);
      float box2dH = box2d.scalarPixelsToWorld(h/2);
      //Box2D는 중심에서 경계까지의 길이를 너비와 높이로 삼습니다
      //프로세싱의 rectMode(RADIUS)가 Box2D에서는 기본설정입니다
      ps.setAsBox(box2dW, box2dH);
  
      //fixture정의, 그리고 fixture와 body 연결하기
      FixtureDef fd = new FixtureDef();
      //모양
      fd.shape = ps;
      //밀도
      fd.density = 1;
      //마찰
      fd.friction = 0.3;
      //반발력
      fd.restitution = 0.7;
      //Fixture와 Body연결하기
      body.createFixture(fd);
    }
  
    void display() {
      //Vec2클래스에 body의 현재위치 저장하기
      Vec2 pos = box2d.getBodyPixelCoord(body);
      //float a에 body의 회전값 저장하기    
      float a = body.getAngle();
      pushMatrix();
        translate(pos.x,pos.y);
        rotate(-a);
        fill(255);
        stroke(0);
        rectMode(CENTER);
        rect(0,0,w,h);
      popMatrix();
    }
  }
  
  void keyPressed() {
    if(key == 's' || key == 'S') {
      saveFrame("myDominoes######.jpg");
    }
  }
  
  void mouseReleased() {
    balls.add(new Ball(mouseX, mouseY, 10));
  }