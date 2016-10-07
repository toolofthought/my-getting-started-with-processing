//myWorld
import shiffman.box2d.*;

Box2DProcessing box2d;

void setup() {
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  Vec2 center = box2d.coordPixelsToWorld(width / 2, height / 2);  
}