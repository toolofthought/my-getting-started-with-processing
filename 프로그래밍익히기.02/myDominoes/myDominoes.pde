  //myDominos

  //myBoxClass: importing necessary classes
  //Box2DProcessing class
  import shiffman.box2d.*;
  //BodyDef, Body, FixtureDef, Fixture classes
  import org.jbox2d.dynamics.*;
  //Vec2 class
  import org.jbox2d.common.*;
  //PolygonShape, CircleShape classes
  import org.jbox2d.collision.shapes.*;
  
  Box2DProcessing box2d;
  ArrayList<Domino> dominoes;
  ArrayList<Ball> balls;
  Floor floor;
  Floor inAir;
  Floor left;
  Floor right;

  void setup() {
    size(480, 360);
    background(255);
    dominoes = new ArrayList<Domino>();
    
    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0, -9.8);
    floor = new Floor(width / 2, height - 16 / 2, width, 16);
    inAir = new Floor(width / 2, height / 2 - 16 / 2, width / 2, 16);
    left = new Floor(0 + 16 / 2, height * 3 / 4, 16, height / 2 - 16 * 2);
    right = new Floor(width - 16 / 2, height * 3 / 4, 16, height / 2 - 16 * 2);
    
    int n = 25;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
      }
    }
  }

  void draw() {
    background(255);
    box2d.step();
    if(mousePressed) {
      balls.add(new Ball(mouseX, mouseY));
    }
    
    for(Ball b: balls) {
      b.display();
    }
    
    floor.display();
    inAir.display();
    left.display();
    right.display();
  }
  
  
  void keyPressed() {
    if(key == 's' || key == 'S') {
      saveFrame("myDominoes######.jpg");
    }
  }