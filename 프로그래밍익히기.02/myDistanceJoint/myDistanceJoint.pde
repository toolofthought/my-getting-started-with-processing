 //myDistanceJoint

  //Box2DProcessing class
  import shiffman.box2d.*;
  //BodyDef, Body, FixtureDef, Fixture classes
  import org.jbox2d.dynamics.*;
  //Vec2 class
  import org.jbox2d.common.*;
  //PolygonShape class
  import org.jbox2d.collision.shapes.*;
  import org.jbox2d.dynamics.joints.*;

  Box2DProcessing box2d;
  Box origin;
  Box left;
  Box right;
  
  Rod first;
  Rod second;

  void setup() {
    size(800, 600);
    background(255);

    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0, -9.8);
    
    origin = new Box(width / 2, height / 4, 40, 40, 1, false);
    left = new Box(width / 2, height * 2 / 4, 40, 40, 10,  true);
    right = new Box(width * 3 / 4, height * 2 / 4, 40, 40, 1, true);
    
    first = new Rod(origin, left);
    second = new Rod(left, right);
    
  }

  void draw() {
    background(255);
    box2d.step();
    first.display();
    second.display();
    origin.display();
    left.display();
    right.display();
    
    //saveFrame("frames/myDistanceJoint######.png");
    

  }

  class Box {
  
    float w;
    float h;

    Body body;
    
    Box(float x_, float y_, float w_, float h_, float density_, boolean isDynamic) {
      w = w_;
      h = h_;

      BodyDef bd = new BodyDef();
      if (isDynamic) {
        bd.type = BodyType.DYNAMIC;
      }
      else {
        bd.type = BodyType.STATIC;
      }
      bd.position.set(box2d.coordPixelsToWorld(x_, y_));
      body =  box2d.createBody(bd);
      PolygonShape ps = new PolygonShape();
      
      float box2dW = box2d.scalarPixelsToWorld(w/2);
      float box2dH = box2d.scalarPixelsToWorld(h/2);
      ps.setAsBox(box2dW, box2dH);

      FixtureDef fd = new FixtureDef();
      fd.shape = ps;
      fd.density = density_;
      fd.friction = 0.3;
      fd.restitution = 0.9;
      body.createFixture(fd);
    }

    void display() {
      rectMode(CENTER);
      Vec2 pos = box2d.getBodyPixelCoord(body);
      pushMatrix();
        translate(pos.x, pos.y);
        rect(0, 0, w, h);
      popMatrix();
    }
  }
  
  class Rod {
      Box left;
      Box right;
      DistanceJoint ds;
      
      Rod(Box a, Box b) {
        left = a;
        right = b;
        DistanceJointDef djd = new DistanceJointDef();
        djd.bodyA = left.body;
        djd.bodyB = right.body;
        djd.dampingRatio = 1;
        djd.frequencyHz = 0;
   
        
        Vec2 aLocation = a.body.getTransform().p;
        Vec2 bLocation = b.body.getTransform().p;
        
        djd.length = aLocation.subLocal(bLocation).length();
        ds = (DistanceJoint) box2d.world.createJoint(djd);
      }
      
      void display() {
        Vec2 l = box2d.getBodyPixelCoord(left.body);
        Vec2 r = box2d.getBodyPixelCoord(right.body);
        line(l.x, l.y, r.x, r.y);
      }
    }
    
     
  void keyPressed() {
    if(key == 's' || key == 'S') {
      saveFrame("myDistanceJoint######.png");
    }
  }