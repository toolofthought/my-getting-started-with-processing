//myRectPatternOnCaptureTriangle
import processing.video.*;
Capture cam;

int patternScale = 20;
int nX;
int nY;

void setup() {
	size(640, 480);
	smooth();
	nX = width / patternScale;
	nY = height / patternScale;

	String[] cameras = Capture.list();
	println(cameras[0]);
	cam = new Capture(this, cameras[0]);
	//cam = new Capture(this, width, height);
	cam.start();
	//noLoop();
	ellipseMode(CORNER);
}

void draw() {
	if (cam.available()) {
		cam.read();
		cam.loadPixels();
		noStroke();
		for (int x = 0; x < cam.width; x += patternScale) {
			for (int y = 0; y < cam.height; y += patternScale) {
				int location = (cam.width - x - 1) + y * cam.width;
				color c = cam.pixels[location];
				fill(c);
				if (x % (patternScale * 2) == 0) {
					triangle(x - patternScale, y, x, y + patternScale * 2, x + patternScale, y);
				}
      			else {
      				triangle(x-patternScale, y + patternScale * 2, x, y, x + patternScale, y + patternScale * 2);
      			}
			}
		}
	}
}

void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myRectPatternOnCaptureTriangle.png");
	}
}