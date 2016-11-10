import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;
Box floor;
Box floor2;
Box move;
ArrayList<Bird> birds;

int clickX;
int clickY;
int offsetX;
int offsetY;


void setup() {
    size(1600, 600);
    background(255);

    box2d = new Box2DProcessing(this);
    box2d.createWorld();
    box2d.setGravity(0, -9.8);

    floor = new Box(0, height - 20, width-1000, height, false, false);
    floor2 = new Box(width-1000, height - 20, width, height, false, true);
    move= new Box(50,height-50,70,height-30,true,false);
    clickX = width / 4;
    clickY = height / 2;
    birds = new ArrayList<Bird>();
    birds.add(new Bird(0, 0));

}

void draw() {
    background(255);

    for (Bird bird : birds) {
        bird.display();
    box2d.step();
    floor.display(false);
    floor2.display(true);
    move.display(false);
    if (mousePressed) {
        line(clickX, clickY, mouseX, mouseY);
    }
    }

}

class Box {
    Body body;
    float w;
    float h;

    Box(float x1, float y1, float x2, float y2, boolean isDynamic,boolean isSlow) {

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
        
        if (isSlow) {
            fd.density = 1;
            fd.friction=20;
            fd.restitution = 0.3;
        }
        else {
            fd.density = 1;
            fd.friction=0.3;
            fd.restitution = 0.3;
        }
        
 
        body.createFixture(fd);
        
    }

    void display(boolean isSlow) {
        Vec2 pos = box2d.getBodyPixelCoord(body);
        float a = body.getAngle();
        pushMatrix();
            translate(pos.x,pos.y);
            rotate(-a);
            if(isSlow){
              fill(70);
            }
            else {
              fill(175);
            }
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