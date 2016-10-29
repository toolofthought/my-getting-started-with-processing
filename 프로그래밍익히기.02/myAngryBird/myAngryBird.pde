  //myAngryBird
  
  import shiffman.box2d.*;
  import org.jbox2d.dynamics.*;
  import org.jbox2d.common.*;
  import org.jbox2d.collision.shapes.*;

  Box2DProcessing box2d;
  ArrayList<Box> castle;
  ArrayList<Bird> birds;
  Box floor;
  
  int clickX;
  int clickY;
  int offsetX;
  int offsetY;
  

  void setup() {
    size(800, 600);
    background(255);

    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0, -9.8);
    
    castle = new ArrayList<Box>();
    // Let's build up castle!
    buildCastle();
    
    floor = new Box(0, height - 20, width, height, false);
    
    birds = new ArrayList<Bird>();
    birds.add(new Bird(0, 0));
    // birds.get(0).body.setLinearVelocity(new Vec2(20, 0));
  }

  void draw() {
    background(255);
    box2d.step();
    
    for (Box box : castle) {
      box.display();
    }
    
    for (Bird bird : birds) {
      bird.display();
    }  
    
    floor.display();
    
    if (mousePressed) {
      line(clickX, clickY, mouseX, mouseY);
    }
    
  }
  
  class Box {
    Body body;
    float w;
    float h;
    
    Box(float x1, float y1, float x2, float y2, boolean isDynamic) {
      
      w = abs(x1 - x2);
      h = abs(y1 - y2);
      
      BodyDef bd = new BodyDef();
      if (isDynamic) {
        bd.type = BodyType.DYNAMIC;
      }
      else {
        bd.type = BodyType.STATIC;
      }
      //body의 중심
      bd.position.set(box2d.coordPixelsToWorld((x1 + x2) / 2, (y1 + y2) / 2));
      body = box2d.createBody(bd);
      
      PolygonShape ps = new PolygonShape();
      float box2dW = box2d.scalarPixelsToWorld(w / 2);
      float box2dH = box2d.scalarPixelsToWorld(h / 2);
      ps.setAsBox(box2dW, box2dH);
      
      FixtureDef fd = new FixtureDef();
      fd.shape = ps;
      fd.density = 1;
      fd.friction = 0.3;
      fd.restitution = 0.9;
      body.createFixture(fd);
    }
    
    void display() {
      Vec2 pos = box2d.getBodyPixelCoord(body);
      float a = body.getAngle();
      pushMatrix();
        translate(pos.x,pos.y);
        rotate(-a);
        fill(175);
        stroke(0);
        rectMode(CENTER);
        rect(0,0,w,h);
      popMatrix();
    }
  }
  
  class Bird {
    Body body;
    float r = 20;
    
    Bird(float x, float y) {
      this(x, y, 0, 0);
    }
    
    Bird(float x, float y, float velocityX, float velocityY) {
      BodyDef bd =  new BodyDef();
      bd.type = BodyType.DYNAMIC;
      bd.position.set(box2d.coordPixelsToWorld(x, y));
      body = box2d.createBody(bd);
      float box2dVelocityX = box2d.scalarPixelsToWorld(velocityX);
      float box2dVelocityY = box2d.scalarPixelsToWorld(velocityY);
      
      body.setLinearVelocity(new Vec2(box2dVelocityX, box2dVelocityY));
      
      CircleShape cs = new CircleShape();
      float box2dRadius = box2d.scalarPixelsToWorld(r);
      cs.m_radius = box2dRadius;
      FixtureDef fd = new FixtureDef();
      fd.shape = cs;
      fd.density = 5;
      fd.friction = 0.3;
      fd.restitution = 0.9;
      body.createFixture(fd);
      
      println(box2dVelocityX, box2dVelocityY);

      
    }
          
    void display() {
      Vec2 pos = box2d.getBodyPixelCoord(body);
      pushMatrix();
        translate(pos.x,pos.y);
        fill(200, 153, 153);
        stroke(0);
        ellipseMode(RADIUS);
        ellipse(0,0,r,r);
      popMatrix();
    }
  }
     
  void keyPressed() {
    if(key == 's' || key == 'S') {
      saveFrame("myAngryBird######.png");
    }
  }
  
  void mousePressed() {
    clickX = mouseX;
    clickY = mouseY;
    
  }
  
  void mouseReleased() {
    birds.add(new Bird(clickX, clickY, clickX - mouseX, mouseY - clickY));
  }
  
  void buildCastle() {
    castle.add(new Box(380, 120, 420, 220, true));
    castle.add(new Box(300, 220, 500, 260, true));
    castle.add(new Box(300, 260, 340, 360, true));
    castle.add(new Box(460, 260, 500, 360, true));
    castle.add(new Box(260, 360, 540, 400, true));
    castle.add(new Box(260, 400, 300, 580, true));
    castle.add(new Box(500, 400, 540, 580, true));
    castle.add(new Box(160, 500, 200, 580, true));
    castle.add(new Box(600, 500, 640, 580, true));
  }