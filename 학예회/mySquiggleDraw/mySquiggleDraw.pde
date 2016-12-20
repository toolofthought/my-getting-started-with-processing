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
float camW2H;
float halfWidth;

void setup() {
	fullScreen();
	
	String[] cameras = Capture.list();
	cam = new Capture(this, cameras[0]);
	printArray(cameras);
	cam.start();
	frameRate(30);
	halfWidth = width / 2;
}

void draw() {
	background(255);
	if (cam.available()) {
		cam.read();
		camW2H = (float)cam.width / (float)cam.height;
		PImage original = cam.copy();
		cam.filter(GRAY);
		cam.filter(BLUR, 2);
		target = createShape(GROUP);
		noFill();
		stroke(100, 20, 20);

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
		strokeWeight(1);
		imageMode(CENTER);
		image(original, width / 4, height / 2, halfWidth, halfWidth / camW2H);
		target.scale(halfWidth / cam.width);
		shape(target, halfWidth, height / 2 - halfWidth / camW2H / 2);

	}
}

void keyPressed() {
	if (key == 's' || key == 'S') {
		saveFrame("mySquiggleDraw.png");
	}
}