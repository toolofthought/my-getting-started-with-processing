class Ball {

    //Box2D에서 사용할 body
    Body body;
    //픽셀 단위 너비와 높이
    float radius;
    //Constructor
    //픽셀단위로 위치를 받아 body를 배치함
    //Box2D를 다룰 때 필요한 복잡한 설정을
    //wrapping하고 있음
    Ball(float x, float y, float radius_) {
      //객체가 생성될 때 너비와 높이를 정함
      radius = radius_;
      //body 정의하기
      ////BodyDef 정의하기
      BodyDef bd = new BodyDef();
      bd.type = BodyType.DYNAMIC;
      ////(x, y)좌표에 body위치 시키기
      bd.position.set(box2d.coordPixelsToWorld(x,y));
      ////bd정의에 따라 body 인스턴스 생성하기
      body =  box2d.createBody(bd);
      
      ////polygon 정의하기
      CircleShape cs = new CircleShape();
      cs.m_radius = box2d.scalarPixelsToWorld(radius);
      //////Box2D는 중심에서 경계까지의 길이를 너비와 높이로 삼습니다
      //////프로세싱의 rectMode(RADIUS)가 Box2D에서는 기본설정입니다

      ////fixture정의, 그리고 fixture와 body 연결하기
      FixtureDef fd = new FixtureDef();
      //////모양
      fd.shape = cs;
      //////밀도
      fd.density = 1;
      //////마찰
      fd.friction = 0.01;
      //////반발력
      fd.restitution = 1.0;
      //////Fixture와 Body연결하기
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