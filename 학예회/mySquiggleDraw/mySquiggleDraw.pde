//mySquiggleDraw
import processing.video.*;
Capture cam;
PShape target;


int stepX = 2;
int stepY = 10;
int myBrightness;
int inverseMyBrightness;
float frequency;
float amplitude;
float theta;
;

void setup() {
	size(1280, 480);
	
	String[] cameras = Capture.list();
	cam = new Capture(this, cameras[0]);
	printArray(cameras);
	cam.start();
	frameRate(30);
}

void draw() {
	background(255);
	if (cam.available()) {
		cam.read();
		PImage original = cam.copy();
		cam.filter(GRAY);
		cam.filter(BLUR, 2);
		target = createShape(GROUP);
		noFill();
		stroke(100, 20, 20);

		strokeWeight(0.5);
		for (int y = 0; y < cam.height; y += stepY) {
			PShape line = createShape(PShape.PATH);
			line.beginShape();
			theta = 0.0;
			for (int x = 0; x < cam.width; x += stepX) {
				myBrightness = (int)brightness(cam.get(x, y));
				inverseMyBrightness = 255 - myBrightness;
				frequency = map(inverseMyBrightness, 0, 255, 0, 3);
				amplitude = map(inverseMyBrightness, 0, 255, 0, stepY);
				theta += frequency;
				line.vertex(x, y + sin(theta) * amplitude);
			}
			line.endShape();
			target.addChild(line);
		}

		shape(target, width / 2, 0);
		image(original, 0, 0);
	}
}

void keyPressed() {
	if (key == 's' || key == 'S') {
		saveFrame("mySquiggleDraw.png");
	}
}